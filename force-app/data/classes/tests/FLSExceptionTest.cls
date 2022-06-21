@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class FLSExceptionTest {
  @IsTest
  private static void constructor_accessType_fieldsInitialized() {
    System.Test.startTest();
    FLSException e = new FLSException(
      System.AccessType.READABLE,
      new List<String>{ 'Account.Name' }
    );
    System.Test.stopTest();
    System.assertEquals(
      DataStringAdapter.READ_STRING,
      e.operationType,
      'Should have read operation set'
    );
    System.assertEquals(
      'Account.Name',
      e.violations[0],
      'Should have the correct violation'
    );
  }
  @IsTest
  private static void constructor_databaseOperation_fieldsInitialized() {
    System.Test.startTest();
    FLSException e = new FLSException(
      DatabaseOperation.DML_INSERT,
      new List<String>{ 'Account.Name' }
    );
    System.Test.stopTest();
    System.assertEquals(
      DataStringAdapter.INSERT_STRING,
      e.operationType,
      'Should have read operation set'
    );
    System.assertEquals(
      'Account.Name',
      e.violations[0],
      'Should have the correct violation'
    );
  }
  @IsTest
  private static void getMessage_readError_returnValidMessage() {
    FLSException e = new FLSException(
      System.AccessType.READABLE,
      new List<String>{ 'Account.Name' }
    );
    System.Test.startTest();
    String msg = e.getMessage();
    System.Test.stopTest();
    System.assertEquals(
      'Insufficient ' +
      DataStringAdapter.READ_STRING +
      ' access to: Account.Name',
      msg,
      'Should return the correct message'
    );
  }
}
