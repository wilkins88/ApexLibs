/**
 * @description Class that wraps around various SObject inspection functionality (such as retrieving fields)
 * @date 2022-07-02
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SObjectInspector {
  @TestVisible
  private Schema.SObjectType sObjType;

  /**
   * @description Constructor
   * @param sObjType Type of SObject to inspect
   */
  public SObjectInspector(Schema.SObjectType sObjType) {
    this.sObjType = sObjType;
  }
  /**
   * @description Returns all fields for the provided sobject type
   * @return All fields for the SObject type
   */
  global List<Schema.SObjectField> getAllFields() {
    return this.sObjType.getDescribe().fields.getMap().values();
  }
}
