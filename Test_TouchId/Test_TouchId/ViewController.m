//
//  ViewController.m
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self launch];

}
- (void)launch {
    __weak typeof(self) weakSelf = self;
    
    if ([AppManager instance].userId) {//已登录
        
        TabBarVC *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"TabBarVC"];
        SharedApplication.keyWindow.rootViewController = tabBar;
        
    }else {//未登录
        
        LoginVC *login = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginVC"];

        login.loginSucceedBlock = ^{
            
            AppManager.instance.userId = @"1234";
            [AppManager.instance saveUserInfo:AppManager.instance.userId];
            
            TabBarVC *tabBar = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"TabBarVC"];
            SharedApplication.keyWindow.rootViewController = tabBar;
        };
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:login];
        SharedApplication.keyWindow.rootViewController = navi;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    
    NSLog(@"%@: dealloced \n",NSStringFromClass(self.class));
}

@end
