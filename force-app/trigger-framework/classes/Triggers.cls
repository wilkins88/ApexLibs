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
    private set;
  }
  @TestVisible
  global static TriggerContext ctx {
    get {
      if (ctx == null) {
        ctx = new TriggerContext();
      }
      return ctx;
    }
    private set;
  }
  /**
   * @description setter for the trigger context from within the package
   * @param ctx the Trigger Context to be set
   */
  public static void setContext(TriggerContext ctx) {
    ctx = ctx;
  }
}
