---
layout: default
---
# TriggerContext

`SUPPRESSWARNINGS`

Wrapper around the System Trigger libs to provide opportunities for QoL and decoupling from sys libs for mocking, DI, etc.


**Author** Tom Wilkins


**Date** 2022-04-11


**Group** Triggers

## Methods
### `getTriggerNew()`

Wrapper for Trigger.new

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Trigger.new records

### `getTriggerNewMap()`

Wrapper for Trigger.newMap

#### Return

**Type**

Map&lt;Id,SObject&gt;

**Description**

Trigger.newMap record map

### `getTriggerOld()`

Wrapper for Trigger.old

#### Return

**Type**

List&lt;SObject&gt;

**Description**

Trigger.old records

### `getTriggerOldMap()`

Wrapper for Trigger.newMap

#### Return

**Type**

Map&lt;Id,SObject&gt;

**Description**

Trigger.newMap record map

### `isBeforeInsert()`

Checks if the trigger context is before insert

#### Return

**Type**

Boolean

**Description**

True if before insert, false otherwise

### `isBeforeUpdate()`

Checks if the trigger context is before update

#### Return

**Type**

Boolean

**Description**

True if before update, false otherwise

### `isBeforeDelete()`

Checks if the trigger context is before delete

#### Return

**Type**

Boolean

**Description**

True if before delete, false otherwise

### `isAfterInsert()`

Checks if the trigger context is after insert

#### Return

**Type**

Boolean

**Description**

True if after insert, false otherwise

### `isAfterUpdate()`

Checks if the trigger context is after update

#### Return

**Type**

Boolean

**Description**

True if after update, false otherwise

### `isAfterDelete()`

Checks if the trigger context is after delete

#### Return

**Type**

Boolean

**Description**

True if after delete, false otherwise

### `isAfterUndelete()`

Checks if the trigger context is after undelete

#### Return

**Type**

Boolean

**Description**

True if after undelete, false otherwise

### `addError(SOBject record, String errorMessage)`

Wrapper around the trigger record.addError method -- can only be used in trigger contexts

#### Parameters
|Param|Description|
|---|---|
|`record`|SObject record to add the error to|
|`errorMessage`|Error Message to be added to the record|

---
