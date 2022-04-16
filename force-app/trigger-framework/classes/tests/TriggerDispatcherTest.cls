@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerDispatcherTest {
  @IsTest
  private static void dispatch_beforeInsert_finishExecution() {
    Triggers.mocker.setBeforeInsertMock(new List<SObject>());
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.beforeInsert,
      'Handler should execute before insert'
    );
  }

  @IsTest
  private static void dispatch_beforeUpdate_finishExecution() {
    Triggers.mocker.setBeforeUpdateMock(
      new List<SObject>(),
      new List<SObject>()
    );
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.beforeUpdate,
      'Handler should execute before update'
    );
  }

  @IsTest
  private static void dispatch_beforeDelete_finishExecution() {
    Triggers.mocker.setBeforeDeleteMock(new List<SObject>());
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.beforeDelete,
      'Handler should execute before delete'
    );
  }

  @IsTest
  private static void dispatch_afterInsert_finishExecution() {
    Triggers.mocker.setAfterInsertMock(new List<SObject>());
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.afterInsert,
      'Handler should execute after insert'
    );
  }

  @IsTest
  private static void dispatch_afterUpdate_finishExecution() {
    Triggers.mocker.setAfterUpdateMock(
      new List<SObject>(),
      new List<SObject>()
    );
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.afterUpdate,
      'Handler should execute after update'
    );
  }

  @IsTest
  private static void dispatch_afterDelete_finishExecution() {
    Triggers.mocker.setAfterDeleteMock(new List<SObject>());
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.afterDelete,
      'Handler should execute after delete'
    );
  }

  @IsTest
  private static void dispatch_afterUndelete_finishExecution() {
    Triggers.mocker.setAfterUndeleteMock(new List<SObject>());
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock() }
    );
    System.Test.startTest();
    dispatcher.dispatch();
    System.Test.stopTest();

    List<ITriggerHandler> handlers = dispatcher.handlers;
    TriggerHandlerMock handler = (TriggerHandlerMock) handlers[0];
    System.assertEquals(
      true,
      handler.afterUndelete,
      'Handler should execute after undelete'
    );
  }

  @IsTest
  private static void dispatch_beforeInsert_addError() {
    Triggers.mocker.setBeforeInsertMock(new List<SObject>{ new Account() });
    TriggerDispatcher dispatcher = new TriggerDispatcher(
      new List<ITriggerHandler>{ new TriggerHandlerMock(true) }
    );
    String addErrorMessage = '';
    System.Test.startTest();
    try {
      dispatcher.dispatch();
    } catch (AddErrorException e) {
      addErrorMessage = e.getMessage();
    }
    System.Test.stopTest();
    System.assertEquals(
      TriggerHandlerMock.ERROR_MESSAGE,
      addErrorMessage,
      'Add error message should be thrown from mocked method'
    );
  }
}
