/**
 * @description Resolver for RBAC (permissions) based feature flags
 * @date 2022-07-04
 * @group Env
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
public inherited sharing class RBACFeatureResolver extends FeatureFlagResolver {
  @TestVisible
  private FeatureFlagConfigSelector selector {
    get {
      if (this.selector == null) {
        this.selector = new FeatureFlagConfigSelector();
      }
      return this.selector;
    }
    set;
  }
  /**
   * @description Returns true if the configuration is flagged to active
   * @see [FeatureFlagResolver](/docs/Env/FeatureResolver.md)
   * @return True if feature is active, false otherwise
   */
  public override Boolean resolve() {
    String rbacCategory = this.config.RBACCategory__c;
    Set<String> rbacValue = new Set<String>(
      this.config.RBACCategoryValue__c.split(',')
    );
    // maybe update this to be some sort of strategy in the future
    // but didn't seem waranted now
    switch on (rbacCategory) {
      when 'Profile' {
        List<Profile> validProfile = this.selector.getProfiles(
          new Set<Id>{ UserInfo.getProfileId() }
        );
        return (validProfile.isEmpty())
          ? false
          : (rbacValue.contains(validProfile[0].Name));
      }
      when 'Permission Set' {
        return !(this.selector.getPermissionSetAssignments(
            new Set<Id>{ UserInfo.getUserId() },
            rbacValue
          )
          .isEmpty());
      }
      when 'Custom Permission' {
        Boolean hasPerm = false;
        for (String value : rbacValue) {
          hasPerm = hasPerm || this.selector.getCustomPermissionValue(value);
        }
        return hasPerm;
      }
      when 'Public Group' {
        return !(this.selector.getGroupMembers(
            new Set<Id>{ UserInfo.getUserId() },
            rbacValue
          )
          .isEmpty());
      }
      when else {
        return false;
      }
    }
  }
}
