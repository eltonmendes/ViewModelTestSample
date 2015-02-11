//
//  User.m
//  ViewModelProject
//
//  Created by Elton Mendes Vieira Junior on 2/10/15.
//  Copyright (c) 2015 CIT. All rights reserved.
//

#import "User.h"

@implementation User

- (void)mockUserArrayWithCompletion:(void(^)(NSMutableArray* users))completionBlock {
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < 20; i ++) {
        User *user = [User new];
        user.name = [NSString stringWithFormat:@"Name %i",i];
        user.lastName = [NSString stringWithFormat:@"Last Name %i",i];
        [array addObject:user];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //Simulating Database
        completionBlock(array);
    });

}

@end
