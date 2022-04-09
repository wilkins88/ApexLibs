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

### `generateMockSObject(Boolean shouldHaveId)`

generates a mock SObject

#### Parameters
|Param|Description|
|---|---|
|`shouldHaveId`|Whether or not the mocked SObject should also have a mocked id|

#### Return

**Type**

SObject

**Description**

Mocked SObject

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

### `generateMockSObject(Boolean shouldHaveId, Map<Schema.SObjectField,Object> fieldValues)`

generates a mock SObject

#### Parameters
|Param|Description|
|---|---|
|`shouldHaveId`|Whether or not the mocked SObject should also have a mocked id|
|`fieldValues`|Field Values to set in the mocked object|

#### Return

**Type**

SObject

**Description**

Mocked SObject

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

### `generateMockSObjects(Boolean shouldHaveId, Integer numOfRecords)`

generates a list of mock SObjects

#### Parameters
|Param|Description|
|---|---|
|`shouldHaveId`|Whether or not the mocked SObject should also have a mocked id|
|`numOfRecords`|Number of mocked SObjects to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Mocked SObject

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

### `generateMockSObjects(Boolean shouldHaveId, Map<Schema.SObjectField,Object> fieldValues, Integer numOfRecords)`

generates a mock SObject

#### Parameters
|Param|Description|
|---|---|
|`shouldHaveId`|Whether or not the mocked SObject should also have a mocked id|
|`fieldValues`|Field Values to set in the mocked object|
|`numOfRecords`|Number of mocked SObjects to generate|

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Mocked SObject

---
