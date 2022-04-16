/**
 * @description Mocker for trigger functionality
 * @author Tom Wilkins
 * @date 2022-04-15
 * @group Triggers
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class TriggerMocker {
  /**
   * @description Sets a mock context for before insert state
   * @param triggerNew Trigger.new records to be set
   */
  public void setBeforeInsertMock(List<SObject> triggerNew) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isBeforeInsert', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerNew', new ReturnValueMethodMock(triggerNew))
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for before update state
   * @param triggerNew Trigger.new records to be set
   * @param triggerOld Trigger.old records to be set
   */
  public void setBeforeUpdateMock(
    List<SObject> triggerNew,
    List<SObject> triggerOld
  ) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isBeforeUpdate', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerNew', new ReturnValueMethodMock(triggerNew))
      .setMethodMock(
        'getTriggerNewMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerNew))
      )
      .setMethodMock('getTriggerOld', new ReturnValueMethodMock(triggerOld))
      .setMethodMock(
        'getTriggerOldMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerOld))
      )
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for before delete state
   * @param triggerNew Trigger.old records to be set
   */
  public void setBeforeDeleteMock(List<SObject> triggerOld) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isBeforeDelete', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerOld', new ReturnValueMethodMock(triggerOld))
      .setMethodMock(
        'getTriggerOldMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerOld))
      )
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for after insert state
   * @param triggerNew Trigger.new records to be set
   */
  public void setAfterInsertMock(List<SObject> triggerNew) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isAfterInsert', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerNew', new ReturnValueMethodMock(triggerNew))
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for after update state
   * @param triggerNew Trigger.new records to be set
   * @param triggerOld Trigger.old records to be set
   */
  public void setAfterUpdateMock(
    List<SObject> triggerNew,
    List<SObject> triggerOld
  ) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isAfterUpdate', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerNew', new ReturnValueMethodMock(triggerNew))
      .setMethodMock(
        'getTriggerNewMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerNew))
      )
      .setMethodMock('getTriggerOld', new ReturnValueMethodMock(triggerOld))
      .setMethodMock(
        'getTriggerOldMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerOld))
      )
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for after delete state
   * @param triggerNew Trigger.old records to be set
   */
  public void setAfterDeleteMock(List<SObject> triggerOld) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isAfterDelete', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerOld', new ReturnValueMethodMock(triggerOld))
      .setMethodMock(
        'getTriggerOldMap',
        new ReturnValueMethodMock(new Map<Id, SObject>(triggerOld))
      )
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
  /**
   * @description Sets a mock context for after undelete state
   * @param triggerNew Trigger.new records to be set
   */
  public void setAfterUndeleteMock(List<SObject> triggerNew) {
    ClassMocker mocker = new ClassMocker()
      .setDefaultMethodMock(new ReturnValueMethodMock(false))
      .setMethodMock('isAfterUndelete', new ReturnValueMethodMock(true))
      .setMethodMock('getTriggerNew', new ReturnValueMethodMock(triggerNew))
      .setMethodMock('addError', new AddErrorMethodMock());
    Triggers.ctx = (TriggerContext) System.Test.createStub(
      TriggerContext.class,
      mocker
    );
  }
}
