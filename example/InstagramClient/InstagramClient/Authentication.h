//
//  Authentication.h
//  InstagramClient
//
//  Created by Dan Ursu on 29/10/15.
//  Copyright © 2015 Crino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AuthenticationDelegate <NSObject>
- (void)authenticationDidSucceedWithUserName:(NSString *)username;
- (void)authenticationDidFail;
@end


@protocol Authentication <NSObject>
- (void)login;
- (void)setDelegate:(id<AuthenticationDelegate>)delegate;
@end
