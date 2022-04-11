/**
 * @description Static accessor for Trigger functionality. Provides convenient access
 * while supporting good design and mockability for unit tests
 * @author Tom Wilkins
 * @date 2022-04-11
 * @group Triggers
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class Triggers {
  @TestVisible
  global static TriggerSettings settings {
    get {
      if (settings == null) {
        settings = new TriggerSettings();
      }
      return settings;
    }
    set;
  }
}
