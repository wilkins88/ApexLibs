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
    this.field = field;
  }
  /**
   * @description Prefix setter
   * @param prefix Prefix to be prepended to the field, usually a relation name e.g. MyCustomRelation__r
   * @return Invoking object
   */
  public SoqlOrdering setPrefix(String prefix) {
    this.prefix = prefix;
    return this;
  }
  /**
   * @description Asc/Desc  setter
   * @param ascending True if ascending, false if descending
   * @return Invoking object
   */
  public SoqlOrdering setAscending(Boolean ascending) {
    this.ascending = ascending;
    return this;
  }
  /**
   * @description Nulls ordering setter
   * @param nullsFirst True if nulls first, false if nulls after
   * @return Invoking object
   */
  public SoqlOrdering setNullsFirst(Boolean nullsFirst) {
    this.nullsFirst = nullsFirst;
    return this;
  }
  /**
   * @description Returns the SOQL ORDER BY clause string
   * @return SOQL String representing ordering
   */
  global String toSoql() {
    String soql = String.isBlank(this.prefix)
      ? String.valueOf(this.field)
      : this.prefix + '.' + String.valueOf(this.field);
    soql += this.ascending ? ' ASC' : ' DESC';
    soql += this.nullsFirst ? ' NULLS FIRST' : ' NULLS LAST';
    return soql;
  }
}
