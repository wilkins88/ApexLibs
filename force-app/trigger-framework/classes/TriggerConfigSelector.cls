/**
 * @description Selector class for returning configuration related to trigger functionality
 * @author Tom Wilkins
 * @date 2022-04-12
 * @group Triggers
 */
@SuppressWarnings('PMD.ApexCRUDViolation')
public inherited sharing class TriggerConfigSelector {
  public List<SObjectTriggerSetting__mdt> getTriggerSettings(
    Schema.SObjectType sObjType
  ) {
    return [
      SELECT
        SObjectType__c,
        (
          SELECT ClassName__c
          FROM TriggerHandlerSettings__r
          WHERE IsActive__c = TRUE
          ORDER BY Priority__c ASC NULLS LAST
        )
      FROM SObjectTriggerSetting__mdt
      WHERE SObjectType__c = :String.valueOf(sObjType) AND IsActive__c = TRUE
    ];
  }
}
