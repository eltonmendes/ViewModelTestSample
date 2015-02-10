//
//  LoginViewController.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "LoginViewController.h"
#import "UserTableViewController.h"
#import "UserTableViewModel.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startAction:(id)sender {
    [self performSegueWithIdentifier:@"login" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UserTableViewController *userTableViewController = segue.destinationViewController;
    UserTableViewModel *userTableViewModel = [[UserTableViewModel alloc]init];
    userTableViewController.viewModel = userTableViewModel;
    
}


@end
