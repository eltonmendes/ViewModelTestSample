//
//  User.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "User.h"

@implementation User

- (NSMutableArray *)mockUserArray {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < 20; i ++) {
        User *user = [User new];
        user.name = [NSString stringWithFormat:@"Name %i",i];
        user.lastName = [NSString stringWithFormat:@"Last Name %i",i];
        [array addObject:user];
    }
    return array;
}

@end
