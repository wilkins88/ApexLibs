---
layout: default
---
# DataSettings

`SUPPRESSWARNINGS`

Settings class that can be manipulated to afford various behaviors when executing dml or running queries


**Date** 2022-06-18


**Group** Data

## Methods
### `shouldEnforceFLS()`

Returns whether or not FLS should be enforced

#### Return

**Type**

Boolean

**Description**

True if FLS should be enforced, false otherwise

### `shouldAllowFieldStripping()`

Returns whether or not stripping fields is allows when FLS is enforced

#### Return

**Type**

Boolean

**Description**

True if field stripping is allowed, false otherwise

### `enableFieldStripping()`

Enables field Stripping. Also enables enforcement of FLS

### `disableFieldStripping()`

Enables field Stripping. Does not disable enforcement of FLS

### `enableFLS()`

Enables general enforcement of FLS.

### `disableFLS()`

Disables general enforcement of FLS.

---
