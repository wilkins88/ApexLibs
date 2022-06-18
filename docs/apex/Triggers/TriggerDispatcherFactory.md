---
layout: default
---
# TriggerDispatcherFactory

`SUPPRESSWARNINGS`

Factory for creating trigger dispatcher and injecting handlers based on configuring


**Author** Tom Wilkins


**Date** 2022-04-13


**Group** Triggers

## Methods
### `create(Schema.SObjectType sObjType)`

Creates and returns a trigger dispatcher for the provided SObject

#### Parameters
|Param|Description|
|---|---|
|`sObjType`|the type of SObject to create a dispatcher for|

#### Return

**Type**

TriggerDispatcher

**Description**

Trigger dispatcher with injected handlers for the provided SObject

---
