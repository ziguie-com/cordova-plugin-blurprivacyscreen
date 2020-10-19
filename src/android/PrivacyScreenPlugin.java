/**
 * PrivacyScreenPlugin.java Cordova Plugin Implementation
 */
package com.ziguie.privacyscreen;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;

import android.view.Window;
import android.view.WindowManager;

public class PrivacyScreenPlugin extends CordovaPlugin {
  private boolean isPrivacyEnabled = false;

  @Override
  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
    if ("enablePrivacy".equals(action)) {
        isPrivacyEnabled = true;
        callbackContext.success();
        return true;
    }
    if ("disablePrivacy".equals(action)) {
        isPrivacyEnabled = false;
        callbackContext.success();
        return true;
    }
    return false;  // Returning false results in a "MethodNotFound" error.
 }

  @Override
  public void onPause(boolean multitasking) {
    if (isPrivacyEnabled) {
      Window window = this.cordova.getActivity().getWindow();
      window.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }
    super.onPause(multitasking);
  }

  @Override
  public void onResume(boolean multitasking) {
    Window window = this.cordova.getActivity().getWindow();
    window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
    super.onResume(multitasking);
  }
}
