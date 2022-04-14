@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerConfigSelectorTest {
  @IsTest
  private static void getTriggerSettings_forAccountNoConfig_returnNoSettings() {
    // mostly a coverage test
    // could potentially package a private custom metadata type for the test as well
    // but seems like overkill
    TriggerConfigSelector selector = new TriggerConfigSelector();
    System.Test.startTest();
    List<SObjectTriggerSetting__mdt> settings = selector.getTriggerSettings(
      Account.getSObjectType()
    );
    System.Test.stopTest();
    System.assertEquals(0, settings.size(), 'Should return no settings');
  }
}
