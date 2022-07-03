/**
 * @description Base class for feature flag resolvers to implement
 * @date 2022-06-25
 * @group Env
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing abstract class FeatureFlagResolver {
  @TestVisible
  protected FeatureFlagSetting__mdt config;

  /**
   * @description Resolves whether or not the feature is turned on
   * @return True if feature is on, false otherwise
   */
  global abstract Boolean resolve();
  /**
   * @description Sets the feature config
   * @param config Feature flag setting to use when resolving
   */
  public void setFeatureConfig(FeatureFlagSetting__mdt config) {
    this.config = config;
  }
  /**
   * @description Getter for the configuration stored in the resolver
   * @return Resolver config
   */
  global FeatureFlagSetting__mdt getConfig() {
    return this.config;
  }
}
