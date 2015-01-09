//
//  RegisterViewController.h
//  SocialMe
//
//  Created by Jahn on 1/9/15.
//  Copyright (c) 2015 Chard. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
{

    NSString *username;
    NSString *password;
    NSString *email;
    
    
}
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;
@property (weak, nonatomic) IBOutlet UITextField *uNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *rePasswordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;


-(IBAction)registerPressed:(id)sender;
-(IBAction)cancelPressed:(id)sender;

@end
