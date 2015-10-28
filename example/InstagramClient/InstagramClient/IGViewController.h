//
//  IGViewController.h
//  InstagramClient
//
//  Created by Cristiano Severini on 12/07/12.
//  Copyright (c) 2012 Crino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Authentication.h"

@interface IGViewController : UIViewController 
@property (strong, nonatomic) id<Authenticator> authenticator;

@end
