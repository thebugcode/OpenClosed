//
//  InstagramAuthenticator.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import "InstagramAuthenticator.h"
#define APP_ID @"fd725621c5e44198a5b8ad3f7a0ffa09"

@interface InstagramAuthenticator() <IGSessionDelegate>
@property (weak, nonatomic) id<AuthenticationDelegate> delegate;
@end

@implementation InstagramAuthenticator

- (instancetype)init {
    self = [super init];
    if (self) {
        Instagram *sharedInstance = [[Instagram alloc] initWithClientId:APP_ID
                                                           delegate:nil];
        sharedInstance.sessionDelegate = self;
        [Instagram setSharedInstance:sharedInstance];
    }
    
    return self;
}


- (void)login {
    [[Instagram sharedInstance] authorize:[NSArray arrayWithObjects:@"comments", @"likes", nil]];
}


-(void)igDidLogin {
    [self.delegate authenticationDidSucceedWithUserName:[[Instagram sharedInstance] accessToken]];
}


- (void)setDelegate:(id<AuthenticationDelegate>)delegate {
    self.delegate = delegate;
}


@end
