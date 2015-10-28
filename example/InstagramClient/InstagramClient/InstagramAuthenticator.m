//
//  InstagramAuthenticator.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import "InstagramAuthenticator.h"

@interface InstagramAuthenticator()
@property (weak, nonatomic) id<AuthenticationDelegate> delegate;
@end

@implementation InstagramAuthenticator

- (void)login {
    
}


- (void)setDelegate:(id<AuthenticationDelegate>)delegate {
    self.delegate = delegate;
}


@end
