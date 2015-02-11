//
//  UserTableViewModel.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "UserTableViewModel.h"
#import "User.h"

@interface UserTableViewModel ()
@property (nonatomic, strong) RACSignal *updateTableSignal;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation UserTableViewModel

-(instancetype)initWithModel:(id)model {
    
    if (self == [super init]) {
        self.updateTableSignal = [[RACSubject subject] setNameWithFormat:@"UserTableViewModel updateTableSignal"];
        
        User *user = model;
        @weakify(self);
        [user mockUserArrayWithCompletion:^(NSMutableArray *users) {
            @strongify(self);
            self.dataSource = users;
            [(RACSubject *)self.updateTableSignal sendNext:nil];
        }];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self == [super init]) {
         self.updateTableSignal = [[RACSubject subject] setNameWithFormat:@"UserTableViewModel updateTableSignal"];
        
        User *user = [User new];
        @weakify(self);
        [user mockUserArrayWithCompletion:^(NSMutableArray *users) {
            @strongify(self);
            self.dataSource = users;
            [(RACSubject *)self.updateTableSignal sendNext:nil];
        }];
        
    }
    return self;
}

#pragma Public Methods

- (NSInteger)numberOfSections {
    return 1;
}
- (NSInteger)numberOfRowsInSection {
    return self.dataSource.count;
}

- (User *)userForRow:(NSInteger)row {
    return self.dataSource[row];
}
- (NSString *)formatedUserNameForRow:(NSInteger)row {
    User *user = self.dataSource[row];
    
    NSString *formatedUserName = [NSString stringWithFormat:@"%@ - %@",user.name,user.lastName];
    
    return formatedUserName;
}
@end
