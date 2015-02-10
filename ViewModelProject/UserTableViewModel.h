//
//  UserTableViewModel.h
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserTableViewModel : NSObject

-(instancetype)initWithModel:(id)model;

- (NSInteger)numberOfRowsInSection;
- (NSInteger)numberOfSections;
- (User*)userForRow:(NSInteger)row;
- (NSString *)formatedUserNameForRow:(NSInteger)row;
@end
