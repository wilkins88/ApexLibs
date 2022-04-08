---
layout: default
---
# ClassMocker

`ISTEST`

`SUPPRESSWARNINGS`

Class mocker that can be used universally for black-box mocks


**Author** Tom Wilkins


**Date** 2022-04-08


**Group** Testing

## Methods
### `setMockedValue(String methodName, Object returnValue)`

Sets a mocked value to be returned for a particular method invocation

#### Parameters
|Param|Description|
|---|---|
|`methodName`|Name of the method to mock|
|`returnValue`|Value to be returned|

#### Return

**Type**

ClassMocker

**Description**

Reference to calling object

### `setMockedException(String methodName, Exception exceptionToThrow)`

Sets a mocked exception to be thrown for a particular method invocation

#### Parameters
|Param|Description|
|---|---|
|`methodName`|Name of the method to mock|
|`exceptionToThrow`|Exception to be thrown|

#### Return

**Type**

ClassMocker

**Description**

Reference to calling object

### `handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType, List<Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs)`

`SUPPRESSWARNINGS`
#### Parameters
|Param|Description|
|---|---|


**See** [System.StubProvider](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm)

---
