/**
 * @description Class mocker that can be used universally for black-box mocks
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class ClassMocker implements System.StubProvider {
  private Map<String, IMethodMock> methodMocks {
    get {
      if (this.methodMocks == null) {
        this.methodMocks = new Map<String, IMethodMock>();
      }
      return this.methodMocks;
    }
    set;
  }
  /**
   * @description Sets a mocked value to be returned for a particular method invocation
   * @param methodName Name of the method to mock
   * @param methodMock Mock method
   * @return Reference to calling object
   */
  global ClassMocker setMethodMock(String methodName, IMethodMock methodMock) {
    this.methodMocks.put(methodName, methodMock);
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
    return this.methodMocks.get(stubbedMethodName).execute();
  }
}
