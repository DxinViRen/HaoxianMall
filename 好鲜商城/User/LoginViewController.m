//
//  LoginViewController.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "LoginViewController.h"
NSString *const kIsLoginFlag = @"kIsLoginFlag";
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameT;
@property (weak, nonatomic) IBOutlet UITextField *passWordT;
@property (weak, nonatomic) IBOutlet UIButton *loginB;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginAction:(id)sender {
    //点击登录
    BOOL isLogin = [[[NSUserDefaults standardUserDefaults]objectForKey:kIsLoginFlag]boolValue];
    
    if(![self.userNameT.text isEqualToString:@"18763230755"] || ![self.passWordT.text isEqualToString:@"235637"])
    {
        UIAlertController *alec = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请填写正确手机号和验证码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alec addAction:alc];
        [self presentViewController:alec animated:YES completion:nil];
        
        return;
    }
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
