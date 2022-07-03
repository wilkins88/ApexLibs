# Mocking Apex Classes with ClassMocker

## References

- [EnhancedDml Class](../../apex/Data/EnhancedDML.md)
- [Database Class](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_database.htm)
- [Enforcing FLS in Apex](https://developer.salesforce.com/docs/atlas.en-us.214.0.lightning.meta/lightning/apex_crud_fls.htm)
- [Strip Inaccessible](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_with_security_stripInaccessible.htm)

### Basics of Using Enhanced DML

Getting started with the enhanced dml wrapper is pretty straightforward. At it's core, it is a wrapper around the Database.<dmlOp> methods, with additional
pieces in place to support a secure-by-default implementation. As such, most of the methods will have a similar method signatures. For more information, refer
to the EnhancedDML class apex documenation (linked above). The following is an example of how one can use the library:

```java
// all of these will enforce FLS by default
// disabling FLS is described later in this doc
Contact con = new Contact(LastName = 'Tester');
Database.SaveResult res = Libs.Data.dml.insertRecord(con);
// since we Database.<op> pull the id from the record
con.Id = res.getId();
con.FirstName = 'Tom';
// supports single instances and collections
Libs.Data.dml.updateRecords(new List<Contact> { con });
Libs.Data.dml.deleteRecord(con.Id);
```

### Controlling FLS Enforcement

One of the features of this framework is to decouple enforcing FLS from the actual DML operation itself. This allows business logic to behave differently
based on the context established by the invoking classes, somewhat similar to how sharing works with inherited sharing architectures.

```java
Contact con = new Contact(LastName = 'Tester', SomeFieldICantAccess__c = 'Some value');
// Contact will successfully be inserted, but field without access will be stripped out
Libs.Data.settings.enableFieldStripping();
Database.SaveResult res = Libs.Data.dml.insertRecord(con);
Libs.Data.settings.disableFieldStripping();
con.Id = res.getId();
con.FirstName = 'Tom';
// updating record will ignore FLS
Libs.Data.settings.disableFLS();
Libs.Data.dml.updateRecords(new List<Contact> { con });
Libs.Data.settings.enableFLS();
// deleting record will return to defaults and enforce FLS
Libs.Data.dml.deleteRecord(con.Id);
```
