//
//  FacebookAuthenticator.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import "FacebookAuthenticator.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FacebookAuthenticator()
@property (weak, nonatomic) id<AuthenticationDelegate> delegate;
@end

@implementation FacebookAuthenticator

- (void)login {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile"]
                 fromViewController:nil
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    [self.delegate authenticationDidFail];
                                } else if (result.isCancelled) {
                                    [self.delegate authenticationDidFail];
                                } else {
                                    NSLog(@"Logged in");
                                }
                            }];

}


- (void)setDelegate:(id<AuthenticationDelegate>)delegate {
    _delegate = delegate;
}


@end
