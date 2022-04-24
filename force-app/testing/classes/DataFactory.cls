/**
 * @description Flexible data factory for generating data for a given SObject Type
 * @author Tom Wilkins
 * @date 2022-04-10
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class DataFactory {
  // this should be configurable in the future on a per type basis
  private static final String DEFAULT_STRING = 'Test String';
  private static final Double DEFAULT_DOUBLE = 12.34;
  private static final Date DEFAULT_DATE = Date.today();
  private static final DateTime DEFAULT_DATETIME = Datetime.now();
  private static final String DEFAULT_EMAIL = 'test@apexlibs.com';
  private static final Integer DEFAULT_INTEGER = 42;
  private static final String DEFAULT_PHONE = '555-555-5555';
  /**
   * @description Generates SObjects (not inserted) for the provided sobject inputs
   * @param sObjType Type of SObject to make records for
   * @param fieldValues Field -> value mapping to set on each record -- this will be consistent accross all records
   * @param numOfRecords Number of records to generate
   * @return List of generated SObjects, not inserted
   */
  global List<SObject> createSObjects(
    Schema.SObjectType sObjType,
    Map<Schema.SObjectField, Object> fieldValues,
    Integer numOfRecords
  ) {
    List<SObject> records = new List<SObject>();
    for (Integer i = 0; i <= numOfRecords; i++) {
      records.add(
        this.applyFieldValues(this.getBaseSObject(sObjType), fieldValues)
      );
    }
    return records;
  }
  /**
   * @description Generates SObjects (not inserted) for the provided sobject inputs
   * @param sObjType Type of SObject to make records for
   * @param numOfRecords Number of records to generate
   * @return List of generated SObjects, not inserted
   */
  global List<SObject> createSObjects(
    Schema.SObjectType sObjType,
    Integer numOfRecords
  ) {
    List<SObject> records = new List<SObject>();
    for (Integer i = 0; i <= numOfRecords; i++) {
      records.add(this.getBaseSObject(sObjType));
    }
    return records;
  }
  /**
   * @description Returns a base object with default (required) fields populated
   * @param sObjType Type of SObject to generate a base record of
   * @return Basic SObject with required fields defaulted
   */
  @TestVisible
  private SObject getBaseSObject(Schema.SObjectType sObjType) {
    SObject record = sObjType.newSObject();
    for (
      Schema.SObjectField field : sObjType.getDescribe()
        .fields.getMap()
        .values()
    ) {
      Schema.DescribeFieldResult fieldDescribe = field.getDescribe();
      if (fieldDescribe.isNillable() || !fieldDescribe.isCreateable()) {
        continue;
      }
      record.put(String.valueOf(field), this.getDefaultValue(fieldDescribe));
    }
    return record;
  }
  /**
   * @description Helper that gets the default value for a provided field
   * @param fieldDescribe Field Describe to use to determine default value
   * @return Value to be stored in the field, null if field type not supported
   */
  @TestVisible
  private Object getDefaultValue(Schema.DescribeFieldResult fieldDescribe) {
    Schema.DisplayType fieldType = fieldDescribe.getType();
    switch on (fieldType) {
      when base64 {
        return Blob.valueOf(DEFAULT_STRING);
      }
      when Boolean {
        return true;
      }
      when Combobox {
        return DEFAULT_STRING;
      }
      when Currency {
        return DEFAULT_DOUBLE;
      }
      when Date {
        return DEFAULT_DATE;
      }
      when DateTime {
        return DEFAULT_DATETIME;
      }
      when Double {
        return DEFAULT_DOUBLE;
      }
      when Email {
        return DEFAULT_EMAIL;
      }
      when EncryptedString {
        return DEFAULT_STRING;
      }
      when Integer {
        return DEFAULT_INTEGER;
      }
      when MultiPicklist {
        return this.getDefaultPicklistValue(fieldDescribe);
      }
      when Percent {
        return DEFAULT_DOUBLE;
      }
      when Phone {
        return DEFAULT_PHONE;
      }
      when Picklist {
        return this.getDefaultPicklistValue(fieldDescribe);
      }
      when String {
        return DEFAULT_STRING;
      }
    }
    // currently unsupported field types will just return null
    return null;
  }
  /**
   * @description Helper that returns a default picklist value for a provided picklist field
   * @param fieldDescribe field describe to extract picklist values from
   * @return String picklist value, null if no values found
   */
  @TestVisible
  private String getDefaultPicklistValue(
    Schema.DescribeFieldResult fieldDescribe
  ) {
    List<Schema.PicklistEntry> entries = fieldDescribe.getPicklistValues();
    String value = entries.isEmpty() ? null : entries[0].getValue();
    for (Schema.PicklistEntry entry : entries) {
      if (entry.isDefaultValue()) {
        value = entry.getvalue();
        break;
      }
    }
    return value;
  }
  /**
   * @description Applies the provided field values to the provided SObject
   */
  @TestVisible
  private SObject applyFieldValues(
    SObject obj,
    Map<Schema.SObjectField, Object> fieldValues
  ) {
    for (Schema.SObjectField field : fieldValues.keySet()) {
      obj.put(String.valueOf(field), fieldValues.get(field));
    }
    return obj;
  }
}
