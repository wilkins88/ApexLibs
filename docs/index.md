---
layout: default
---
# Classes
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
## Triggers

### [TriggerHandler](/Triggers/TriggerHandler.md)

Virtual class of which all trigger handlers should implement. Provides base behavior (do nothing) so handlers should only focus on implementing the contexts that matter

### [TriggerSettings](/Triggers/TriggerSettings.md)

Settings class that is used to provide an API for tuning the behavior of the Trigger framework

### [Triggers](/Triggers/Triggers.md)

Static accessor for Trigger functionality. Provides convenient access while supporting good design and mockability for unit tests
