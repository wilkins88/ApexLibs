/**
 * @description Apapter for going back and forth between various enums and types to strings
 * @date 2022-06-18
 * @group Data
 */
public inherited sharing class DataStringAdapter {
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
}
