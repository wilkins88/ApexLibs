/**
 * @description Simple method mock that throws whatever excpetion is injected into the constructor
 * @author Tom Wilkins
 * @date 2022-04-09
 * @group Testing
 */
@IsTest
@SuppressWarning('AvoidGlobalModifier')
global inherited sharing class ThrowExceptionMethodMock implements IMethodMock {
  private Exception exceptionToThrow;
  /**
   * @description Constructor
   * @param exceptionToThrow exception to be thrown in the execute invocation
   */
  global ThrowExceptionMethodMock(Exception exceptionToThrow) {
    this.exceptionToThrow = exceptionToThrow;
  }
  /**
   * @description throws the exception injected into the constructor
   * @see [IMethodMock](/docs/Testing/IMethodMock.md)
   */
  global Object execute() {
    throw this.exceptionToThrow;
  }
}
