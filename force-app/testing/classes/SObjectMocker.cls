/**
 * @description Mocking utility for mocking sobjects and related functionality
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SObjectMocker {
  private DataFactory factory {
    get {
      if (this.factory == null) {
        this.factory = new DataFactory();
      }
      return this.factory;
    }
    set;
  }
  private Integer currentIdIndex = 1;
  private Schema.SObjectType sObjType;
  /**
   * @description constructor
   * @param sObjType the type of sobject this mocker can mock for
   */
  public SObjectMocker(Schema.SObjectType sObjType) {
    this.sObjType = sObjType;
  }
  /**
   * @description Generates a mock id for the provided SObject Type
   * @return Mock id
   */
  global Id generateMockId() {
    String result = String.valueOf(currentIdIndex++);
    return this.sObjType.getDescribe().getKeyPrefix() +
      '0'.repeat(12 - result.length()) +
      result;
  }
  /**
   * @description generates a mock SObject
   * @return Mocked SObject without an id
   */
  global SObject generateMockSObject() {
    return this.factory.createSObjects(this.sObjType, 1)[0];
  }
  /**
   * @description generates a mock SObject
   * @param shouldHaveId Whether or not the mocked SObject should also have a mocked id
   * @return Mocked SObject
   */
  global SObject generateMockSObject(Boolean shouldHaveId) {
    SObject mockedObject = this.factory.createSObjects(this.sObjType, 1)[0];
    if (shouldHaveId) {
      mockedObject.Id = this.generateMockId();
    }
    return mockedObject;
  }
  /**
   * @description generates a mock SObject
   * @param fieldValues Field Values to set in the mocked object
   * @return Mocked SObject without an id
   */
  global SObject generateMockSObject(
    Map<Schema.SObjectField, Object> fieldValues
  ) {
    return this.factory.createSObjects(this.sObjType, fieldValues, 1)[0];
  }
  /**
   * @description generates a mock SObject
   * @param shouldHaveId Whether or not the mocked SObject should also have a mocked id
   * @param fieldValues Field Values to set in the mocked object
   * @return Mocked SObject
   */
  global SObject generateMockSObject(
    Boolean shouldHaveId,
    Map<Schema.SObjectField, Object> fieldValues
  ) {
    SObject mockedObject = this.factory.createSObjects(
      this.sObjType,
      fieldValues,
      1
    )[0];
    if (shouldHaveId) {
      mockedObject.Id = this.generateMockId();
    }
    return mockedObject;
  }
  /**
   * @description generates a list of mock SObjects
   * @param numOfRecords Number of mocked SObjects to generate
   * @return Mocked SObject without an id
   */
  global List<SObject> generateMockSObjects(Integer numOfRecords) {
    return this.factory.createSObjects(this.sObjType, numOfRecords);
  }
  /**
   * @description generates a list of mock SObjects
   * @param shouldHaveId Whether or not the mocked SObject should also have a mocked id
   * @param numOfRecords Number of mocked SObjects to generate
   * @return Mocked SObject
   */
  global List<SObject> generateMockSObjects(
    Boolean shouldHaveId,
    Integer numOfRecords
  ) {
    List<SObject> mockedObjects = this.factory.createSObjects(
      this.sObjType,
      numOfRecords
    );
    if (shouldHaveId) {
      for (SObject mockedObject : mockedObjects) {
        mockedObject.Id = this.generateMockId();
      }
    }
    return mockedObjects;
  }
  /**
   * @description generates a mock SObject
   * @param fieldValues Field Values to set in the mocked object
   * @param numOfRecords Number of mocked SObjects to generate
   * @return Mocked SObject without an id
   */
  global List<SObject> generateMockSObjects(
    Map<Schema.SObjectField, Object> fieldValues,
    Integer numOfRecords
  ) {
    return this.factory.createSObjects(
      this.sObjType,
      fieldValues,
      numOfRecords
    );
  }
  /**
   * @description generates a mock SObject
   * @param shouldHaveId Whether or not the mocked SObject should also have a mocked id
   * @param fieldValues Field Values to set in the mocked object
   * @param numOfRecords Number of mocked SObjects to generate
   * @return Mocked SObject
   */
  global List<SObject> generateMockSObjects(
    Boolean shouldHaveId,
    Map<Schema.SObjectField, Object> fieldValues,
    Integer numOfRecords
  ) {
    List<SObject> mockedObjects = this.factory.createSObjects(
      this.sObjType,
      fieldValues,
      numOfRecords
    );
    if (shouldHaveId) {
      for (SObject mockedObject : mockedObjects) {
        mockedObject.Id = this.generateMockId();
      }
    }
    return mockedObjects;
  }
}
