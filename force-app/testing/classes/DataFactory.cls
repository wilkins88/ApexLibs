@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class DataFactory {
  global List<SObject> createSObjects(
    Schema.SObjectType sObjType,
    Map<Schema.SObjectField, Object> fieldValues,
    Integer numOfRecords
  ) {
    List<SObject> records = new List<SObject>();

    return records;
  }
  global List<SObject> createSObjects(
    Schema.SObjectType sObjType,
    Integer numOfRecords
  ) {
    List<SObject> records = new List<SObject>();

    return records;
  }
}
