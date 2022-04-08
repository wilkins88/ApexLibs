/**
 * @description Factory classes for creating various mocking utilities
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class MockerFactory {
  /**
   * @description Returns a default mocker with no mocked features. Clients should explicitly set
   * the mocked values upon capturing the returned class mocker
   * @return Default ClassMocker
   */
  global ClassMocker createClassMocker() {
    return new ClassMocker();
  }
  /**
   * @description Creates a ClassMocker and sets the methods provided to return the values provided
   * @param methodMocks Map of method name strings to return values
   * @return ClassMocker with provided method mocks set
   */
  global ClassMocker createClassMocker(Map<String, Object> methodMocks) {
    ClassMocker mocker = new ClassMocker();
    for (String methodName : methodMocks.keySet()) {
      mocker.setMockedValue(methodName, methodMocks.get(methodName));
    }
    return mocker;
  }
  /**
   * @description Creates a ClassMocker and sets the methods provided to throw the exceptions provided
   * @param exceptionMocks Map of method name strings to exceptions to be thrown
   * @return ClassMocker with provided method exception mocks set
   */
  global ClassMocker createClassMocker(Map<String, Exception> exceptionMocks) {
    ClassMocker mocker = new ClassMocker();
    for (String methodName : exceptionMocks.keySet()) {
      mocker.setMockedException(methodName, exceptionMocks.get(methodName));
    }
    return mocker;
  }
  /**
   * @description Creates a ClassMocker and sets the methods provided to return the values or throw the excpetions provided
   * note that methods set with a return value will take precedence if the same method also throws an exception
   * @param methodMocks Map of method name strings to return values
   * @param exceptionMocks Map of method name strings to exceptions to be thrown
   * @return ClassMocker with provided method mocks set
   */
  global ClassMocker createClassMocker(
    Map<String, Object> methodMocks,
    Map<String, Exception> exceptionMocks
  ) {
    ClassMocker mocker = new ClassMocker();
    for (String methodName : methodMocks.keySet()) {
      mocker.setMockedValue(methodName, methodMocks.get(methodName));
    }
    for (String methodName : methodMocks.keySet()) {
      mocker.setMockedException(methodName, exceptionMocks.get(methodName));
    }
    return mocker;
  }
}
