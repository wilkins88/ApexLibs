@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class SimpleFeatureResolverTest {
  @IsTest
  private static void resolve_isActive_returnTrue() {
    FeatureFlagSetting__mdt setting = new FeatureFlagSetting__mdt(
      IsActive__c = true
    );
    SimpleFeatureResolver resolver = new SimpleFeatureResolver();
    resolver.config = setting;
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(true, result, 'Should return true based on config');
  }

  @IsTest
  private static void resolve_isNotActive_returnFalse() {
    FeatureFlagSetting__mdt setting = new FeatureFlagSetting__mdt(
      IsActive__c = false
    );
    SimpleFeatureResolver resolver = new SimpleFeatureResolver();
    resolver.config = setting;
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(false, result, 'Should return false based on config');
  }
}
