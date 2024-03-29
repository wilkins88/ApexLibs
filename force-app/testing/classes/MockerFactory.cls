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
   * @description Creates a ClassMocker and sets the methods provided to return the values provided
   * @param methodMocks Map of method name strings to method mocks
   * @return ClassMocker
   */
  global ClassMocker createClassMocker(Map<String, IMethodMock> methodMocks) {
    return this.createClassMocker(methodMocks, null);
  }
  /**
   * @description Creates a ClassMocker and sets the methods provided to return the values provided
   * @param methodMocks Map of method name strings to method mocks
   * @return ClassMocker
   */
  global ClassMocker createClassMocker(
    Map<String, IMethodMock> methodMocks,
    IMethodMock defaultMethodMock
  ) {
    ClassMocker mocker = new ClassMocker();
    if (methodMocks != null) {
      for (String methodName : methodMocks.keySet()) {
        mocker.setMethodMock(methodName, methodMocks.get(methodName));
      }
    }
    if (defaultMethodMock != null) {
      mocker.setDefaultMethodMock(defaultMethodMock);
    }
    return mocker;
  }
  /**
   * @description Creates an SObject mocker for the provided sobject type
   * @param sObjType the type of sobject the mocker should be able to mock
   * @param sObjClassType Apex type of the SObject class
   * @return SObjectMocker for provided sobject type
   */
  global SObjectMocker createSObjectMocker(
    Schema.SObjectType sObjType,
    Type sObjClassType
  ) {
    return new SObjectMocker(sObjType, sObjClassType);
  }
}
