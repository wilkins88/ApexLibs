@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerDispatcherFactoryTest {
  @IsTest
  private static void create_mockedSelector_returnOneHandler() {
    SObjectMocker handlerSettingMocker = new SObjectMocker(
      TriggerHandlerSetting__mdt.getSObjectType(),
      TriggerHandlerSetting__mdt.class
    );
    SObjectMocker triggerSettingMocker = new SObjectMocker(
        SObjectTriggerSetting__mdt.getSObjectType(),
        SObjectTriggerSetting__mdt.class
      )
      .setRelatedList(
        'Libs__TriggerHandlerSettings__r',
        new List<TriggerHandlerSetting__mdt>{
          (TriggerHandlerSetting__mdt) handlerSettingMocker.generateMockSObject(
            new Map<Schema.SObjectField, Object>{
              TriggerHandlerSetting__mdt.ClassName__c => 'TriggerHandlerMock'
            }
          )
        }
      );
    SObjectTriggerSetting__mdt config = (SObjectTriggerSetting__mdt) triggerSettingMocker.generateMockSObject();
    TriggerDispatcherFactory factory = new TriggerDispatcherFactory();
    factory.config = (TriggerConfigSelector) Testing.mocks.mockClass(
      TriggerConfigSelector.class,
      new Map<String, IMethodMock>{
        'getTriggerSettings' => new ReturnValueMethodMock(
          new List<SObjectTriggerSetting__mdt>{ config }
        )
      }
    );
    System.Test.startTest();
    TriggerDispatcher dispatcher = factory.create(Account.getSObjectType());
    System.Test.stopTest();
    System.assertEquals(
      1,
      dispatcher.handlers.size(),
      'Should return the 1 configured handler'
    );
  }
}
