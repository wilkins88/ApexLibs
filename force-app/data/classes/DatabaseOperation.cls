/**
 * @description ENUM for capturing database operations decouled from any specific
 * Apex system libs
 * @date 2022-06-18
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global enum DatabaseOperation {
  DML_INSERT,
  DML_UPDATE,
  DML_DELETE,
  DML_UPSERT,
  DML_UNDELETE
}
