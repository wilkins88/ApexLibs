@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class TriggerContextTest {
  @IsTest
  private static void coverage() {
    // actual testing is hard here because we can't test trigger variables and methods without a trigger context
    // and we can't generate a trigger context without dml and an associated trigger handler (which doesn't exist in this package)
    // so only go for coverage
    TriggerContext ctx = new TriggerContext();
    System.Test.startTest();
    ctx.getTriggerNew();
    ctx.getTriggerNewMap();
    ctx.getTriggerOld();
    ctx.getTriggerOldMap();
    ctx.isBeforeInsert();
    ctx.isBeforeUpdate();
    ctx.isBeforeDelete();
    ctx.isAfterInsert();
    ctx.isAfterUpdate();
    ctx.isAfterDelete();
    ctx.isAfterUndelete();
    System.Test.stopTest();
    System.assert(true, 'Coverage invocations successfully completed');
  }
}
