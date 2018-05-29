//
//  LoginVC.m
//  Test_TouchId
//
//  Created by MrYeL on 2018/5/28.
//  Copyright © 2018年 MrYeL. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginWithPassword:(UIButton *)sender {
    
    [sender addActivityIndicatorWithStyle:UIActivityIndicatorViewStyleWhite];
    
    __weak typeof(self) weakSelf = self;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      
        [sender removeActivityIndicatorWithTitle:@"账户密码登录"];

        if (self.loginSucceedBlock) {
            self.loginSucceedBlock();
        }
      
    });
    
    
}
- (IBAction)loginWithTouchId:(UIButton *)sender {
    
    [sender addActivityIndicatorWithStyle:UIActivityIndicatorViewStyleWhite];

    
    [[TouchID shareInstance] showTouchIdWithDesc:nil andStateBlock:^(TBTouchIDState state, NSError *error) {
       
        if (state == TBTouchIDStateSuccess) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                if (self.loginSucceedBlock) {
                    self.loginSucceedBlock();
                }
                [sender removeActivityIndicatorWithTitle:@"TouchID登录"];
            });
        }else {
            
           
            
        }
    
      
        
    }];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc {
    NSLog(@"%@: dealloced \n",NSStringFromClass(self.class));

}

@end
