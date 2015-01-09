//
//  RegisterViewController.m
//  SocialMe
//
//  Created by Jahn on 1/9/15.
//  Copyright (c) 2015 Chard. All rights reserved.
//

#import "RegisterViewController.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize username, password, email;

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

#pragma mark - TextField Delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)cancelPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation Actions
- (IBAction)registerPressed:(id)sender {
    
    /* validation */
    
    [_uNameField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_rePasswordField resignFirstResponder];
 //   [_emailField resignFirstResponder];
    [self checkFieldsComplete];
    
    
}

-(void)checkFieldsComplete
{
    
    if ([_uNameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@"" ] ||
        [_rePasswordField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        [self checkPasswordMatch];
    }
}

-(void)checkPasswordMatch
{
    if (![_passwordField.text isEqualToString:_rePasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Passwords don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    else
    {
        
        [self registerUser];
    }
}

-(void)registerUser
{
    
    PFUser *newUser = [PFUser user];
    
    newUser.username = _uNameField.text;
    newUser.password = _passwordField.text;
    newUser.email = _emailField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
            [self loginUser];
        }
        else
        {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
    
}

-(void)loginUser
{
    [PFUser logInWithUsernameInBackground:_uNameField.text password:_passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self performSegueWithIdentifier:@"toAddFriends" sender:self];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];

    
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
