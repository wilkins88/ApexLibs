/**
 * @description Factory for creating trigger dispatcher and injecting handlers based on configuring
 * @author Tom Wilkins
 * @date 2022-04-13
 * @group Triggers
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class TriggerDispatcherFactory {
  @TestVisible
  private static Map<String, List<ITriggerHandler>> cachedHandlers {
    get {
      if (cachedHandlers == null) {
        cachedHandlers = new Map<String, List<ITriggerHandler>>();
      }
      return cachedHandlers;
    }
    set;
  }
  @TestVisible
  private TriggerConfigSelector config {
    get {
      if (this.config == null) {
        this.config = new TriggerConfigSelector();
      }
      return this.config;
    }
    set;
  }
  /**
   * @description Creates and returns a trigger dispatcher for the provided SObject
   * @param sObjType the type of SObject to create a dispatcher for
   * @return Trigger dispatcher with injected handlers for the provided SObject
   */
  global TriggerDispatcher create(Schema.SObjectType sObjType) {
    String sObjString = String.valueOf(sObjType);
    List<ITriggerHandler> handlers;
    // cache for potential recursive trigger invocations
    // this will be udpated in the future when cache managers are implemented
    if (cachedHandlers.containsKey(sObjString)) {
      handlers = cachedHandlers.get(sObjString);
    } else {
      for (
        SObjectTriggerSetting__mdt setting : this.config.getTriggerSettings(
          sObjType
        )
      ) {
        for (
          TriggerHandlerSetting__mdt handlerSetting : setting.TriggerHandlerSettings__r
        ) {
          handlers.add(
            (ITriggerHandler) Type.forName(handlerSetting.ClassName__c)
              .newInstance()
          );
        }
      }
      cachedHandlers.put(sObjString, handlers);
    }
    return new TriggerDispatcher(handlers);
  }
}
