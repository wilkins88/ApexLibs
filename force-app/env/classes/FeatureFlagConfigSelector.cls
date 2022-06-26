/**
 * @description Selector for retrieving configuration for feature flags
 * @date 2022-06-25
 * @group Env
 */
public inherited sharing class FeatureFlagConfigSelector {
  /**
   * @description returns a feature flag config record
   * @param featureDevName Developer name of the feature flag config record
   * @return Record if it exists, null otherwise
   */
  @SuppressWarnings('PMD.ApexCRUDViolation')
  public FeatureFlagSetting__mdt getFeatureConfig(String featureDevName) {
    List<FeatureFlagSetting__mdt> flag = [
      SELECT DeveloperName, ClassName__c
      FROM FeatureFlagSetting__mdt
      WHERE DeveloperName = :featureDevName
    ];
    return flag.isEmpty() ? null : flag[0];
  }
}
