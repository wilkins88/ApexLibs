/**
 * @description Dispatcher that handles general routing of trigger logic for all contexts
 * and all SObjects
 * @author Tom Wilkins
 * @date 2022-04-11
 * @group Triggers
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class TriggerDispatcher {
  @TestVisible
  private List<ITriggerHandler> handlers {
    get {
      if (this.handlers == null) {
        this.handlers = new List<ITriggerHandler>();
      }
      return this.handlers;
    }
    set;
  }
  /**
   * @description Constructor
   * @param handlers Handlers to be executed within the dispatcher
   */
  public TriggerDispatcher(List<ITriggerHandler> handlers) {
    this.handlers = handlers;
  }
  /**
   * @description executes handler logic for all handlers given context
   */
  global void dispatch() {
    if (!Triggers.settings.shouldExecuteTriggers()) {
      return;
    }
    try {
      for (ITriggerHandler handler : this.handlers) {
        if (Triggers.ctx.isBeforeInsert()) {
          handler.doBeforeInsert();
        } else if (Triggers.ctx.isBeforeUpdate()) {
          handler.doBeforeUpdate();
        } else if (Triggers.ctx.isBeforeDelete()) {
          handler.doBeforeDelete();
        } else if (Triggers.ctx.isAfterInsert()) {
          handler.doAfterInsert();
        } else if (Triggers.ctx.isAfterUpdate()) {
          handler.doAfterUpdate();
        } else if (Triggers.ctx.isAfterDelete()) {
          handler.doAfterDelete();
        } else if (Triggers.ctx.isAfterUndelete()) {
          handler.doAfterUndelete();
        }
      }
    } catch (Exception e) {
      this.handleError(e);
    }
  }
  /**
   * @description Helper for managing exceptions bubbled up in triggers
   * @param e Exception caught from trigger handlers
   */
  @TestVisible
  private void handleError(Execption e) {
    if (Triggers.ctx.isBeforeDelete() || Triggers.ctx.isAfterDelete()) {
      for (SObject record : Triggers.ctx.getTriggerOld()) {
        Triggers.ctx.addError(record, e.getMessage());
      }
    } else {
      for (SObject record : Triggers.ctx.getTriggerNew()) {
        Triggers.ctx.addError(record, e.getMessage());
      }
    }
  }
}
