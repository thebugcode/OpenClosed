//
//  IGAppDelegate.m
//  InstagramClient
//
//  Created by Cristiano Severini on 12/07/12.
//  Copyright (c) 2012 Crino. All rights reserved.
//

#import "IGAppDelegate.h"

#import "IGViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FacebookAuthenticator.h"
#import "InstagramAuthenticator.h"

@implementation IGAppDelegate

@synthesize window = _window;
@synthesize instagram = _instagram;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    IGViewController *topVC = [self visibleViewController];
    topVC.authenticator = [[FacebookAuthenticator alloc] init];
    
    return YES;
}


- (IGViewController *)visibleViewController {
    UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
    
    return (IGViewController *)[navController topViewController];
}
// YOU NEED TO CAPTURE igAPPID:// schema
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [self.instagram handleOpenURL:url]; 
}


-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ( [self.instagram handleOpenURL:url]) return YES;
    if ( [[FBSDKApplicationDelegate sharedInstance] application:application
                                                        openURL:url
                                              sourceApplication:sourceApplication
                                                     annotation:annotation
          ]) return YES;
    
    return NO;
}

@end
