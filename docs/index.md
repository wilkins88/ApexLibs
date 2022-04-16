---
layout: default
---
# Classes
## Triggers

### [AddErrorException](/Triggers/AddErrorException.md)

Exception used in tests to identify when an addError call happens in mocks

### [AddErrorMethodMock](/Triggers/AddErrorMethodMock.md)

Method mock for the addError method on the TriggerContext

### [TriggerContext](/Triggers/TriggerContext.md)

Wrapper around the System Trigger libs to provide opportunities for QoL and decoupling from sys libs for mocking, DI, etc.

### [TriggerDispatcher](/Triggers/TriggerDispatcher.md)

Dispatcher that handles general routing of trigger logic for all contexts and all SObjects

### [TriggerDispatcherFactory](/Triggers/TriggerDispatcherFactory.md)

Factory for creating trigger dispatcher and injecting handlers based on configuring

### [TriggerHandler](/Triggers/TriggerHandler.md)

Virtual class of which all trigger handlers should implement. Provides base behavior (do nothing) so handlers should only focus on implementing the contexts that matter

### [TriggerMocker](/Triggers/TriggerMocker.md)

Mocker for trigger functionality

### [TriggerSettings](/Triggers/TriggerSettings.md)

Settings class that is used to provide an API for tuning the behavior of the Trigger framework

### [Triggers](/Triggers/Triggers.md)

Static accessor for Trigger functionality. Provides convenient access while supporting good design and mockability for unit tests
## Testing

### [ClassMocker](/Testing/ClassMocker.md)

Class mocker that can be used universally for black-box mocks

### [DataFactory](/Testing/DataFactory.md)

Flexible data factory for generating data for a given SObject Type

### [IMethodMock](/Testing/IMethodMock.md)

Interface to implement for any method mock classes to be used with the mocking framework

### [MockerFactory](/Testing/MockerFactory.md)

Factory classes for creating various mocking utilities

### [ReturnValueMethodMock](/Testing/ReturnValueMethodMock.md)

Simple method mock that returns whatever value is injected into the constructor

### [SObjectMocker](/Testing/SObjectMocker.md)

Mocking utility for mocking sobjects and related functionality

### [Testing](/Testing/Testing.md)

Static accessor class used to group and provide convenient static access to testing classes. Usually this is done to support mocking, but since that isn&apos;t needed for testing utilities, this is just to follow the same pattern while allowing decomposition of testing functionality

### [ThrowExceptionMethodMock](/Testing/ThrowExceptionMethodMock.md)

Simple method mock that throws whatever excpetion is injected into the constructor
