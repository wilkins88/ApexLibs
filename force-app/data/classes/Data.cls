/**
 * @description Static accessor class for data and database related functionality
 * @date 2022-06-18
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class Data {
  @TestVisible
  global static DataSettings settings {
    get {
      if (settings == null) {
        settings = new DataSettings();
      }
      return settings;
    }
    private set;
  }
  @TestVisible
  global static EnhancedDML dml {
    get {
      if (dml == null) {
        dml = new EnhancedDml();
      }
      return dml;
    }
    private set;
  }
}
