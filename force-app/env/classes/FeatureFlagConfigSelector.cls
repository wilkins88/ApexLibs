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
  public FeatureFlagSetting__mdt getFeatureConfig(String featureDevName) {
    SObjectInspector inspector = Data.metadata.createSObjectInspector(
      FeatureFlagSetting__mdt.getSobjectType()
    );
    List<String> fields = new List<String>();
    for (Schema.SObjectField field : inspector.getAllFields()) {
      fields.add(String.valueOf(field));
    }
    String query =
      'SELECT ' +
      String.join(fields, ',') +
      ' FROM FeatureFlagSetting__mdt ' +
      ' WHERE DeveloperName = :featureDevName';
    List<FeatureFlagSetting__mdt> flag = (List<FeatureFlagSetting__mdt>) Database.query(
      String.escapeSingleQuotes(query)
    );
    return flag.isEmpty() ? null : flag[0];
  }
}
