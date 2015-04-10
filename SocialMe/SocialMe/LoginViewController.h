//
//  LoginViewController.h
//  SocialMe
//
//  Created by Jahn on 1/9/15.
//  Copyright (c) 2015 Chard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RegisterViewController.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *field_userName;
@property (weak, nonatomic) IBOutlet UITextField *fieldPassword;

- (IBAction)loginPressed:(id)sender;
- (IBAction)cancelPressed:(id)sender;

@end
