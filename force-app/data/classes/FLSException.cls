/**
 * @Description Exception class for FLS related issues
 * @date 2022-06-18
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class FLSException extends Exception {
  @TestVisible
  private static final String INUSFFICIENT_ACCESS_MESSAGE = 'Insufficient {0} access to: {1}';
  @TestVisible
  private DataStringAdapter stringAdapter {
    get {
      if (this.stringAdapter == null) {
        this.stringAdapter = new DataStringAdapter();
      }
      return this.stringAdapter;
    }
    set;
  }
  @TestVisible
  private List<String> violations {
    get {
      if (this.violations == null) {
        this.violations = new List<String>();
      }
      return this.violations;
    }
    set;
  }
  @TestVisible
  private String operationType;
  /**
   * @description Constructor
   * @param access Access Type that was used to determine FLS violation
   * @param violations Fields or Objects that failed the FLS check
   */
  global FLSException(System.AccessType access, List<String> violations) {
    this.operationType = this.stringAdapter.fromAccessType(access);
    this.violations = violations;
  }
  /**
   * @description Constructor
   * @param operation Database operation that was used to determine FLS violation
   * @param violations Fields of Objects that failed the FLS check
   */
  global FLSException(DatabaseOperation operation, List<String> violations) {
    this.operationType = this.stringAdapter.fromDatabaseOperation(operation);
    this.violations = violations;
  }
  /**
   * @description Returns FLS error message based on injected variables
   * @see [Custom Exceptions](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_custom.htm)
   * @return Custom error message
   */
  global override String getMessage() {
    return String.format(
      INUSFFICIENT_ACCESS_MESSAGE,
      new List<String>{ operationType, String.join(this.violations, ',') }
    );
  }
}
