//
//  LoginViewController.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "LoginViewController.h"
#import "DashBoardViewController.h"
#import "DashBoardViewModel.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startValidadeSignal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startValidadeSignal {
    
    
    RACSignal *usernameSignal = [[self.usernameTextField.rac_textSignal
                                 map:^id(NSString *text) {
                                     return @([self validateText:text]);
                                 }] doNext:^(id x) {
                                     self.usernameTextField.backgroundColor = [UIColor clearColor];
                                 }];
    RACSignal *passwordSignal = [[self.passwordTextField.rac_textSignal
                                 map:^id(NSString *text) {
                                     return @([self validateText:text]);
                                 }] doNext:^(id x) {
                                     self.passwordTextField.backgroundColor = [UIColor clearColor];
                                 }];

    
    RACSignal *signUpSignal  = [RACSignal combineLatest:@[usernameSignal,passwordSignal] reduce:^id(NSNumber *usernameValid,NSNumber *passwordValid){
        if([usernameValid boolValue]){
            self.usernameTextField.backgroundColor = [UIColor greenColor];
        }
        if([passwordValid boolValue]){
            self.passwordTextField.backgroundColor = [UIColor greenColor];
        }
        return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    
    [[signUpSignal
      doNext:^(id x) {
          self.loginButton.enabled = NO;
          self.loginButton.alpha = 0.5f;
          self.loginButton.backgroundColor = [UIColor redColor];
      }] subscribeNext:^(NSNumber *signUpActive) {
          if([signUpActive boolValue]){
              self.loginButton.backgroundColor = [UIColor greenColor];
              self.loginButton.enabled = YES;
              self.loginButton.alpha = 1.0f;
          }
          
      }];
    
}

- (BOOL)validateText:(NSString *)text {
    if(text.length > 0){
        return YES;
    }
    return NO;
}


#pragma mark - IBAction

- (IBAction)startAction:(id)sender {
    [self performSegueWithIdentifier:@"login" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}


@end
