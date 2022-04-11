/**
 * @description Virtual class of which all trigger handlers should implement.
 * Provides base behavior (do nothing) so handlers should only focus on implementing the contexts
 * that matter
 * @author Tom Wilkins
 * @data 2022-04-11
 * @group Automation
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing virtual class TriggerHandler implements ITriggerHandler {
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doBeforeInsert() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doBeforeUpdate() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doBeforeDelete() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doAfterInsert() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doAfterUpdate() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doAfterDelete() {
    return;
  }
  /**
   * @description Default no-op behavior
   * @see [ITriggerHandler](/docs/Automation/ITriggerHandler.md)
   */
  global virtual void doAfterUndelete() {
    return;
  }
}
