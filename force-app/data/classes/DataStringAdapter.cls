/**
 * @description Apapter for going back and forth between various enums and types to strings
 * @date 2022-06-18
 * @group Data
 */
public inherited sharing class DataStringAdapter {
  @TestVisible
  private static final String INVALID_FILTER_OBJECT = 'SOQL filter value must be a primitive type or collection of primitive types';
  @TestVisible
  private static final String READ_STRING = 'Read';
  @TestVisible
  private static final String INSERT_STRING = 'Insert';
  @TestVisible
  private static final String UPDATE_STRING = 'Update';
  @TestVisible
  private static final String UPSERT_STRING = 'Upsert';
  @TestVisible
  private static final String DELETE_STRING = 'Delete';
  @TestVisible
  private static final String UNDELETE_STRING = 'Undelete';

  /**
   * @description Returns the string mapping for the provided access type
   * @param access AccessType enum to generate a string for
   * @return String that is consistent across multiple type enums
   */
  public String fromAccessType(System.AccessType access) {
    switch on (access) {
      when READABLE {
        return READ_STRING;
      }
      when CREATABLE {
        return INSERT_STRING;
      }
      when UPDATABLE {
        return UPDATE_STRING;
      }
      when UPSERTABLE {
        return UPSERT_STRING;
      }
      when else {
        return '';
      }
    }
  }
  /**
   * @description Returns the string mapping for the provided database operation
   * @param operation DatabaseOperation enum to generate a string for
   * @return String that is consistent across multiple type enums
   */
  public String fromDatabaseOperation(DatabaseOperation operation) {
    switch on (operation) {
      when DML_INSERT {
        return INSERT_STRING;
      }
      when DML_UPDATE {
        return UPDATE_STRING;
      }
      when DML_UPSERT {
        return UPSERT_STRING;
      }
      when DML_DELETE {
        return DELETE_STRING;
      }
      when DML_UNDELETE {
        return UNDELETE_STRING;
      }
      when else {
        return '';
      }
    }
  }
  /**
   * @description Returns the string representation of the comparison operator
   * @param operator Operator to convert
   * @return String representation of operator
   */
  public String fromComparisonOperator(SoqlComparisonOperator operator) {
    switch on (operator) {
      when EQUALS {
        return '=';
      }
      when DOES_NOT_EQUAL {
        return '!=';
      }
      when IS_IN {
        return 'IN';
      }
      when IS_NOT_IN {
        return 'NOT IN';
      }
      when IS_GREATER_THAN {
        return '>';
      }
      when IS_GREATER_THAN_OR_EQUAL_TO {
        return '>=';
      }
      when IS_LESS_THAN {
        return '<';
      }
      when IS_LESS_THAN_OR_EQUAL_TO {
        return '<=';
      }
      when INCLUDES {
        return 'INCLUDES';
      }
      when EXCLUDES {
        return 'EXCLUDES';
      }
      when IS_LIKE {
        return 'LIKE';
      }
    }
    return '';
  }
  /**
   * @description Returns a string representation of the provided logical operator enum
   * @param operator Operator to convert
   * @return String representation of operator
   */
  public String fromLogicalOperator(SoqlLogicalOperator operator) {
    switch on (operator) {
      when LOGICAL_AND {
        return 'AND';
      }
      when LOGICAL_OR {
        return 'OR';
      }
    }
    return '';
  }
  /**
   * @description Returns a string representation of the object passed in
   * @param value Primitive or collection of primitices
   * @return String representation of the object
   */
  public String fromObject(Object value) {
    if (value == null) {
      return 'null';
    } else if (value instanceof String || value instanceof Id) {
      return '\'' + String.escapeSingleQuotes((String) value) + '\'';
    } else if (
      value instanceof Boolean ||
      value instanceof Integer ||
      value instanceof Long ||
      value instanceof Decimal ||
      value instanceof Double
    ) {
      return String.valueOf(value);
    } else if (value instanceof Date) {
      return Datetime.newInstance(
          ((Date) value).year(),
          ((Date) value).month(),
          ((Date) value).day()
        )
        .format('yyyy-MM-dd');
    } else if (value instanceof Datetime) {
      return ((Datetime) value).format('yyyy-MM-dd') +
        'T' +
        ((Datetime) value).format('hh:mm:ss') +
        'Z';
    } else {
      return this.fromNonPrimitiveObject(value);
    }
  }
  /**
   * @description Helper that processes non primitive objects and converts them to strings
   * @param value Non-primitive object to convert
   * @return String representation of object
   */
  @TestVisible
  private String fromNonPrimitiveObject(Object value) {
    List<Object> objs;
    if (value instanceof List<Object>) {
      objs = (List<Object>) value;
    } else if (value instanceof Set<String>) {
      objs = new List<String>((Set<String>) value);
    } else if (value instanceof Set<Id>) {
      objs = new List<Id>((Set<Id>) value);
    } else if (value instanceof Set<Boolean>) {
      objs = new List<Boolean>((Set<Boolean>) value);
    } else if (value instanceof Set<Integer>) {
      objs = new List<Integer>((Set<Integer>) value);
    } else if (value instanceof Set<Long>) {
      objs = new List<Long>((Set<Long>) value);
    } else if (value instanceof Set<Decimal>) {
      objs = new List<Decimal>((Set<Decimal>) value);
    } else if (value instanceof Set<Double>) {
      objs = new List<Double>((Set<Double>) value);
    } else {
      throw new IllegalArgumentException(INVALID_FILTER_OBJECT);
    }
    List<String> strings = new List<String>();
    for (Object obj : objs) {
      strings.add(this.fromObject(obj));
    }
    return '(' + String.join(strings, ',') + ')';
  }
}
