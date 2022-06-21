@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class EnhancedDMLTest {
  private static final String TEST_ACCOUNT_NAME_1 = 'Test Account 1';
  private static final String TEST_ACCOUNT_NAME_2 = 'Test Account 2';
  private static final String TEST_CONTACT_FNAME_1 = 'Test 1';
  private static final String TEST_CONTACT_FNAME_2 = 'Test 2';
  private static final String TEST_CONTACT_LNAME = 'Tester';
  private static final String TEST_UPDATES_FNAME = 'Not Test';
  private static final String DUMMY_ACCOUNT_ID = Testing.mocks.createSObjectMocker(
      Account.getSObjectType(),
      Account.class
    )
    .generateMockId();

  @TestSetup
  static void makeData() {
    insert new List<Contact>{
      new Contact(
        FirstName = TEST_CONTACT_FNAME_1,
        LastName = TEST_CONTACT_LNAME
      ),
      new Contact(
        FirstName = TEST_CONTACT_FNAME_2,
        LastName = TEST_CONTACT_LNAME
      )
    };
  }

  @IsTest
  private static void insertRecord_newAccount_recordInserted() {
    EnhancedDML dml = new EnhancedDML();
    System.Test.startTest();
    dml.insertRecord(new Account(Name = TEST_ACCOUNT_NAME_1));
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should only be one inserted account');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
  }

  @IsTest
  private static void insertRecords_newAccounts_recordsInserted() {
    EnhancedDML dml = new EnhancedDML();
    System.Test.startTest();
    dml.insertRecords(
      new List<Account>{
        new Account(Name = TEST_ACCOUNT_NAME_1),
        new Account(Name = TEST_ACCOUNT_NAME_2)
      }
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(2, accts.size(), 'Should insert both accounts');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
    System.assertEquals(
      TEST_ACCOUNT_NAME_2,
      accts[1].Name,
      'Should be inserted with the correct name'
    );
  }

  @IsTest
  private static void insertRecord_newAccountWithOptions_recordInserted() {
    EnhancedDML dml = new EnhancedDML();
    System.Test.startTest();
    dml.insertRecord(
      new Account(Name = TEST_ACCOUNT_NAME_1),
      new Database.DMLOptions()
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should only be one inserted account');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
  }

  @IsTest
  private static void insertRecords_newAccountsWithOptions_recordsInserted() {
    EnhancedDML dml = new EnhancedDML();
    System.Test.startTest();
    dml.insertRecords(
      new List<Account>{
        new Account(Name = TEST_ACCOUNT_NAME_1),
        new Account(Id = DUMMY_ACCOUNT_ID)
      },
      new Database.DMLOptions() // defaults to all or none false
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should insert both accounts');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
  }

  @IsTest
  private static void updateRecord_existingContact_recordUpdated() {
    EnhancedDML dml = new EnhancedDML();
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    dml.updateRecord(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(
      1,
      contacts.size(),
      'Should only be one updated contact'
    );
  }

  @IsTest
  private static void updateRecords_existingContacts_contactsUpdated() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> toUpdate = [SELECT FirstName FROM Contact];
    for (Contact con : toUpdate) {
      con.FirstName = TEST_UPDATES_FNAME;
    }
    System.Test.startTest();
    dml.updateRecords(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(2, contacts.size(), 'Both contacts should be updated');
  }

  @IsTest
  private static void updateRecord_existingContactWithOptions_recordUpdated() {
    EnhancedDML dml = new EnhancedDML();
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    dml.updateRecord(toUpdate, new Database.DMLOptions());
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(
      1,
      contacts.size(),
      'Should only be one updated contact'
    );
  }

  @IsTest
  private static void updateRecords_oneExistingOneInvalidWithOptions_recordsUpdated() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.add(new Contact(FirstName = 'Does not matter'));
    for (Contact con : toUpdate) {
      con.FirstName = TEST_UPDATES_FNAME;
    }
    System.Test.startTest();
    dml.updateRecords(toUpdate, new Database.DMLOptions());
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(1, contacts.size(), 'Both contacts should be updated');
  }

  @IsTest
  private static void upsertRecord_newAccount_recordInserted() {
    EnhancedDML dml = new EnhancedDML();
    System.Test.startTest();
    dml.upsertRecord(new Account(Name = TEST_ACCOUNT_NAME_1));
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should only be one inserted account');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
  }

  @IsTest
  private static void upsertRecord_existingContact_recordUpdated() {
    EnhancedDML dml = new EnhancedDML();
    Contact toUpdate = [SELECT FirstName FROM Contact LIMIT 1];
    toUpdate.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    dml.upsertRecord(toUpdate);
    System.Test.stopTest();
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(
      1,
      contacts.size(),
      'Should only be one updated contact'
    );
  }

  @IsTest
  private static void upsertRecords_newAccountExistingContact_recordsUpserted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    dml.upsertRecords(
      new List<SObject>{ new Account(Name = TEST_ACCOUNT_NAME_1), con }
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should insert the account');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(
      1,
      contacts.size(),
      'Should only be one updated contact'
    );
  }

  @IsTest
  private static void upsertRecords_newAccountsExistingContactNotAllOrNone_recordsUpserted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    System.Test.startTest();
    dml.upsertRecords(
      new List<SObject>{
        new Account(Name = TEST_ACCOUNT_NAME_1),
        new Account(Id = DUMMY_ACCOUNT_ID),
        con
      },
      false
    );
    System.Test.stopTest();
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(1, accts.size(), 'Should insert 1 account');
    System.assertEquals(
      TEST_ACCOUNT_NAME_1,
      accts[0].Name,
      'Should be inserted with the correct name'
    );
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(
      1,
      contacts.size(),
      'Should only be one updated contact'
    );
  }
  @IsTest
  private static void upsertRecords_newAccountsExistingContactAllOrNone_recordsNotUpserted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT FirstName FROM Contact LIMIT 1];
    con.FirstName = TEST_UPDATES_FNAME;
    String errMsg;
    System.Test.startTest();
    try {
      dml.upsertRecords(
        new List<SObject>{
          new Account(Name = TEST_ACCOUNT_NAME_1),
          new Account(Id = DUMMY_ACCOUNT_ID),
          con
        },
        true
      );
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    System.assertEquals(
      true,
      String.isNotBlank(errMsg),
      'Should catch the error thrown from not being all or none'
    );
    List<Account> accts = [SELECT Name FROM Account];
    System.assertEquals(0, accts.size(), 'Should not insert the account');
    List<Contact> contacts = [
      SELECT Id
      FROM Contact
      WHERE FirstName = :TEST_UPDATES_FNAME
    ];
    System.assertEquals(0, contacts.size(), 'Should not update contact');
  }
  @IsTest
  private static void deleteRecord_validRecord_recordDeleted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    System.Test.startTest();
    dml.deleteRecord(con);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      1,
      remainingContacts.size(),
      'Should only be one contact after delete'
    );
    System.assertNotEquals(
      con.Id,
      remainingContacts[0].Id,
      'Make sure the remaining contact is not the deleted one'
    );
  }
  @IsTest
  private static void deleteRecord_validId_recordDeleted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    System.Test.startTest();
    dml.deleteRecord(con.Id);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      1,
      remainingContacts.size(),
      'Should only be one contact after delete'
    );
    System.assertNotEquals(
      con.Id,
      remainingContacts[0].Id,
      'Make sure the remaining contact is not the deleted one'
    );
  }
  @IsTest
  private static void deleteRecords_validRecords_recordsDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    System.Test.startTest();
    dml.deleteRecords(contacts);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      0,
      remainingContacts.size(),
      'All contacts should be deleted'
    );
  }
  @IsTest
  private static void deleteRecords_validIds_recordsDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> contactIds = new List<Id>();
    for (Contact con : contacts) {
      contactIds.add(con.Id);
    }
    System.Test.startTest();
    dml.deleteRecords(contactIds);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      0,
      remainingContacts.size(),
      'All contacts should be deleted'
    );
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidRecordsNotAllOrNone_recordsDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<SObject> records = new List<SObject>{
      new Account(Id = DUMMY_ACCOUNT_ID)
    };
    records.addAll(contacts);
    System.Test.startTest();
    dml.deleteRecords(records, false);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      0,
      remainingContacts.size(),
      'All contacts should be deleted'
    );
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidIdsNotAllOrNone_recordsDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<SObject> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    System.Test.startTest();
    dml.deleteRecords(recordIds, false);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      0,
      remainingContacts.size(),
      'All contacts should be deleted'
    );
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidRecordsAllOrNone_recordsDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<SObject> records = new List<SObject>{
      new Account(Id = DUMMY_ACCOUNT_ID)
    };
    records.addAll(contacts);
    String errMsg;
    System.Test.startTest();
    try {
      dml.deleteRecords(records, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    System.assertEquals(
      true,
      String.isNotBlank(errMsg),
      'Error should be thrown from dml'
    );
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      2,
      remainingContacts.size(),
      'All contacts should still exist'
    );
  }
  @IsTest
  private static void deleteRecords_mixValidInvalidIdsAllOrNone_recordsNotDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    String errMsg;
    System.Test.startTest();
    try {
      dml.deleteRecords(recordIds, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    System.assertEquals(
      true,
      String.isNotBlank(errMsg),
      'Error should be thrown from dml'
    );
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      2,
      remainingContacts.size(),
      'All contacts should still exist'
    );
  }
  @IsTest
  private static void undeleteRecord_validId_recordUndeleted() {
    EnhancedDML dml = new EnhancedDML();
    Contact con = [SELECT Id FROM Contact LIMIT 1];
    delete con;
    System.Test.startTest();
    dml.undeleteRecord(con.Id);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      2,
      remainingContacts.size(),
      'all contacts should be restored'
    );
  }
  @IsTest
  private static void deleteRecords_validIds_recordsUndeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> contactIds = new List<Id>();
    for (Contact con : contacts) {
      contactIds.add(con.Id);
    }
    delete contacts;
    System.Test.startTest();
    dml.undeleteRecords(contactIds);
    System.Test.stopTest();
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      2,
      remainingContacts.size(),
      'All contacts should be restored'
    );
  }
  @IsTest
  private static void undeleteRecords_mixValidInvalidIdsAllOrNone_recordsStayDeleted() {
    EnhancedDML dml = new EnhancedDML();
    List<Contact> contacts = [SELECT Id FROM Contact];
    List<Id> recordIds = new List<Id>{ DUMMY_ACCOUNT_ID };
    for (Contact con : (List<Contact>) contacts) {
      recordIds.add(con.Id);
    }
    delete contacts;
    String errMsg;
    System.Test.startTest();
    try {
      dml.undeleteRecords(recordIds, true);
    } catch (Exception e) {
      errMsg = e.getMessage();
    }
    System.Test.stopTest();
    System.assertEquals(
      true,
      String.isNotBlank(errMsg),
      'Error should be thrown from dml'
    );
    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(
      0,
      remainingContacts.size(),
      'All contacts should still be deleted'
    );
  }
}
