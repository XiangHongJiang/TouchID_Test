//
//  AppManager.m
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "AppManager.h"

static AppManager *shareManager = nil;

@implementation AppManager

+ (instancetype)instance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [AppManager new];
        [shareManager prepare];
    });
    
    return shareManager;
}
- (void)prepare {
    
    self.userId = UD_GET(userLoginInfoKey);
}
- (void)saveUserInfo:(id)userInfo {

    if (userInfo) {
        
        UD_SET(self.userId, userLoginInfoKey);
        
    }else {
        
        [UD removeObjectForKey:userLoginInfoKey];
    }
    
    [UD synchronize];
}

@end
