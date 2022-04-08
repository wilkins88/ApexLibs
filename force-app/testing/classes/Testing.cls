/**
 * @description Static accessor class used to group and provide convenient static access to testing classes.
 * Usually this is done to support mocking, but since that isn't needed for testing utilities, this is just to
 * follow the same pattern while allowing decomposition of testing functionality
 * @author Tom Wilkins
 * @date 2022-04-08
 * @group Testing
 */
@IsTest
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class Testing {
  @TestVisible
  global static MockerFactory mocks {
    get {
      if (mocks == null) {
        mocks = new MockerFactory();
      }
      return mocks;
    }
    private set;
  }
}
