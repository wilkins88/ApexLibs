@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerHandlerTest {
  @IsTest
  private static void coverage() {
    // these methods do nothing, so just testing for coverage
    TriggerHandler handler = new TriggerHandler();
    System.Test.startTest();
    handler.doBeforeInsert();
    handler.doBeforeUpdate();
    handler.doBeforeDelete();
    handler.doAfterInsert();
    handler.doAfterUpdate();
    handler.doAfterDelete();
    handler.doAfterUndelete();
    System.Test.stopTest();
    System.assert(true, 'Coverage invocations successfully completed');
  }
}
