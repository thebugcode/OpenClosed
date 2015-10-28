//
//  FacebookAuthenticator.m
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import "FacebookAuthenticator.h"

@interface FacebookAuthenticator()
@property (weak, nonatomic) id<AuthenticationDelegate> delegate;
@end

@implementation FacebookAuthenticator

- (void)login {
    
}


- (void)setDelegate:(id<AuthenticationDelegate>)delegate {
    self.delegate = delegate;
}


@end
