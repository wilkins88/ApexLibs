---
layout: default
---
# DataFactory

`ISTEST`

`SUPPRESSWARNINGS`

Flexible data factory for generating data for a given SObject Type


**Author** Tom Wilkins


**Date** 2022-04-10


**Group** Testing

## Methods
### `createSObjects(Schema.SObjectType sObjType, Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided sobject inputs

#### Parameters
|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`fieldValues`|Field -> value mapping to set on each record -- this will be consistent accross all records|
|`numOfRecords`|Number of records to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

List of generated SObjects, not inserted

### `createSObjects(Schema.SObjectType sObjType, Integer numOfRecords)`

Generates SObjects (not inserted) for the provided sobject inputs

#### Parameters
|Param|Description|
|---|---|
|`sObjType`|Type of SObject to make records for|
|`numOfRecords`|Number of records to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

List of generated SObjects, not inserted

---
