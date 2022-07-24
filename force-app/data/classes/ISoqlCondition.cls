/**
 * @description Base interface for creating custom soql conditionals
 * @date 2022-07-22
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global interface ISoqlCondition {
  /**
   * @description Returns a valid soql WHERE clause for example
   * Name IN ('abc', '123')
   * @return Valid soql WHERE clause
   */
  String toSoql();
}
