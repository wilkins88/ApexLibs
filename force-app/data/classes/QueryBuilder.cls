/**
 * @description Query builder useful for dynamic and flexible queries in a safe manner
 * via compile time field valiadation and repeatable construction of dynamic queries
 * @date 2022-07-23
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class QueryBuilder {
  @TestVisible
  private Set<Schema.SObjectField> fields {
    get {
      if (this.fields == null) {
        this.fields = new Set<Schema.SObjectField>();
      }
      return this.fields;
    }
    set;
  }
  @TestVisible
  private Map<String, Set<Schema.SObjectField>> crossObjectQueries {
    get {
      if (this.crossObjectQueries == null) {
        this.crossObjectQueries = new Map<String, Set<Schema.SObjectField>>();
      }
      return this.crossObjectQueries;
    }
    set;
  }
  @TestVisible
  private Map<String, Set<Schema.SObjectField>> relatedListQueries {
    get {
      if (this.relatedListQueries == null) {
        this.relatedListQueries = new Map<String, Set<Schema.SObjectField>>();
      }
      return this.relatedListQueries;
    }
    set;
  }
  @TestVisible
  private List<SoqlOrdering> ordering {
    get {
      if (this.ordering == null) {
        this.ordering = new List<SoqlOrdering>();
      }
      return this.ordering;
    }
    set;
  }
  @TestVisible
  private Schema.SObjectType sObj;
  @TestVisible
  private ISoqlCondition condition;
  @TestVisible
  private Integer recordLimit;
  @TestVisible
  private Integer recordOffset;
  /**
   * @description Constructor
   * @param sObj SObject to query
   */
  public QueryBuilder(Schema.SObjectType sObj) {
    this.sObj = sObj;
  }
  /**
   * @description Field setter
   * @param fields Queried fields to set
   * @return Reference to the invoking object
   */
  global QueryBuilder setFields(Set<Schema.SObjectField> fields) {
    this.fields = fields;
    return this;
  }
  /**
   * @description Field setter
   * @param fields Queried fields to set
   * @param crossObjectQueries Cross object queries to set
   * @param relatedListQueries Related list queriest to set
   * @return Reference to the invoking object
   */
  global QueryBuilder setFields(
    Set<Schema.SObjectField> fields,
    Map<String, Set<Schema.SObjectField>> crossObjectQueries,
    Map<String, Set<Schema.SObjectField>> relatedListQueries
  ) {
    this.fields = fields;
    this.crossObjectQueries = crossObjectQueries;
    this.relatedListQueries = relatedListQueries;
    return this;
  }
  /**
   * @description Condition setter
   * @param condition Condition to set
   * @return Reference to the invoking object
   */
  global QueryBuilder setCondition(ISoqlCondition condition) {
    this.condition = condition;
    return this;
  }
  /**
   * @description Limit setter
   * @param recordLimit Limit to set
   * @return Reference to the invoking object
   */
  global QueryBuilder setRecordLimit(Integer recordLimit) {
    this.recordLimit = recordLimit;
    return this;
  }
  /**
   * @description Offset setter
   * @param recordOffset Offset to set
   * @return Reference to the invoking object
   */
  global QueryBuilder setRecordOffset(Integer recordOffset) {
    this.recordOffset = recordOffset;
    return this;
  }
  /**
   * @description Ordering setter
   * @param ordering Ordering to set (order-sensitive)
   * @return Reference to the invoking object
   */
  global QueryBuilder setOrdering(List<SoqlOrdering> ordering) {
    this.ordering = ordering;
    return this;
  }
  /**
   * @description Generates a valid SOQL statement based of state which can be executed
   * @return SOQL query string
   */
  global String toSoql() {
    List<String> fieldStrings = this.getFieldStrings('', this.fields);
    for (String relationship : this.crossObjectQueries.keySet()) {
      fieldStrings.addAll(
        this.getFieldStrings(
          relationship,
          this.crossObjectQueries.get(relationship)
        )
      );
    }
    for (String relationship : this.relatedListQueries.keySet()) {
      fieldStrings.add(
        '(SELECT ' +
        String.join(
          this.getFieldStrings('', this.relatedListQueries.get(relationShip)),
          ','
        ) +
        ' FROM ' +
        relationship +
        ')'
      );
    }
    String soql = 'SELECT ' + String.join(fieldStrings, ',');
    soql += (this.condition != null) ? ' WHERE ' + condition.toSoql() : '';
    soql += (!this.ordering.isEmpty())
      ? ' ORDER BY ' + this.joinOrderings()
      : '';
    soql += (this.recordLimit != null)
      ? ' LIMIT ' + String.valueOf(this.recordLimit)
      : '';
    soql += (this.recordOffset != null)
      ? ' OFFSET ' + String.valueOf(this.recordOffset)
      : '';
    return soql;
  }
  /**
   * @description Returns the field strings for the given prefix and fields
   * @param prefix String to add to prefix a field e.g. MyPrefix.MyField__c
   * null or empty string prefix will result in no prefix added
   * @param fields Fields to get strings for
   * @return List of field strings with or without prefix added
   */
  @TestVisible
  private List<String> getFieldStrings(
    String prefix,
    Set<Schema.SObjectField> fields
  ) {
    List<String> fieldStrings = new List<String>();
    for (Schema.SObjectField field : fields) {
      fieldStrings.add(
        String.isBlank(prefix)
          ? String.valueOf(field)
          : prefix + '.' + String.valueOf(field)
      );
    }
    return fieldStrings;
  }
  /**
   * @description Helper that joins orderings into a single string
   * @return Single string representation of all combined orderings
   */
  @TestVisible
  private String joinOrderings() {
    List<String> soqlStrings = new List<String>();
    for (SoqlOrdering ord : this.ordering) {
      soqlStrings.add(ord.toSoql());
    }
    return String.join(soqlStrings, ',');
  }
}
