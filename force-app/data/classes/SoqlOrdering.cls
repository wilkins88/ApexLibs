/**
 * @description Represents and constructs a SOQL ORDER BY clause
 * @date 2022-07-22
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class SoqlOrdering {
  @TestVisible
  private Boolean ascending {
    get {
      if (this.ascending == null) {
        this.ascending = true;
      }
      return this.ascending;
    }
    set;
  }
  @TestVisible
  private Boolean nullsFirst {
    get {
      if (this.nullsFirst == null) {
        this.nullsFirst = true;
      }
      return this.nullsFirst;
    }
    set;
  }
  @TestVisible
  private Schema.SObjectField field;
  @TestVisible
  private String prefix;
  /**
   * @description Constrcutor
   * @param field The field to order on
   */
  public SoqlOrdering(Schema.SObjectField field) {
    this('', field);
  }
  /**
   * @description Constrcutor
   * @param prefix Prefix to attach to the field in the order by clause
   * primarily used for relationships e.g. MyRelationship__r
   * @param field The field to order on
   */
  public SoqlOrdering(String prefix, Schema.SObjectField field) {
    this.prefix = prefix;
    this.field = field;
  }
  /**
   * @description Constrcutor
   * @param field The field to order on
   * @param ascending True for asc, false for desc
   * @param nullsFirst True for nulls first, false for nulls last
   */
  public SoqlOrdering(
    Schema.SObjectField field,
    Boolean ascending,
    Boolean nullsFirst
  ) {
    this('', field, ascending, nullsFirst);
  }
  /**
   * @description Constrcutor
   * @param prefix Prefix to attach to the field in the order by clause
   * primarily used for relationships e.g. MyRelationship__r
   * @param field The field to order on
   * @param ascending True for asc, false for desc
   * @param nullsFirst True for nulls first, false for nulls last
   */
  @SuppressWarnings('PMD.ExcessiveParameterlist')
  public SoqlOrdering(
    String prefix,
    Schema.SObjectField field,
    Boolean ascending,
    Boolean nullsFirst
  ) {
    this.prefix = prefix;
    this.field = field;
    this.ascending = ascending;
    this.nullsFirst = nullsFirst;
  }
  /**
   * @description Returns the SOQL ORDER BY clause string
   * @return SOQL String representing ordering
   */
  public String toSoql() {
    String soql = String.isBlank(this.prefix)
      ? String.valueOf(this.field)
      : this.prefix + '.' + String.valueOf(this.field);
    soql += this.ascending ? ' ASC' : ' DESC';
    soql += this.nullsFirst ? ' NULLS FIRST' : ' NULLS LAST';
    return soql;
  }
}
