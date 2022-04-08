---
layout: default
---
# ClassMocker

`ISTEST`

`SUPPRESSWARNINGS`

Classic that can be used universally for black-box mocks


**Author** Tom Wilkins


**Date** 2022-04-08


**Group** Testing

## Methods
### `setMockedValue(String methodName, Object returnValue)`

sets a mocked value to be returned for a particular method invocation

#### Parameters
|Param|Description|
|---|---|
|`methodName`|the name of the method to mock|
|`returnValue`|the value to be returned|

#### Return

**Type**

ClassMocker

**Description**

reference to calling object

### `setMockedException(String methodName, Exception exceptionToThrow)`

sets a mocked exception to be thrown for a particular method invocation

#### Parameters
|Param|Description|
|---|---|
|`methodName`|the name of the method to mock|
|`exceptionToThrow`|the exception to be thrown|

#### Return

**Type**

ClassMocker

**Description**

reference to calling object

### `handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType, List<Type> listOfParamTypes, List<String> listOfParamNames, List<Object> listOfArgs)`

`SUPPRESSWARNINGS`
#### Parameters
|Param|Description|
|---|---|


**See** &lt;a href=&quot;https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm&quot;&gt;StubProvider Interface&lt;/a&gt;

---
