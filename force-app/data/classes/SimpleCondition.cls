/**
 * @description Simple conditional which supports a single filter field/value combo
 * @date 2022-07-22
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SimpleCondition implements ISoqlCondition {
  @TestVisible
  private static final String CONDITION_STRING = '{0} {1} {2}';
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
  private String prefix;
  @TestVisible
  private Schema.SObjectField field;
  @TestVisible
  private SoqlComparisonOperator operator;
  @TestVisible
  private Object value;
  /**
   * @description Constructor
   * @param field Field to filter on e.g. Account.Name
   * @param operator Soql comparison operation e.g. = or IN
   * @param value Value to compare against e.g. 'Tom Wilkins' or ('abc', '123')
   */
  public SimpleCondition(
    Schema.SObjectField field,
    SoqlComparisonOperator operator,
    Object value
  ) {
    this.field = field;
    this.operator = operator;
    this.value = value;
  }
  /**
   * @description Prefix setter
   * @param prefix Prefix to be prepended to the field, usually a relation name e.g. MyCustomRelation__r
   * @return Invoking object
   */
  public SimpleCondition setPrefix(String prefix) {
    this.prefix = prefix;
    return this;
  }
  /**
   * @description Returns a simple, single-value soql where clause
   * @see [ISoqlCondition](/docs/Data/ISoqlCondition.md)
   * @return Single value soql condtion e.g. Name = 'Tom Wilkins'
   */
  global String toSoql() {
    return String.format(
      CONDITION_STRING,
      new List<String>{
        String.isBlank(this.prefix)
          ? String.valueOf(this.field)
          : this.prefix + '.' + String.valueOf(this.field),
        this.stringAdapter.fromComparisonOperator(this.operator),
        this.stringAdapter.fromObject(this.value)
      }
    );
  }
}
