//
//  LoginVC.h
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController

/** 登录成功回调*/
@property (nonatomic, copy) void(^loginSucceedBlock)(void);

@end
