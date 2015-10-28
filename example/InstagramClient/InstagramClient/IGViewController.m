//
//  IGViewController.m
//  InstagramClient
//
//  Created by Cristiano Severini on 12/07/12.
//  Copyright (c) 2012 Crino. All rights reserved.
//

#import "IGViewController.h"

#import "IGAppDelegate.h"
#import "IGListViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface IGViewController ()

@end

#define APP_ID @"fd725621c5e44198a5b8ad3f7a0ffa09"

@implementation IGViewController

- (void)viewDidLoad {
    [super viewDidLoad];   
    
    IGAppDelegate* appDelegate = (IGAppDelegate*)[UIApplication sharedApplication].delegate;
    appDelegate.instagram = [[Instagram alloc] initWithClientId:APP_ID
                                                       delegate:nil];
    appDelegate.instagram.sessionDelegate = self;
}


- (IBAction)login:(id)sender {
    IGAppDelegate* appDelegate = (IGAppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate.instagram authorize:[NSArray arrayWithObjects:@"comments", @"likes", nil]];
}


- (IBAction)loginWithFacebook:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile"]
                 fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    if ([FBSDKAccessToken currentAccessToken]) {
                                        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
                                         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                             if (!error) {
                                                 NSLog(@"fetched user:%@", result);
                                             }
                                         }];
                                    }                                }
                            }];
}


#pragma - IGSessionDelegate

-(void)igDidLogin {
    IGListViewController* viewController = [[IGListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
