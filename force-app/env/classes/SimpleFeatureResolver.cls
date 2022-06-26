global inherited sharing class SimpleFeatureResolver extends FeatureFlagResolver {
  global override Boolean resolve() {
    return this.config.IsActive__c;
  } //
}
