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
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation UserTableViewModel

//Passing the model already created
-(instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self == nil) return nil;

    User *user = model;
    self.dataSource = [user mockUserArray];
    return self;
}
//Passing without model -> Search on database for example now!
- (instancetype)init {
    
    self = [super init];
    if (self == nil) return nil;
    
    User *user = [User new];
    self.dataSource = [user mockUserArray];
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
