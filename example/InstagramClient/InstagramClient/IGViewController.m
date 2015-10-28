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



#pragma - IGSessionDelegate

-(void)igDidLogin {
    IGListViewController* viewController = [[IGListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)igDidNotLogin:(BOOL)cancelled {
    NSLog(@"Instagram did not login");
    NSString* message = nil;
    if (cancelled) {
        message = @"Access cancelled!";
    } else {
        message = @"Access denied!";
    }
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}



@end
