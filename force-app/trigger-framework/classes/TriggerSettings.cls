/**
 * @description Settings class that is used to provide an API for tuning the behavior of the
 * Trigger framework
 * @author Tom Wilkins
 * @date 2022-04-11
 * @group Triggers
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class TriggerSettings {
  @TestVisible
  private Boolean executeHandlers {
    get {
      if (this.executeHandlers == null) {
        this.executeHandlers = true;
      }
      return this.executeHandlers;
    }
    set;
  }
  /**
   * @description Enables trigger handlers to execute. This is the default behavior
   * but can be invoked to enable if triggers were disabled earlier in the context
   */
  global void enableTriggers() {
    this.executeHandlers = true;
  }
  /**
   * @description Disabled triggers handlers so they are not executed. Note that
   * careful though should be put into whether or not triggers should be disabled
   * for any given context, but this is useful for things suck as data scripts
   */
  global void disableTriggers() {
    this.executeHandlers = false;
  }
  /**
   * @description Returns whether or not the trigger handlers should be executed
   * Currently not exposed publicly and is only used within the package
   * @return Whether or not trigger handlers should be executed
   */
  public Boolean shouldExecuteTriggers() {
    return this.executeHandlers;
  }
}
