# Mocking Data with SObjectMocker

## References

- [SObjectMocker](../../apex/Testing/SObjectMocker.md)

## Creating an SObjectMocker Instance

SObjectMocker instances can be created via the Testing accessor. Both the Schema type and the apex object type need to be supplied to generate the mocker.

```java
Libs.SObjectMocker mocker = Libs.Testing.mocks.createSObjectMocker(Account.getSObjectType(), Account.class);
```

## Generating Mock Ids

Often times it is helpful to generate mock ids for data so that you can circumvent database operations to increase testing speed and decouple tests from other dependencies.

```java
Libs.SObjectMocker mocker = Libs.Testing.mocks.createSObjectMocker(Account.getSObjectType(), Account.class);
Id myAccountId = mocker.generateMockId();
Id myOtherAccountId = mocker.generateMockId();
```

### Generating Mocked Records with Default Required Fields

```java
Libs.SObjectMocker mocker = Libs.Testing.mocks.createSObjectMocker(Account.getSObjectType(), Account.class);
// this record will not have a mocked id
Account a1 = (Account)mocker.generateMockSObject();
mocker.shouldGenerateIds(true);
// this record will have a mocked id
Account a2 = (Account)mocker.generateMockSObject();
mocker.shouldGenerateIds(false);
// these 20 records will not have mocked ids
List<Account> accounts = (List<Account>)mocker.generateMockSObjects(20);
```

### Generating Mocked Records with Field Overrides

```java
Libs.SObjectMocker mocker = Libs.Testing.mocks.createSObjectMocker(Account.getSObjectType(), Account.class);
// this record will not have a mocked id
Account a1 = (Account)mocker.generateMockSObject(new Map<Schema.SObjectField, Object> { Account.Name => 'Override Name' });
List<Account> accounts = (List<Account>)mocker.generateMockSObjects(
    new Map<Schema.SObjectField, Object> { Account.Name => 'Override Name',
    20
});
```

### Generating Mocked Records with Related Lists

```java
Libs.SObjectMocker accountMocker = Libs.Testing.mocks.createSObjectMocker(Account.getSObjectType(), Account.class);
Libs.SObjectMocker contactMocker = Libs.Testing.mocks.createSObjectMocker(
    Contact.getSObjectType(),
    Contact.class
);
Account acct = (Account)accountMocker.setRelatedList(
    'Contacts',
    new List<Contact> { (Contact)contactMocker.generateMockSObject() }
).generateMockSObject();
```
