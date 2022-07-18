/**
 * @description Selector for retrieving configuration for feature flags
 * @date 2022-06-25
 * @group Env
 */
public inherited sharing class FeatureFlagConfigSelector {
  /**
   * @description returns a feature flag config record
   * @param featureDevName Developer name of the feature flag config record
   * @return Record if it exists, null otherwise
   */
  public FeatureFlagSetting__mdt getFeatureConfig(String featureDevName) {
    SObjectInspector inspector = Data.metadata.createSObjectInspector(
      FeatureFlagSetting__mdt.getSobjectType()
    );
    List<String> fields = new List<String>();
    for (Schema.SObjectField field : inspector.getAllFields()) {
      fields.add(String.valueOf(field));
    }
    String query =
      'SELECT ' +
      String.join(fields, ',') +
      ' FROM FeatureFlagSetting__mdt ' +
      ' WHERE DeveloperName = :featureDevName';
    List<FeatureFlagSetting__mdt> flag = (List<FeatureFlagSetting__mdt>) Database.query(
      String.escapeSingleQuotes(query)
    );
    return flag.isEmpty() ? null : flag[0];
  }
  /**
   * @description returns profiles for the provided profile Ids
   * @param profileIds Ids of profiles to query
   * @return Profiles for the provided ids
   */
  @SuppressWarnings('PMD.ApexCRUDViolation')
  public List<Profile> getProfiles(Set<Id> profileIds) {
    return [SELECT Id, Name FROM Profile WHERE Id IN :profileIds];
  }
  /**
   * @description returns permission set assignments for the provided users and permission sets
   * @param userIds Ids of users to retrieve assignments for
   * @param permissionSetNames Names of the permission sets to retrieve
   * @return Permission set assignments
   */
  @SuppressWarnings('PMD.ApexCRUDViolation')
  public List<PermissionSetAssignment> getPermissionSetAssignments(
    Set<Id> userIds,
    Set<String> permissionSetNames
  ) {
    return [
      SELECT Id, AssigneeId, PermissionSetId
      FROM PermissionSetAssignment
      WHERE AssigneeId IN :userIds AND PermissionSet.Name IN :permissionSetNames
    ];
  }
  /**
   * @description Wrapper around the FeatureManagement checkpermission functionality
   * to provide an avenue for mocking and decoupling
   * This probably doesn't make much sense in a selector (as opposed to service),
   * but keeping it here for consolidaiton purposes
   * @param permissionName API name of the custom permission
   * @return True if the user has the permission, false otherwise
   */
  public Boolean getCustomPermissionValue(String permissionName) {
    return FeatureManagement.checkPermission(permissionName);
  }

  /**
   * @description Returns group members for the provided users and groups
   * @param userIds Ids of users to retrieve members for
   * @param devNames DeveloperName of groups to retrieve
   * @return Group members
   */
  @SuppressWarnings('PMD.ApexCRUDViolation')
  public List<GroupMember> getGroupMembers(
    Set<Id> userIds,
    Set<String> devNames
  ) {
    return [
      SELECT Id, UserOrGroupId, GroupId
      FROM GroupMember
      WHERE UserOrGroupId IN :userIds AND Group.DeveloperName IN :devNames
    ];
  }
}
