//
//  UserTableViewModel.h
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "BaseViewModel.h"

@class User;

@interface UserTableViewModel : BaseViewModel

@property (nonatomic, readonly) RACSignal *updateTableSignal;

-(instancetype)initWithModel:(id)model;

- (NSInteger)numberOfRowsInSection;
- (NSInteger)numberOfSections;
- (User*)userForRow:(NSInteger)row;
- (NSString *)formatedUserNameForRow:(NSInteger)row;
@end
