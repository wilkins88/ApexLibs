/**
 * @description Resolver for simple feature flags (Global on/off)
 * @date 2022-06-26
 * @group Env
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SimpleFeatureResolver extends FeatureFlagResolver {
  /**
   * @description Returns true if the configuration is flagged to active
   * @see [FeatureFlagResolver](/docs/Env/FeatureResolver.md)
   * @return True if feature is active, false otherwise
   */
  global override Boolean resolve() {
    return this.config.IsActive__c;
  }
}
