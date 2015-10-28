//
//  IGViewController.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/2012
//  Copyright (c) 2012 Dursu. All rights reserved.
//

#import "IGViewController.h"
#import "IGListViewController.h"

@interface IGViewController() <AuthenticationDelegate>
@end

@implementation IGViewController

- (IBAction)login:(id)sender {
    [self performLogin];
}

- (IBAction)loginWithFacebook:(id)sender {
    [self performLogin];
}

- (void)performLogin {
    [self.authenticator setDelegate:self];
    [self.authenticator login];
}


#pragma - AuthenticationDelegate
- (void)authenticationDidSucceedWithUserName:(NSString *)username {
    IGListViewController* viewController = [[IGListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)authenticationDidFail {
    NSLog(@"Error");
}


@end
