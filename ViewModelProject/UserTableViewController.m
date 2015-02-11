//
//  UserTableViewController.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import <EXTScope.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UserTableViewController.h"
#import "UserTableViewModel.h"
#import "User.h"

@interface UserTableViewController ()
@property (nonatomic, strong) RACSignal *listCompleteSignal;

@end

@implementation UserTableViewController

- (void)registerSignal {
    self.listCompleteSignal = [[RACSubject subject] setNameWithFormat:@"UserTableViewController listCompleteSignal"];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    @weakify(self);
    [self.viewModel.updateTableSignal subscribeNext:^(id x) {
        @strongify(self);
        //Update Signal
        [self.tableView reloadData];
        [(RACSubject *)self.listCompleteSignal sendNext:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.viewModel numberOfRowsInSection];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - Private Methods

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //User *user = [self.viewModel userForRow:indexPath.row];
    cell.textLabel.text = [self.viewModel formatedUserNameForRow:indexPath.row];
}


@end
