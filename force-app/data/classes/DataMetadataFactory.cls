/**
 * @description Factory for producuing classes relevant to metadata surrounding database operations
 * @date 2022-07-22
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class DataMetadataFactory {
  /**
   * @description Creates and returns an SObject inspector
   * @param sObjType Type of SObject to create inspector for
   * @return Inspector for the provided SObject
   */
  global SObjectInspector createSObjectInspector(Schema.SObjectType sObjType) {
    return new SObjectInspector(sObjType);
  }
}
