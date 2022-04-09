/**
 * @description Class mocker that can be used universally for black-box mocks
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class ClassMocker implements System.StubProvider {
  private Map<String, Exception> mockedExceptions {
    get {
      if (this.mockedExceptions == null) {
        this.mockedExceptions = new Map<String, Exception>();
      }
      return this.mockedExceptions;
    }
    set;
  }
  private Map<String, Object> mockedReturnValues {
    get {
      if (this.mockedReturnValues == null) {
        this.mockedReturnValues = new Map<String, Object>();
      }
      return this.mockedReturnValues;
    }
    set;
  }
  /**
   * @description Sets a mocked value to be returned for a particular method invocation
   * @param methodName Name of the method to mock
   * @param returnValue Value to be returned
   * @return Reference to calling object
   */
  global ClassMocker setMockedValue(String methodName, Object returnValue) {
    this.mockedReturnValues.put(methodName, returnValue);
    return this;
  }
  /**
   * @description Sets a mocked exception to be thrown for a particular method invocation
   * @param methodName Name of the method to mock
   * @param exceptionToThrow Exception to be thrown
   * @return Reference to calling object
   */
  global ClassMocker setMockedException(
    String methodName,
    Exception exceptionToThrow
  ) {
    this.mockedExceptions.put(methodName, exceptionToThrow);
    return this;
  }
  /**
   * @see [System.StubProvider](https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_interface_System_StubProvider.htm)
   */
  @SuppressWarnings('PMD.ExcessiveParameterList')
  global Object handleMethodCall(
    Object stubbedObject,
    String stubbedMethodName,
    Type returnType,
    List<Type> listOfParamTypes,
    List<String> listOfParamNames,
    List<Object> listOfArgs
  ) {
    if (this.mockedExceptions.containsKey(stubbedMethodName)) {
      throw this.mockedExceptions.get(stubbedMethodName);
    } else {
      return this.mockedReturnValues.get(stubbedMethodName);
    }
  }
}
