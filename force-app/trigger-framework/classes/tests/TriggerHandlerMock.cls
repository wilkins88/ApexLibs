/**
 * @description Mock trigger handler used in trigger package test
 * @author Tom Wilkins
 * @date 2022-04-15
 * @group Triggers
 */
@IsTest
public inherited sharing class TriggerHandlerMock extends TriggerHandler {
  public static final String ERROR_MESSAGE = 'Add Error';
  public Boolean beforeInsert;
  public Boolean beforeUpdate;
  public Boolean beforeDelete;
  public Boolean afterInsert;
  public Boolean afterUpdate;
  public Boolean afterDelete;
  public Boolean afterUndelete;
  public Boolean shouldThrowException;
  /**
   * @description Constructor
   * @param shouldThrowException Whether or not the handler should add error
   */
  public TriggerHandlerMock(Boolean shouldThrowException) {
    this.shouldThrowException = shouldThrowException;
  }
  /**
   * @description Default Contructor, does not add error
   */
  public TriggerHandlerMock() {
    this(false);
  }
  /**
   * @see ITriggerHandler#doBeforeInsert
   */
  public override void doBeforeInsert() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.beforeInsert = true;
  }
  /**
   * @see ITriggerHandler#doBeforeUpdate
   */
  public override void doBeforeUpdate() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.beforeUpdate = true;
  }
  /**
   * @see ITriggerHandler#doBeforeDelete
   */
  public override void doBeforeDelete() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.beforeDelete = true;
  }
  /**
   * @see ITriggerHandler#doAfterInsert
   */
  public override void doAfterInsert() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.afterInsert = true;
  }
  /**
   * @see ITriggerHandler#doAfterUpdate
   */
  public override void doAfterUpdate() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.afterUpdate = true;
  }
  /**
   * @see ITriggerHandler#doAfterDelete
   */
  public override void doAfterDelete() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.afterDelete = true;
  }
  /**
   * @see ITriggerHandler#doAfterUndelete
   */
  public override void doAfterUndelete() {
    if (this.shouldThrowException) {
      throw new DMLException(ERROR_MESSAGE);
    }
    this.afterUndelete = true;
  }
}
