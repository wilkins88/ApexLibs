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
   * @param classType the type of class to mock
   * @param methodMocks Map of method name strings to method mocks
   * @return Mocked Object
   */
  global Object mockClass(
    System.Type classType,
    Map<String, IMethodMock> methodMocks
  ) {
    ClassMocker mocker = new ClassMocker(classType);
    for (String methodName : methodMocks.keySet()) {
      mocker.setMethodMock(methodName, methodMocks.get(methodName));
    }
    return mocker.construct();
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
