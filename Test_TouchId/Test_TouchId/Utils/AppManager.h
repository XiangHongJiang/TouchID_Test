//
//  AppManager.h
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import <Foundation/Foundation.h>

static  NSString *const userLoginInfoKey = @"userLoginInfo";

@interface AppManager : NSObject

/** 登录判断*/
@property (nonatomic, assign) NSString *userId;

+ (instancetype)instance;

- (void)prepare;

- (void)saveUserInfo:(id)userInfo;

@end
