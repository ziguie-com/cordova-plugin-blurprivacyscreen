/**
 * PrivacyScreenPlugin.h
 */
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface PrivacyScreenPlugin : CDVPlugin

- (void)enablePrivacy:(CDVInvokedUrlCommand*)command;
- (void)disablePrivacy:(CDVInvokedUrlCommand*)command;

@end
