---
layout: default
---
# TriggerSettings

`SUPPRESSWARNINGS`

Settings class that is used to provide an API for tuning the behavior of the Trigger framework


**Author** Tom Wilkins


**Date** 2022-04-11


**Group** Triggers

## Methods
### `enableTriggers()`

Enables trigger handlers to execute. This is the default behavior but can be invoked to enable if triggers were disabled earlier in the context

### `disableTriggers()`

Disabled triggers handlers so they are not executed. Note that careful though should be put into whether or not triggers should be disabled for any given context, but this is useful for things suck as data scripts

---
