/**
 * @description Wrapper around the System Trigger libs to provide opportunities for QoL and
 * decoupling from sys libs for mocking, DI, etc.
 * @author Tom Wilkins
 * @date 2022-04-11
 * @group Triggers
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class TriggerContext {
  /**
   * @description Wrapper for Trigger.new
   * @return Trigger.new records
   */
  global List<SObject> getTriggerNew() {
    return Trigger.new;
  }
  /**
   * @description Wrapper for Trigger.newMap
   * @return Trigger.newMap record map
   */
  global Map<Id, SObject> getTriggerNewMap() {
    return Trigger.newMap;
  }
  /**
   * @description Wrapper for Trigger.old
   * @return Trigger.old records
   */
  global List<SObject> getTriggerOld() {
    return Trigger.old;
  }
  /**
   * @description Wrapper for Trigger.newMap
   * @return Trigger.newMap record map
   */
  global Map<Id, SObject> getTriggerOldMap() {
    return Trigger.oldMap;
  }
  /**
   * @description Checks if the trigger context is before insert
   * @return True if before insert, false otherwise
   */
  global Boolean isBeforeInsert() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_INSERT;
  }
  /**
   * @description Checks if the trigger context is before update
   * @return True if before update, false otherwise
   */
  global Boolean isBeforeUpdate() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_UPDATE;
  }
  /**
   * @description Checks if the trigger context is before delete
   * @return True if before delete, false otherwise
   */
  global Boolean isBeforeDelete() {
    return Trigger.operationType == System.TriggerOperation.BEFORE_DELETE;
  }
  /**
   * @description Checks if the trigger context is after insert
   * @return True if after insert, false otherwise
   */
  global Boolean isAfterInsert() {
    return Trigger.operationType == System.TriggerOperation.AFTER_INSERT;
  }
  /**
   * @description Checks if the trigger context is after update
   * @return True if after update, false otherwise
   */
  global Boolean isAfterUpdate() {
    return Trigger.operationType == System.TriggerOperation.AFTER_UPDATE;
  }
  /**
   * @description Checks if the trigger context is after delete
   * @return True if after delete, false otherwise
   */
  global Boolean isAfterDelete() {
    return Trigger.operationType == System.TriggerOperation.AFTER_DELETE;
  }
  /**
   * @description Checks if the trigger context is after undelete
   * @return True if after undelete, false otherwise
   */
  global Boolean isAfterUndelete() {
    return Trigger.operationType == System.TriggerOperation.AFTER_UNDELETE;
  }
  /**
   * @description Wrapper around the trigger record.addError method -- can only be used in trigger contexts
   * @param record SObject record to add the error to
   * @param errorMessage Error Message to be added to the record
   */
  global void addError(SOBject record, String errorMessage) {
    record.addError(errorMessage);
  }
}
