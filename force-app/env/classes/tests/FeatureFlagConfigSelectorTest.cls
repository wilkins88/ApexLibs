@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class FeatureFlagConfigSelectorTest {
  // coverage test to hit the query
  @IsTest
  private static void getFeatureConfig_noConfig_returnNull() {
    FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
    System.Test.startTest();
    FeatureFlagSetting__mdt setting = selector.getFeatureConfig(
      'SomeFeatureThatDoesntExist'
    );
    System.Test.stopTest();
    System.assertEquals(
      null,
      setting,
      'Should return null since the setting does not exist'
    );
  }
  @IsTest
  private static void getProfiles_reandomProfile_returnProfile() {
    Profile prof = [SELECT Id FROM Profile LIMIT 1];
    FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
    System.Test.startTest();
    List<Profile> results = selector.getProfiles(new Set<Id>{ prof.Id });
    System.Test.stopTest();
    System.assertEquals(1, results.size(), 'Should return only 1 result');
    System.assertEquals(
      prof.Id,
      results[0].Id,
      'Should return the correct profile'
    );
  }
  @IsTest
  private static void getPermissionSetAssignments_testPermissionSet_returnAssignment() {
    PermissionSet perm = new PermissionSet(
      Label = 'MockPermSet',
      Name = 'MockPermSet'
    );
    insert perm;
    PermissionSetAssignment assignment = new PermissionSetAssignment(
      PermissionSetId = perm.Id,
      AssigneeId = UserInfo.getUserId()
    );
    insert assignment;
    FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
    System.Test.startTest();
    List<PermissionSetAssignment> results = selector.getPermissionSetAssignments(
      new Set<Id>{ UserInfo.getUserId() },
      new Set<String>{ perm.Name }
    );
    System.Test.stopTest();
    System.assertEquals(1, results.size(), 'Should return only 1 result');
    System.assertEquals(
      UserInfo.getUserId(),
      results[0].AssigneeId,
      'Should return the correct PermissionSet assignment'
    );
    System.assertEquals(
      perm.Id,
      results[0].PermissionSetId,
      'Should return the correct PermissionSet assignment'
    );
  }
  @IsTest
  private static void getCustomPermissionValue_nonExistentPermission_returnFalse() {
    FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
    System.Test.startTest();
    Boolean result = selector.getCustomPermissionValue('NotARealPermission');
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should not return access since the permission does not exist'
    );
  }
  @IsTest
  private static void getGroupMembers_testGroup_returnAssignment() {
    Group g = new Group(Name = 'MockGroup', DeveloperName = 'MockGroup');
    insert g;
    GroupMember member = new GroupMember(
      UserOrGroupId = UserInfo.getUserId(),
      GroupId = g.Id
    );
    insert member;
    FeatureFlagConfigSelector selector = new FeatureFlagConfigSelector();
    System.Test.startTest();
    List<GroupMember> results = selector.getGroupMembers(
      new Set<Id>{ UserInfo.getUserId() },
      new Set<String>{ g.DeveloperName }
    );
    System.Test.stopTest();
    System.assertEquals(1, results.size(), 'Should return only 1 result');
    System.assertEquals(
      UserInfo.getUserId(),
      results[0].UserOrGroupId,
      'Should return the correct PermissionSet assignment'
    );
    System.assertEquals(
      g.Id,
      results[0].GroupId,
      'Should return the correct PermissionSet assignment'
    );
  }
}
