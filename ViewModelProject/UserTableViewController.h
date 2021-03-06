//
//  UserTableViewController.h
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserTableViewModel,RACSignal;

@interface UserTableViewController : UITableViewController

@property (nonatomic,strong) UserTableViewModel *viewModel;
@property (nonatomic, readonly) RACSignal *listCompleteSignal;

-(void)registerSignal;

@end
