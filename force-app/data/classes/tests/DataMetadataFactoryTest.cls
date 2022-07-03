@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class DataMetadataFactoryTest {
  @IsTest
  private static void createSObjectInspector_account_createAndReturnInspector() {
    DataMetadataFactory factory = new DataMetadataFactory();
    System.Test.startTest();
    SObjectInspector inspector = factory.createSObjectInspector(
      Account.getSObjectType()
    );
    System.Test.stopTest();
    System.assertEquals(
      Account.getSObjectType(),
      inspector.sObjType,
      'Should appropriately init the SObject Type'
    );
  }
}
