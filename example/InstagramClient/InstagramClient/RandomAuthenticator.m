//
//  RandomAuthenticator.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import "RandomAuthenticator.h"


@interface RandomAuthenticator()
@property (weak, nonatomic) id<AuthenticationDelegate> delegate;
@end

@implementation RandomAuthenticator

- (void)login {
    if ([self randomValue] > 1000) {
        [self.delegate authenticationDidSucceedWithUserName:@"Dan"];
    } else {
        [self.delegate authenticationDidFail];
    }
}

- (void)setDelegate:(id<AuthenticationDelegate>)delegate {
    _delegate = delegate;
}

- (int)randomValue {
    int value = rand();
    return value;
}
@end
