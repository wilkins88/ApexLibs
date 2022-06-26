/**
 * @description Primary interface for working with feature flags
 * @date 2022-06-21
 * @group Env
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class FeatureFlag {
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
  // context caching for performance reasons
  // may update this to allow injection of a platform cache manager
  // in the future
  @TestVisible
  private static Map<String, Boolean> featureMap {
    get {
      if (featureMap == null) {
        featureMap = new Map<String, Boolean>();
      }
      return featureMap;
    }
    set;
  }
  /**
   * @description Returns whether or not the feature is on
   * @param featureName the name of the feature to check
   * @return True if feature is on, false if it is not or has improper config
   */
  global Boolean isOn(String featureName) {
    if (featureMap.containsKey(featureName)) {
      return featureMap.get(featureName);
    }
    FeatureFlagSetting__mdt config = this.selector.getFeatureConfig(
      featureName
    );
    // no mapped resolver, so just return that the feature is off
    if (config == null || String.isBlank(config.ClassName__c)) {
      return false;
    }
    FeatureFlagResolver resolver = (FeatureFlagResolver) System.Type.forName(
        config.ClassName__c
      )
      .newInstance();
    resolver.setFeatureConfig(config);
    Boolean result = resolver.resolve();
    featureMap.put(featureName, result);
    return result;
  }
}
