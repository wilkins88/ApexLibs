/**
 * @description Mocking utility for mocking sobjects and related functionality
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SObjectMocker {
  private Map<String, List<SObject>> relatedLists {
    get {
      if (this.relatedLists == null) {
        this.relatedLists = new Map<String, List<SObject>>();
      }
      return this.relatedLists;
    }
    set;
  }
  private Boolean generateIds = false;
  private Integer currentIdIndex = 1;
  private Schema.SObjectType sObjType;
  private Type sObjClassType;
  /**
   * @description constructor
   * @param sObjType the type of sobject this mocker can mock for
   * @param sObjClassType Apex Type of the SObject apex class for deserialization
   */
  public SObjectMocker(Schema.SObjectType sObjType, Type sObjClassType) {
    this.sObjType = sObjType;
    this.sObjClassType = sObjClassType;
  }
  /**
   * @description Sets a related list that will be created with each generated SObject
   * @param relatedListName API name for the related list
   * @param relatedListRecords Records to be captured as a part of the related list
   * @return Reference to calling object
   */
  global SObjectMocker setRelatedList(
    String relatedListName,
    List<SObject> relatedListRecords
  ) {
    this.relatedLists.put(relatedListName, relatedListRecords);
    return this;
  }
  /**
   * @description Sets whether or not the mocker should generate ids for records
   * @param generateIds Whether or not the mocker should generated ids
   * @return Reference to calling object
   */
  global SObjectmocker shouldGenerateIds(Boolean generateIds) {
    this.generateIds = generateIds;
    return this;
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
    return this.augmentSObject(
      Testing.data.createSObjects(this.sObjType, 1)[0]
    );
  }
  /**
   * @description generates a mock SObject
   * @param fieldValues Field Values to set in the mocked object
   * @return Mocked SObject without an id
   */
  global SObject generateMockSObject(
    Map<Schema.SObjectField, Object> fieldValues
  ) {
    return this.augmentSObject(
      Testing.data.createSObjects(this.sObjType, fieldValues, 1)[0]
    );
  }
  /**
   * @description generates a list of mock SObjects
   * @param numOfRecords Number of mocked SObjects to generate
   * @return Mocked SObject without an id
   */
  global List<SObject> generateMockSObjects(Integer numOfRecords) {
    List<SObject> records = new List<SObject>();
    for (
      SObject record : Testing.data.createSObjects(this.sObjType, numOfRecords)
    ) {
      records.add(this.augmentSObject(record));
    }
    return records;
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
    List<SObject> records = new List<SObject>();
    for (
      SObject record : Testing.data.createSObjects(
        this.sObjType,
        fieldValues,
        numOfRecords
      )
    ) {
      records.add(this.augmentSObject(record));
    }
    return records;
  }
  /**
   * @description Augements an object based on internal state of the builder
   * @param record Record to augment
   * @return Augmented record
   */
  @TestVisible
  private SObject augmentSObject(SObject record) {
    if (this.generateIds) {
      record.Id = this.generateMockId();
    }
    if (!this.relatedLists.isEmpty()) {
      Map<String, Object> objMap = record.getPopulatedFieldsAsMap().clone();
      for (String relatedList : this.relatedLists.keySet()) {
        objMap.put(
          relatedList,
          new Map<String, Object>{
            'totalSize' => this.relatedLists.get(relatedList).size(),
            'done' => true,
            'records' => this.relatedLists.get(relatedList)
          }
        );
      }
      return (SObjectTriggerSetting__mdt) JSON.deserialize(
        JSON.serialize(objMap),
        this.sObjClassType
      );
    }
    return record;
  }
}
