/**
 * @description Base interface for trigger handlers. This interface is necessary because
 * a virtual class is used to provide default behavior, so we need to be able to cast to an abstraction
 * to afford polymorphism in the dispacther.
 * This will never be extended by subscribers, but rather they will extend the TriggerHandler virtual class
 * @author Tom Wilkins
 * @date 2022-04-11
 * @group Automation
 */
public interface ITriggerHandler {
  /**
   * @description Execute before insert logic
   */
  void doBeforeInsert();
  /**
   * @description Execute before update logic
   */
  void doBeforeUpdate();
  /**
   * @description Execute before delete logic
   */
  void doBeforeDelete();
  /**
   * @description Execute after insert logic
   */
  void doAfterInsert();
  /**
   * @description Execute after update logic
   */
  void doAfterUpdate();
  /**
   * @description Execute after delete logic
   */
  void doAfterDelete();
  /**
   * @description Execute after undelete logic
   */
  void doAfterUndelete();
}
