---
layout: default
---
# MockerFactory

`ISTEST`

`SUPPRESSWARNINGS`

Factory classes for creating various mocking utilities


**Author** Tom Wilkins


**Date** 2022-04-08


**Group** Testing

## Methods
### `createClassMocker()`

Returns a default mocker with no mocked features. Clients should explicitly set the mocked values upon capturing the returned class mocker

#### Return

**Type**

ClassMocker

**Description**

Default ClassMocker

### `createClassMocker(Map<String,IMethodMock> methodMocks)`

Creates a ClassMocker and sets the methods provided to return the values provided

#### Parameters
|Param|Description|
|---|---|
|`methodMocks`|Map of method name strings to method mocks|

#### Return

**Type**

ClassMocker

**Description**

ClassMocker with provided method mocks set

### `createSObjectMocker(Schema.SObjectType sObjType)`

Creates an SObject mocker for the provided sobject type

#### Parameters
|Param|Description|
|---|---|
|`sObjType`|the type of sobject the mocker should be able to mock|

#### Return

**Type**

SObjectMocker

**Description**

SObjectMocker for provided sobject type

---
