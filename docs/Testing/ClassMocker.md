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
### `setMethodMock(String methodName, IMethodMock methodMock)`

Sets a mocked implementation to for a particular method

#### Parameters
|Param|Description|
|---|---|
|`methodName`|Name of the method to mock|
|`methodMock`|Mock method|

#### Return

**Type**

ClassMocker

**Description**

Reference to calling object

### `setDefaultMethodMock(IMethodMock methodMock)`

Sets a default method that will run if a mocked method has not been set This is mostly useful as a convenience feature if you want a bundle of methods to behave the same way

#### Parameters
|Param|Description|
|---|---|
|`methodMock`|Mock method to use as a default|

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
