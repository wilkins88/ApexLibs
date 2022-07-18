@IsTest
@SuppressWarnings('PMD.MethodNamingConventions')
private inherited sharing class RBACFeatureResolverTest {
  @IsTest
  private static void resolve_profileIsFlagged_returnTrue() {
    String profileName = [
      SELECT Id, Name
      FROM Profile
      WHERE Id = :UserInfo.getProfileId()
      LIMIT 1
    ]
    .Name;
    String value = profileName + ',SomethingElse';
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Profile',
      RBACCategoryValue__c = value
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getProfiles' => new ReturnValueMethodMock(
            new List<Profile>{ new Profile(Name = profileName) }
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      true,
      result,
      'Should return true since profile is captured'
    );
  }
  @IsTest
  private static void resolve_profileIsNotFlagged_returnFalse() {
    String profileName = [
      SELECT Id, Name
      FROM Profile
      WHERE Id = :UserInfo.getProfileId()
      LIMIT 1
    ]
    .Name;
    String value = 'SomethingElse';
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Profile',
      RBACCategoryValue__c = value
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getProfiles' => new ReturnValueMethodMock(
            new List<Profile>{ new Profile(Name = profileName) }
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false since profile is not captured'
    );
  }
  @IsTest
  private static void resolve_invalidProfile_returnFalse() {
    String value = 'SomethingElse';
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Profile',
      RBACCategoryValue__c = value
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getProfiles' => new ReturnValueMethodMock(new List<Profile>())
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false since no profile returned'
    );
  }
  @IsTest
  private static void resolve_hasPermissionSet_returnTrue() {
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Permission Set',
      RBACCategoryValue__c = 'SomeValue'
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getPermissionSetAssignments' => new ReturnValueMethodMock(
            new List<PermissionSetAssignment>{ new PermissionSetAssignment() }
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      true,
      result,
      'Should return true when permission set assignment is found'
    );
  }
  @IsTest
  private static void resolve_noPermissionSet_returnFalse() {
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Permission Set',
      RBACCategoryValue__c = 'SomeValue'
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getPermissionSetAssignments' => new ReturnValueMethodMock(
            new List<PermissionSetAssignment>()
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false when no permission set assignment is found'
    );
  }
  @IsTest
  private static void resolve_noCustomPermission_returnFalse() {
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Custom Permission',
      RBACCategoryValue__c = 'SomeValue'
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getCustomPermissionValue' => new ReturnValueMethodMock(false)
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false when no custom permission is found'
    );
  }
  @IsTest
  private static void resolve_hasGroup_returnTrue() {
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Public Group',
      RBACCategoryValue__c = 'SomeValue'
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getGroupMembers' => new ReturnValueMethodMock(
            new List<GroupMember>{ new GroupMember() }
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      true,
      result,
      'Should return true when group assignment is found'
    );
  }
  @IsTest
  private static void resolve_noGroup_returnFalse() {
    RBACFeatureResolver resolver = new RBACFeatureResolver();
    resolver.config = new FeatureFlagSetting__mdt(
      RBACCategory__c = 'Public Group',
      RBACCategoryValue__c = 'SomeValue'
    );
    resolver.selector = (FeatureFlagConfigSelector) System.Test.createStub(
      FeatureFlagConfigSelector.class,
      Testing.mocks.createClassMocker(
        new Map<String, IMethodMock>{
          'getGroupMembers' => new ReturnValueMethodMock(
            new List<GroupMember>()
          )
        }
      )
    );
    System.Test.startTest();
    Boolean result = resolver.resolve();
    System.Test.stopTest();
    System.assertEquals(
      false,
      result,
      'Should return false when no group assignment is found'
    );
  }
}
