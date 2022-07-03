---
layout: default
---
# FLSException

`SUPPRESSWARNINGS`

**Description** Exception class for FLS related issues


**Date** 2022-06-18


**Group** Data

## Constructors
### `FLSException(System.AccessType access, List<String> violations)`

Constructor

#### Parameters
|Param|Description|
|---|---|
|`access`|Access Type that was used to determine FLS violation|
|`violations`|Fields or Objects that failed the FLS check|

### `FLSException(DatabaseOperation operation, List<String> violations)`

Constructor

#### Parameters
|Param|Description|
|---|---|
|`operation`|Database operation that was used to determine FLS violation|
|`violations`|Fields of Objects that failed the FLS check|

---
## Methods
### `override getMessage()`

Returns FLS error message based on injected variables

#### Return

**Type**

String

**Description**

Custom error message


**See** [Custom Exceptions](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_custom.htm)

---
