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
  private IMethodMock defaultMethodMock;
  /**
   * @description Sets a mocked implementation to for a particular method
   * @param methodName Name of the method to mock
   * @param methodMock Mock method
   * @return Reference to calling object
   */
  public ClassMocker setMethodMock(String methodName, IMethodMock methodMock) {
    this.methodMocks.put(methodName, methodMock);
    return this;
  }
  /**
   * @description Sets a default method that will run if a mocked method has not been set
   * This is mostly useful as a convenience feature if you want a bundle of methods to behave the same way
   * @param methodMock Mock method to use as a default
   * @return Reference to calling object
   */
  public ClassMocker setDefaultMethodMock(IMethodMock methodMock) {
    this.defaultMethodMock = methodMock;
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
    if (this.methodMocks.containsKey(stubbedMethodName)) {
      return this.methodMocks.get(stubbedMethodName).execute(listOfArgs);
    } else if (this.defaultMethodMock != null) {
      return this.defaultMethodMock.execute(listOfArgs);
    } else {
      return null;
    }
  }
}
