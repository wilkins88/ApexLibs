---
layout: default
---
# EnhancedDML

`SUPPRESSWARNINGS`

DML interface to be used as a replacement for standard DML. Supports flexible (and default) enforcement of FLS on operations, as well as supports mocking to remove automation dependencies from Unit tests that require database operations


**Date** 2022-06-18


**Group** Data

## Methods
### `insertRecord(SObject record, Database.DMLOptions options)`

Inserts a single record with DML options

#### Parameters
|Param|Description|
|---|---|
|`record`|Record to insert|
|`options`|DML options, same as provided to Database.insert|

#### Return

**Type**

Database.SaveResult

**Description**

Save results from the insert operation

### `insertRecords(List<SObject> records)`

Inserts a collection of records

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to insert|

#### Return

**Type**

List&lt;Database.SaveResult&gt;

**Description**

Save results from the insert operation

### `insertRecords(List<SObject> records, Database.DMLOptions options)`

Inserts a collection of records with DML options

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to insert|
|`options`|DML options, same as provided to Database.insert|

#### Return

**Type**

List&lt;Database.SaveResult&gt;

**Description**

Save results from the insert operation

### `updateRecord(SObject record, Database.DMLOptions options)`

Updates a single record with DML options

#### Parameters
|Param|Description|
|---|---|
|`record`|Record to update|
|`options`|DML options, same as provided to Database.update|

#### Return

**Type**

Database.SaveResult

**Description**

Save results from the update operation

### `updateRecords(List<SObject> records)`

Updates a collection of records

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to update|

#### Return

**Type**

List&lt;Database.SaveResult&gt;

**Description**

Save results from the update operation

### `updateRecords(List<SObject> records, Database.DMLOptions options)`

Updates a collection of records with DML options

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to update|
|`options`|DML options, same as provided to Database.update|

#### Return

**Type**

List&lt;Database.SaveResult&gt;

**Description**

Save results from the update operation

### `upsertRecord(SObject record)`

Upserts a single record

#### Parameters
|Param|Description|
|---|---|
|`record`|Record to upsert|

#### Return

**Type**

Database.UpsertResult

**Description**

Save results from the upsert operation

### `upsertRecords(List<SObject> records)`

Upserts a collection of records

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to upsert|

#### Return

**Type**

List&lt;Database.UpsertResult&gt;

**Description**

Save results from the upsert operation

### `upsertRecords(List<SObject> records, Boolean allOrNone)`

Upserts a collection of records

#### Parameters
|Param|Description|
|---|---|
|`record`|Records to upsert|
|`allOrNone`|Whether partial DB writes should be allowed|

#### Return

**Type**

List&lt;Database.UpsertResult&gt;

**Description**

Save results from the upsert operation

### `deleteRecord(SObject record)`

Deletes a single record

#### Parameters
|Param|Description|
|---|---|
|`record`|Record to delete|

#### Return

**Type**

Database.DeleteResult

**Description**

Save results from the delete operation

### `deleteRecord(Id recordId)`

Deletes a single record

#### Parameters
|Param|Description|
|---|---|
|`recordId`|Id of the record to delete|

#### Return

**Type**

Database.DeleteResult

**Description**

Save results from the delete operation

### `deleteRecords(List<SObject> records)`

Deletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`records`|Records to delete|

#### Return

**Type**

List&lt;Database.DeleteResult&gt;

**Description**

Save results from the delete operation

### `deleteRecords(List<SObject> records, Boolean allOrNone)`

Deletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`records`|Records to delete|
|`allOrNone`|Whether partial DB writes should be allowed|

#### Return

**Type**

List&lt;Database.DeleteResult&gt;

**Description**

Save results from the delete operation

### `deleteRecords(List<Id> recordIds)`

Deletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`recordIds`|Ids of the records to delete|

#### Return

**Type**

List&lt;Database.DeleteResult&gt;

**Description**

Save results from the delete operation

### `deleteRecords(List<Id> recordIds, Boolean allOrNone)`

Deletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`recordIds`|Ids of the records to delete|
|`allOrNone`|Whether partial DB writes should be allowed|

#### Return

**Type**

List&lt;Database.DeleteResult&gt;

**Description**

Save results from the delete operation

### `undeleteRecord(Id recordId)`

Undeletes a single record

#### Parameters
|Param|Description|
|---|---|
|`recordIds`|Id of the record to undelete|

#### Return

**Type**

Database.UndeleteResult

**Description**

Save results from the undelete operation

### `undeleteRecords(List<Id> recordIds)`

Undeletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`recordIds`|Ids of the records to undelete|

#### Return

**Type**

List&lt;Database.UndeleteResult&gt;

**Description**

Save results from the undelete operation

### `undeleteRecords(List<Id> recordIds, Boolean allOrNone)`

Undeletes a collection of records

#### Parameters
|Param|Description|
|---|---|
|`recordIds`|Ids of the records to undelete|
|`allOrNone`|Whether partial DB writes should be allowed|

#### Return

**Type**

List&lt;Database.UndeleteResult&gt;

**Description**

Save results from the undelete operation

---
