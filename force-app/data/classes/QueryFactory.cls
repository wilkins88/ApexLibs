/**
 * @description Factory for creating query-related objects
 * @date 2022-7-24
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class QueryFactory {
  /**
   * @Description Returns a base query builder to use in selectors and data access classes
   * @param sObj Type of SObject to query for
   * @return Base QueryBuilder
   */
  global QueryBuilder createQueryBuilder(Schema.SObjectType sObj) {
    return new QueryBuilder(sObj);
  }
  /**
   * @description Returns a simple soql condition
   * @param field Field to filter on
   * @param operator Operator to use for filter
   * @param value value to filter on
   * @return Simple SOQL WHERE Condition representing inputs
   */
  global SimpleCondition createSimpleCondition(
    Schema.SObjectField field,
    SoqlComparisonOperator operator,
    Object value
  ) {
    return new SimpleCondition(field, operator, value);
  }
  /**
   * @description Returns a simple soql condition
   * @param prefix Prefix to be used when building the SOQL filter, usually a relationship
   * e.g. MyCustomRelation__r
   * @param field Field to filter on
   * @param operator Operator to use for filter
   * @param value value to filter on
   * @return Simple SOQL WHERE Condition representing inputs
   */
  @SuppressWarnings('PMD.ExcessiveParameterList')
  global SimpleCondition createSimpleCondition(
    String prefix,
    Schema.SObjectField field,
    SoqlComparisonOperator operator,
    Object value
  ) {
    return new SimpleCondition(field, operator, value).setPrefix(prefix);
  }
  /**
   * @description Returns a compound soql condition
   * @param leftCondition Left condition of the compound conditional
   * @param rightCondition Right condition of the compound conditional
   * @param operator Logical operator used to join the left and right conditions
   * @return Compound SOQL WHERE condition representing inputs
   */
  global CompoundCondition createCompoundCondition(
    ISoqlCondition leftCondition,
    ISoqlCondition rightCondition,
    SoqlLogicalOperator operator
  ) {
    return new CompoundCondition(leftCondition, rightCondition, operator);
  }
  /**
   * @description Returns a soql ordering
   * @param field Field to order on
   * @return SOQL ordering representing inputs
   */
  global SoqlOrdering createSoqlOrdering(Schema.SObjectField field) {
    return new SoqlOrdering(field);
  }
  /**
   * @description Returns a soql ordering
   * @param prefix Prefix to be used when building the SOQL filter, usually a relationship
   * e.g. MyCustomRelation__r
   * @param field Field to order on
   * @return SOQL ordering representing inputs
   */
  global SoqlOrdering createSoqlOrdering(
    String prefix,
    Schema.SObjectField field
  ) {
    return new SoqlOrdering(field).setPrefix(prefix);
  }
  /**
   * @description Returns a soql ordering
   * @param field Field to order on
   * @param ascending True if ascending, false if descending (true by default)
   * @param nullsFirst true if nulls first, false if nulls last (true by default)
   * @return SOQL ordering representing inputs
   */
  global SoqlOrdering createSoqlOrdering(
    Schema.SObjectField field,
    Boolean ascending,
    Boolean nullsFirst
  ) {
    return new SoqlOrdering(field)
      .setAscending(ascending)
      .SetNullsFirst(nullsFirst);
  }
  /**
   * @description Returns a soql ordering
   * @param prefix Prefix to be used when building the SOQL filter, usually a relationship
   * e.g. MyCustomRelation__r
   * @param field Field to order on
   * @param ascending True if ascending, false if descending (true by default)
   * @param nullsFirst true if nulls first, false if nulls last (true by default)
   * @return SOQL ordering representing inputs
   */
  @SuppressWarnings('PMD.ExcessiveParameterList')
  global SoqlOrdering createSoqlOrdering(
    String prefix,
    Schema.SObjectField field,
    Boolean ascending,
    Boolean nullsFirst
  ) {
    return new SoqlOrdering(field)
      .setPrefix(prefix)
      .setAscending(ascending)
      .SetNullsFirst(nullsFirst);
  }
}
