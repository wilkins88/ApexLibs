@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class FeatureFlagConfigSelectorTest {
    // coverage test to hit the query
    @IsTest
    private static void getFeatureConfig_noConfig_returnNull() {
        FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
        System.Test.startTest();
        FeatureFlagSetting__mdt setting = selector.getFeatureConfig('SomeFeatureThatDoesntExist');
        System.Test.stopTest();
        System.assertEquals(null, setting, 'Should return null since the setting does not exist');
    }
}
