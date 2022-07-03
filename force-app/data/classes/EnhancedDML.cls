/**
 * @description DML interface to be used as a replacement for standard DML. Supports flexible (and default)
 * enforcement of FLS on operations, as well as supports mocking to remove automation dependencies from
 * Unit tests that require database operations
 * @date 2022-06-18
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class EnhancedDML {
  /**
   * @description Inserts a single record
   * @param record Record to insert
   * @return Save results from the insert operation
   */
  global Database.SaveResult insertRecord(SObject record) {
    return this.insertRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Inserts a single record with DML options
   * @param record Record to insert
   * @param options DML options, same as provided to Database.insert
   * @return Save results from the insert operation
   */
  global Database.SaveResult insertRecord(
    SObject record,
    Database.DMLOptions options
  ) {
    return this.insertRecords(new List<SObject>{ record }, options)[0];
  }
  /**
   * @description Inserts a collection of records
   * @param record Records to insert
   * @return Save results from the insert operation
   */
  global List<Database.SaveResult> insertRecords(List<SObject> records) {
    return Database.insert(
      this.enforceFLS(records, System.AccessType.CREATABLE)
    );
  }
  /**
   * @description Inserts a collection of records with DML options
   * @param record Records to insert
   * @param options DML options, same as provided to Database.insert
   * @return Save results from the insert operation
   */
  global List<Database.SaveResult> insertRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    return Database.insert(
      this.enforceFLS(records, System.AccessType.CREATABLE),
      options
    );
  }
  /**
   * @description Updates a single record
   * @param record Record to update
   * @return Save results from the update operation
   */
  global Database.SaveResult updateRecord(SObject record) {
    return this.updateRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Updates a single record with DML options
   * @param record Record to update
   * @param options DML options, same as provided to Database.update
   * @return Save results from the update operation
   */
  global Database.SaveResult updateRecord(
    SObject record,
    Database.DMLOptions options
  ) {
    return this.updateRecords(new List<SObject>{ record }, options)[0];
  }
  /**
   * @description Updates a collection of records
   * @param record Records to update
   * @return Save results from the update operation
   */
  global List<Database.SaveResult> updateRecords(List<SObject> records) {
    return Database.update(
      this.enforceFLS(records, System.AccessType.UPDATABLE)
    );
  }
  /**
   * @description Updates a collection of records with DML options
   * @param record Records to update
   * @param options DML options, same as provided to Database.update
   * @return Save results from the update operation
   */
  global List<Database.SaveResult> updateRecords(
    List<SObject> records,
    Database.DMLOptions options
  ) {
    return Database.update(
      this.enforceFLS(records, System.AccessType.UPDATABLE),
      options
    );
  }
  /**
   * @description Upserts a single record
   * @param record Record to upsert
   * @return Save results from the upsert operation
   */
  global Database.UpsertResult upsertRecord(SObject record) {
    return this.upsertRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Upserts a collection of records
   * @param record Records to upsert
   * @return Save results from the upsert operation
   */
  global List<Database.UpsertResult> upsertRecords(List<SObject> records) {
    return this.upsertRecords(records, true);
  }
  /**
   * @description Upserts a collection of records
   * @param record Records to upsert
   * @param allOrNone Whether partial DB writes should be allowed
   * @return Save results from the upsert operation
   */
  global List<Database.UpsertResult> upsertRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    return Database.upsert(
      this.enforceFLS(records, System.AccessType.UPSERTABLE),
      allOrNone
    );
  }
  /**
   * @description Deletes a single record
   * @param record Record to delete
   * @return Save results from the delete operation
   */
  global Database.DeleteResult deleteRecord(SObject record) {
    return this.deleteRecords(new List<SObject>{ record })[0];
  }
  /**
   * @description Deletes a single record
   * @param recordId Id of the record to delete
   * @return Save results from the delete operation
   */
  global Database.DeleteResult deleteRecord(Id recordId) {
    return this.deleteRecords(new List<Id>{ recordId })[0];
  }
  /**
   * @description Deletes a collection of records
   * @param records Records to delete
   * @return Save results from the delete operation
   */
  global List<Database.DeleteResult> deleteRecords(List<SObject> records) {
    return this.deleteRecords(records, true);
  }
  /**
   * @description Deletes a collection of records
   * @param records Records to delete
   * @param allOrNone Whether partial DB writes should be allowed
   * @return Save results from the delete operation
   */
  global List<Database.DeleteResult> deleteRecords(
    List<SObject> records,
    Boolean allOrNone
  ) {
    List<Id> recordIds = new List<Id>();
    for (SObject record : records) {
      recordIds.add(record.Id);
    }
    return this.deleteRecords(recordIds, allOrNone);
  }
  /**
   * @description Deletes a collection of records
   * @param recordIds Ids of the records to delete
   * @return Save results from the delete operation
   */
  global List<Database.DeleteResult> deleteRecords(List<Id> recordIds) {
    return this.deleteRecords(recordIds, true);
  }
  /**
   * @description Deletes a collection of records
   * @param recordIds Ids of the records to delete
   * @param allOrNone Whether partial DB writes should be allowed
   * @return Save results from the delete operation
   */
  global List<Database.DeleteResult> deleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    return Database.delete(
      this.enforceFLS(recordIds, DatabaseOperation.DML_DELETE),
      allOrNone
    );
  }
  /**
   * @description Undeletes a single record
   * @param recordIds Id of the record to undelete
   * @return Save results from the undelete operation
   */
  global Database.UndeleteResult undeleteRecord(Id recordId) {
    return this.undeleteRecords(new List<Id>{ recordId })[0];
  }
  /**
   * @description Undeletes a collection of records
   * @param recordIds Ids of the records to undelete
   * @return Save results from the undelete operation
   */
  global List<Database.UndeleteResult> undeleteRecords(List<Id> recordIds) {
    return this.undeleteRecords(recordIds, true);
  }
  /**
   * @description Undeletes a collection of records
   * @param recordIds Ids of the records to undelete
   * @param allOrNone Whether partial DB writes should be allowed
   * @return Save results from the undelete operation
   */
  global List<Database.UndeleteResult> undeleteRecords(
    List<Id> recordIds,
    Boolean allOrNone
  ) {
    return Database.undelete(
      this.enforceFLS(recordIds, DatabaseOperation.DML_UNDELETE),
      allOrNone
    );
  }
  /**
   * @description Helper that enforces FLS on records based on
   * data settings. Used for most operations.
   * @param records Records to check permissions on
   * @param accessCheckType Access check type to use to check perms
   * @return Valid records to execute DML on
   */
  @TestVisible
  private List<SObject> enforceFLS(
    List<SObject> records,
    System.AccessType accessCheckType
  ) {
    // not enforcing fls just early exit with the original records
    if (!Data.settings.shouldEnforceFLS()) {
      return records;
    }
    System.SObjectAccessDecision decision = System.Security.stripInaccessible(
      accessCheckType,
      records
    );
    // if we don't allow field stripping and there are stripped fields
    // fail fast with an exception
    if (
      !data.settings.shouldAllowFieldStripping() &&
      !decision.getRemovedFields().isEmpty()
    ) {
      Set<String> removedFields = new Set<String>();
      for (String sObj : decision.getRemovedFields().keySet()) {
        for (String field : decision.getRemovedFields().get(sObj)) {
          removedFields.add(sObj + '.' + field);
        }
      }
      throw new FLSException(accessCheckType, new List<String>(removedFields));
    }
    // either we allow stripped fields or none were stripped
    return decision.getRecords();
  }
  /**
   * @description Helper that enforces FLS on records based on
   * data settings. Used for delete operations.
   * @param recordIds Ids of records to check permissions on
   * @param operation Database operation type to use to check perms
   * @return Valid records to execute DML on
   */
  @TestVisible
  private List<Id> enforceFLS(List<Id> recordIds, DatabaseOperation operation) {
    if (!Data.settings.shouldEnforceFLS()) {
      return recordIds;
    }
    Set<String> objectsWithoutAccess = new Set<String>();
    for (Id recordId : recordIds) {
      Schema.DescribeSObjectResult describe = recordId.getSobjectType()
        .getDescribe();
      if (
        (operation == DatabaseOperation.DML_DELETE &&
        !describe.isDeletable()) ||
        (operation == DatabaseOperation.DML_UNDELETE &&
        !describe.isUndeletable())
      ) {
        objectsWithoutAccess.add(describe.getName());
      }
    }
    if (!objectsWithoutAccess.isEmpty()) {
      throw new FLSException(operation, new List<String>(objectsWithoutAccess));
    }
    return recordIds;
  }
}
