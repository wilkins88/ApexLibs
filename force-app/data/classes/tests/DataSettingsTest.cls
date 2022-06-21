@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class DataSettingsTest {
  @IsTest
  private static void shouldEnforceFLS_defaults_returnTrue() {
    DataSettings settings = new DataSettings();
    System.Test.startTest();
    Boolean result = settings.shouldEnforceFLS();
    System.Test.stopTest();
    System.assertEquals(true, result, 'Default FLS setting should be true');
  }
  @IsTest
  private static void shouldEnforceFLS_setToFalse_returnSetFalse() {
    DataSettings settings = new DataSettings();
    settings.enforceFLS = false;
    System.Test.startTest();
    Boolean result = settings.shouldEnforceFLS();
    System.Test.stopTest();
    System.assertEquals(false, result, 'Should return the set value');
  }
  @IsTest
  private static void shouldAllowFieldStripping_defaults_returnFalse() {
    DataSettings settings = new DataSettings();
    System.Test.startTest();
    Boolean result = settings.shouldAllowFieldStripping();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should not allow field stripping by default'
    );
  }
  @IsTest
  private static void shouldAllowFieldStripping_setToTrue_returnTrue() {
    DataSettings settings = new DataSettings();
    settings.allowFieldStripping = true;
    System.Test.startTest();
    Boolean result = settings.shouldAllowFieldStripping();
    System.Test.stopTest();
    System.assertEquals(true, result, 'Should return the set value');
  }
  @IsTest
  private static void enableFLS_setToTrue() {
    DataSettings settings = new DataSettings();
    settings.enforceFLS = false;
    System.Test.startTest();
    settings.enableFLS();
    System.Test.stopTest();
    System.assertEquals(
      true,
      settings.enforceFLS,
      'Should set enforce fls to true'
    );
  }
  @IsTest
  private static void disableFLS_setToFalse() {
    DataSettings settings = new DataSettings();
    settings.enforceFLS = true;
    System.Test.startTest();
    settings.disableFLS();
    System.Test.stopTest();
    System.assertEquals(
      false,
      settings.enforceFLS,
      'Should set enforce fls to false'
    );
  }
  @IsTest
  private static void enableFieldStripping_setToTrue() {
    DataSettings settings = new DataSettings();
    settings.enforceFLS = false;
    settings.allowFieldStripping = false;
    System.Test.startTest();
    settings.enableFieldStripping();
    System.Test.stopTest();
    System.assertEquals(
      true,
      settings.enforceFLS,
      'Should set enforce fls to true'
    );
    System.assertEquals(
      true,
      settings.allowFieldStripping,
      'Should set allow field stripping to true'
    );
  }
  @IsTest
  private static void disableFieldStripping_setToFalse() {
    DataSettings settings = new DataSettings();
    settings.enforceFLS = true;
    settings.allowFieldStripping = true;
    System.Test.startTest();
    settings.disableFieldStripping();
    System.Test.stopTest();
    System.assertEquals(
      true,
      settings.enforceFLS,
      'Should not change fls enforcement'
    );
    System.assertEquals(
      false,
      settings.allowFieldStripping,
      'Should set allow field stripping to false'
    );
  }
}
