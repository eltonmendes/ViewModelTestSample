//
//  DashBoardViewController.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//
#import <EXTScope.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "DashBoardViewController.h"
#import "UserTableViewController.h"
#import "UserTableViewModel.h"

@interface DashBoardViewController ()

@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UserTableViewController *userTableViewController = segue.destinationViewController;
    UserTableViewModel *userTableViewModel = [[UserTableViewModel alloc]init];
    userTableViewController.viewModel = userTableViewModel;
    [userTableViewController registerSignal];
    
    @weakify(self);
    [userTableViewController.listCompleteSignal subscribeNext:^(id x) {
        @strongify(self);
        [UIView animateWithDuration:0.2f animations:^{
            self.loadingView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self.loadingView removeFromSuperview];
        }];
    }];
}


@end
