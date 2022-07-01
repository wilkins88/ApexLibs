/**
 * @description Static accessor class for working with environment related utils and services
 * @date 2022-06-21
 * @group Env
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class Environment {
  @TestVisible
  global static FeatureFlag feature {
    get {
      if (feature == null) {
        feature = new FeatureFlag();
      }
      return feature;
    }
    private set;
  }
}
