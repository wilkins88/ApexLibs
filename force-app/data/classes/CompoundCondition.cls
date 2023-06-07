/**
 * @description Captures compound soql conditionals joined by logical operators
 * Afford the composition of complex conditionals that can be built up by smaller conditionals
 * @date 2022-07-23
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class CompoundCondition implements ISoqlCondition {
  @TestVisible
  private static final String CONDITION_STRING = '({0} {1} {2})';
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
  private ISoqlCondition leftCondition;
  @TestVisible
  private ISoqlCondition rightCondition;
  @TestVisible
  private SoqlLogicalOperator operator;

  /**
   * @description constructor
   * @param leftCondition Left part of the compound condition
   * @param rightCondition Right part of the compound condition
   * @param operator Logical operator link the left and right conditions of the complex condition
   */
  public CompoundCondition(
    ISoqlCondition leftCondition,
    ISoqlCondition rightCondition,
    SoqlLogicalOperator operator
  ) {
    this.leftCondition = leftCondition;
    this.rightCondition = rightCondition;
    this.operator = operator;
  }
  /**
   * @description Returns a compound soql where clause
   * @see [ISoqlCondition](/docs/Data/ISoqlCondition.md)
   * @return Compound soql where clause e.g. (Id = '123' AND Name IN ('abc'))
   */
  global String toSoql() {
    return String.format(
      CONDITION_STRING,
      new List<String>{
        this.leftCondition.toSoql(),
        this.stringAdapter.fromLogicalOperator(this.operator),
        this.rightCondition.toSoql()
      }
    );
  }
}
