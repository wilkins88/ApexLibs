/**
 * @description Settings class that can be manipulated to afford various
 * behaviors when executing dml or running queries
 * @date 2022-06-18
 * @group Data
 */
@SuppressWarnings('PMD.AvoidGlobalModifier')
global inherited sharing class DataSettings {
  @TestVisible
  private Boolean allowFieldStripping {
    get {
      if (this.allowFieldStripping == null) {
        // default to false, i.e. fail fast with an exception
        this.allowFieldStripping = false;
      }
      return this.allowFieldStripping;
    }
    set;
  }
  @TestVisible
  private Boolean enforceFLS {
    get {
      if (this.enforceFLS == null) {
        // enforce FLS by default
        this.enforceFLS = true;
      }
      return this.enforceFLS;
    }
    set;
  }
  /**
   * @description Returns whether or not FLS should be enforced
   * @return True if FLS should be enforced, false otherwise
   */
  global Boolean shouldEnforceFLS() {
    return this.enforceFLS;
  }
  /**
   * @description Returns whether or not stripping fields is allows
   * when FLS is enforced
   * @return True if field stripping is allowed, false otherwise
   */
  global Boolean shouldAllowFieldStripping() {
    return this.enforceFLS && this.allowFieldStripping;
  }
  /**
   * @description Enables field Stripping. Also enables enforcement of FLS
   */
  global void enableFieldStripping() {
    this.allowFieldStripping = true;
    this.enforceFLS = true;
  }
  /**
   * @description Enables field Stripping. Does not disable enforcement of FLS
   */
  global void disableFieldStripping() {
    this.allowFieldStripping = false;
  }
  /**
   * @description Enables general enforcement of FLS.
   */
  global void enableFLS() {
    this.enforceFLS = true;
  }
  /**
   * @description Disables general enforcement of FLS.
   */
  global void disableFLS() {
    this.enforceFLS = false;
  }
}
