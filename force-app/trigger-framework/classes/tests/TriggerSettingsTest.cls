@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerSettingsTest {
  @IsTest
  private static void executeHandlers_lazyLoad_evaluateToTrue() {
    TriggerSettings settings = new TriggerSettings();
    System.Test.startTest();
    Boolean shouldExecute = settings.executeHandlers;
    System.Test.stopTest();
    System.assertEquals(
      true,
      shouldExecute,
      'Default getter should return true'
    );
  }
  @IsTest
  private static void enableTriggers_propsSetToFalse_evaluateToTrue() {
    TriggerSettings settings = new TriggerSettings();
    settings.executeHandlers = false;
    System.Test.startTest();
    settings.enableTriggers();
    System.Test.stopTest();
    System.assertEquals(
      true,
      settings.executeHandlers,
      'Should set execution of handlers to true'
    );
  }
  @IsTest
  private static void disableTriggers_propsSetToTrue_evaluateToFalse() {
    TriggerSettings settings = new TriggerSettings();
    settings.executeHandlers = true;
    System.Test.startTest();
    settings.disableTriggers();
    System.Test.stopTest();
    System.assertEquals(
      false,
      settings.executeHandlers,
      'Should set execution of handlers to false'
    );
  }
  @IsTest
  private static void shouldExecuteTriggers_propsSetToFalse_evaluateToFalse() {
    TriggerSettings settings = new TriggerSettings();
    settings.executeHandlers = false;
    System.Test.startTest();
    Boolean shouldExecute = settings.shouldExecuteTriggers();
    System.Test.stopTest();
    System.assertEquals(
      false,
      shouldExecute,
      'Should return false to match internal settings'
    );
  }
}
