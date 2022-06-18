---
layout: default
---
# IMethodMock

`SUPPRESSWARNINGS`

Interface to implement for any method mock classes to be used with the mocking framework


**Author** Tom Wilkins


**Date** 2022-04-09


**Group** Testing

## Methods
### `execute(List<Object> args)`

`SUPPRESSWARNINGS`

executes the intended mock behavior. If a method returns void, then simply return null from the function

#### Parameters
|Param|Description|
|---|---|
|`args`|Args that were passed into the method invocation|

#### Return

**Type**

Object

**Description**

Object the object to be returned, null for void

---
