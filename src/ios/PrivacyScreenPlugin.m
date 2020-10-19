/**
 * PrivacyScreenPlugin.m
 */
#import "PrivacyScreenPlugin.h"

UIView *imageView;

bool isPrivacyEnabled = YES;

@implementation PrivacyScreenPlugin

- (void)pluginInitialize
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppDidBecomeActive:)
                                               name:UIApplicationDidBecomeActiveNotification object:nil];

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppWillResignActive:)
                                               name:UIApplicationWillResignActiveNotification object:nil];
}

- (void)enablePrivacy: (CDVInvokedUrlCommand*)command {
  isPrivacyEnabled = YES;
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
- (void)disablePrivacy: (CDVInvokedUrlCommand*)command {
  isPrivacyEnabled = NO;
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)onAppDidBecomeActive:(UIApplication *)application
{
  if (imageView) {
    [imageView removeFromSuperview];
    imageView = nil;
  }
}

- (void)onAppWillResignActive:(UIApplication *)application
{
  if (!isPrivacyEnabled) {
    return;
  }

  UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
  UIVisualEffectView *visualEffectView;
  imageView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

  imageView.frame = [UIApplication sharedApplication].keyWindow.bounds;
  [[UIApplication sharedApplication].keyWindow addSubview:imageView];
}

@end
