/**
 * @description Interface to implement for any method mock classes to be used with the mocking framework
 * @author Tom Wilkins
 * @date 2022-04-09
 * @group Testing
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global interface IMethodMock {
  /**
   * @description executes the intended mock behavior. If a method returns void, then simply return null from the function
   * @return Object the object to be returned, null for void
   */
  Object execute();
}
