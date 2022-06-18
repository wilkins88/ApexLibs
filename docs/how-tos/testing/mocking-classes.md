# Mocking Apex Classes with ClassMocker

## References

- [ClassMocker](../apex/Testing/ClassMocker.md)
- [Salesforce Stub API](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm)

## Simple Value Return Mocks

Provided as a part of this library is a mock that simply returns whatever value is provided to it. This is convenient in a variety of situations where we can treat a dependency as a black-box that just spits out a simple output (regardless of input, which we can control in tests anyways).

To apply, simply inject a mapping to the ReturnValueMethodMock class with the return value injected into the ReturnValueMethodMock constructor. Consider the following classes:

### SampleClass.cls

```java
public inherited sharing class SampleClass {
    @TestVisible
    private SampleDependencyClass dep {
        get {
            if (this.dep == null) {
                this.dep = new SampleDependencyClass();
            }
            return this.dep;
        }
        set;
    }

    public String doTheThing() {
        return 'Value from dependency is: ' + this.dep.helloWorld();
    }
}
```

### SampleDependencyClass.cls

```java
public inherited sharing class SampleDependencyClass {
	public String helloWorld() {
        return 'Hello World!';
    }
}
```

### SampleClassTest.cls

```java
@IsTest
private inherited sharing class SampleClassTest {
	@IsTest
    private static void mockExample() {
        SampleClass sc = new SampleClass();
        sc.dep = (SampleDependencyClass)System.Test.createStub(SampleDependencyClass.class, Libs.Testing.mocks.mockClass(
            new Map<String, Libs.IMethodMock> {
                'helloWorld' => new Libs.ReturnValueMethodMock('Hello World Mocked!')
            }
        ));
        System.Test.startTest();
        String result = sc.doTheThing();
        System.Test.stopTest();
        System.assertEquals('Value from dependency is: Hello World Mocked!', result, 'Should capture mocked value');
    }
}
```

Looking at the SampleClassTest class, we can see that a simple return value mock is being applied:

```java
sc.dep = (SampleDependencyClass)System.Test.createStub(SampleDependencyClass.class, Libs.Testing.mocks.mockClass(
    new Map<String, Libs.IMethodMock> {
        'helloWorld' => new Libs.ReturnValueMethodMock('Hello World Mocked!')
    }
));
```

In the example above, we are setting up a class mock that will return the string value "Hello World Mocked!" whenever the helloWorld method on the dependency class is invoked. This strategy can be used for any object type, including collections, so long as the return type matches the signature of the method that is mocking. If you need a more complex return value mock, consider implementing your own (see below).
