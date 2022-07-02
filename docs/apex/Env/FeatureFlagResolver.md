---
layout: default
---
# FeatureFlagResolver

`SUPPRESSWARNINGS`

Base class for feature flag resolvers to implement


**Date** 2022-06-25


**Group** Env

## Methods
### `resolve()`

Resolves whether or not the feature is turned on

#### Return

**Type**

Boolean

**Description**

True if feature is on, false otherwise

### `setFeatureConfig(FeatureFlagSetting__mdt config)`

Sets the feature config

#### Parameters
|Param|Description|
|---|---|
|`config`|Feature flag setting to use when resolving|

---
