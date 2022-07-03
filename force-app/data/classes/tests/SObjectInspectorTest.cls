@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class SObjectInspectorTest {
  @IsTest
  private static void getAllFields_account_returnAllFields() {
    SObjectInspector inspector = new SObjectInspector(Account.getSObjectType());
    System.Test.startTest();
    List<Schema.SObjectField> fields = inspector.getAllFields();
    System.Test.stopTest();
    // don't hard check because this can fail based on org
    System.assertEquals(true, fields.size() > 0, 'Return some fields');
  }
}
