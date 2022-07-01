@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class FeatureFlagTest {
  @IsTest
  private static void isOn_cachedFeature_returnCachedValue() {
    FeatureFlag ff = new FeatureFlag();
    FeatureFlag.featureMap.put('someFeature', true);
    System.Test.startTest();
    Boolean result = ff.isOn('someFeature');
    System.Test.stopTest();
    System.assertEquals(true, result, 'Should return cached true value');
  }
  @IsTest
  private static void isOn_nullConfig_returnFalse() {
    FeatureFlag ff = init(null);
    System.Test.startTest();
    Boolean result = ff.isOn('someFeature');
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false value when feature config is null'
    );
  }
  @IsTest
  private static void isOn_emptyClass_returnFalse() {
    FeatureFlag ff = init(new FeatureFlagSetting__mdt());
    System.Test.startTest();
    Boolean result = ff.isOn('someFeature');
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false value when feature config is null'
    );
  }
  @IsTest
  private static void isOn_simpleFeatureFlag_returnConfiguredTrue() {
    FeatureFlag ff = init(
      new FeatureFlagSetting__mdt(
        IsActive__c = true,
        ClassName__c = 'SimpleFeatureResolver'
      )
    );
    System.Test.startTest();
    Boolean result = ff.isOn('someFeature');
    System.Test.stopTest();
    System.assertEquals(
      true,
      result,
      'Should return true value when feature config is active'
    );
  }

  private static FeatureFlag init(FeatureFlagSetting__mdt mockedSetting) {
    FeatureFlag ff = new FeatureFlag();
    ff.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getFeatureConfig' => new ReturnValueMethodMock(mockedSetting)
        }
      )
    );
    return ff;
  }
}
