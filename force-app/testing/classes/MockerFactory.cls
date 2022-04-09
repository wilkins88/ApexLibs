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
   * @param methodMocks Map of method name strings to method mocks
   * @return ClassMocker with provided method mocks set
   */
  global ClassMocker createClassMocker(Map<String, IMethodMock> methodMocks) {
    ClassMocker mocker = new ClassMocker();
    for (String methodName : methodMocks.keySet()) {
      mocker.setMethodMock(methodName, methodMocks.get(methodName));
    }
    return mocker;
  }
  /**
   * @description Creates an SObject mocker for the provided sobject type
   * @param sObjType the type of sobject the mocker should be able to mock
   * @return SObjectMocker for provided sobject type
   */
  global SObjectMocker createSObjectMocker(Schema.SObjectType sObjType) {
    return new SObjectMocker(sObjType);
  }
}
