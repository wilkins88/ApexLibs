/**
 * @description Method mock for the addError method on the TriggerContext
 * @author Tom Wilkins
 * @date 2022-04-15
 * @group Triggers
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class AddErrorMethodMock implements IMethodMock {
  /**
   * @description Throws an AddErrorException that can be caught and inspected to verify addError
   * @see [IMethodMock](/docs/Testing/IMethodMock.md)
   */
  global Object execute(List<Object> args) {
    throw new AddErrorException((String) args[1]);
  }
}
