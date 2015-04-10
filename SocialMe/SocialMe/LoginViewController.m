//
//  LoginViewController.m
//  SocialMe
//
//  Created by Jahn on 1/9/15.
//  Copyright (c) 2015 Chard. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField Delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Login

- (IBAction)loginPressed:(id)sender {
  //  [self.view makeToastActivity];
    
    
    
    [PFUser logInWithUsernameInBackground:_field_userName.text password:_fieldPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
             //                               [self.view hideToastActivity];
                                            
                                            
                                            [self performSegueWithIdentifier:@"goToTabbar" sender:self];
                                            
                                            
                                            
                                        } else {
      //                                      [self.view makeToast:@"Invalid Login, Try Again" duration:2.0 position:@"center"];
        //                                    [self.view hideToastActivity];
                                        }
                                    }];
    
}

- (IBAction)cancelPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
