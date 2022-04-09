/**
 * @description Simple method mock that returns whatever value is injected into the constructor
 * @author Tom Wilkins
 * @date 2022-04-09
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class ReturnValueMethodMock implements IMethodMock {
  private Object returnValue;
  /**
   * @description Constructor
   * @param returnValue value to be returned in the execute invocation
   */
  global ReturnValueMethodMock(Object returnValue) {
    this.returnValue = returnValue;
  }
  /**
   * @description returns the value injected into the constructor
   * @see [IMethodMock](/docs/Testing/IMethodMock.md)
   * @return Mocked object injected into constructor
   */
  global Object execute() {
    return this.returnValue;
  }
}
