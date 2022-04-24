---
layout: default
---
# SObjectMocker

`ISTEST`

`SUPPRESSWARNINGS`

Mocking utility for mocking sobjects and related functionality


**Author** Tom Wilkins


**Date** 2022-04-08


**Group** Testing

## Methods
### `setRelatedList(String relatedListName, List<SObject> relatedListRecords)`

Sets a related list that will be created with each generated SObject

#### Parameters
|Param|Description|
|---|---|
|`relatedListName`|API name for the related list|
|`relatedListRecords`|Records to be captured as a part of the related list|

#### Return

**Type**

SObjectMocker

**Description**

Reference to calling object

### `shouldGenerateIds(Boolean generateIds)`

Sets whether or not the mocker should generate ids for records

#### Parameters
|Param|Description|
|---|---|
|`generateIds`|Whether or not the mocker should generated ids|

#### Return

**Type**

SObjectmocker

**Description**

Reference to calling object

### `generateMockId()`

Generates a mock id for the provided SObject Type

#### Return

**Type**

Id

**Description**

Mock id

### `generateMockSObject()`

generates a mock SObject

#### Return

**Type**

SObject

**Description**

Mocked SObject without an id

### `generateMockSObject(Map<Schema.SObjectField,Object> fieldValues)`

generates a mock SObject

#### Parameters
|Param|Description|
|---|---|
|`fieldValues`|Field Values to set in the mocked object|

#### Return

**Type**

SObject

**Description**

Mocked SObject without an id

### `generateMockSObjects(Integer numOfRecords)`

generates a list of mock SObjects

#### Parameters
|Param|Description|
|---|---|
|`numOfRecords`|Number of mocked SObjects to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Mocked SObject without an id

### `generateMockSObjects(Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

generates a mock SObject

#### Parameters
|Param|Description|
|---|---|
|`fieldValues`|Field Values to set in the mocked object|
|`numOfRecords`|Number of mocked SObjects to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Mocked SObject without an id

---
