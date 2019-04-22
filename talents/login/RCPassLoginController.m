//
//  RCPassLoginController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
// 密码登陆

#import "RCPassLoginController.h"
#import <Masonry.h>
#import "RCTabController.h"
#import "RCBoundIphoneController.h"
#import "RCResetPasswController.h"

@interface RCPassLoginController ()

@end

@implementation RCPassLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"密码登陆";
    
    //只显示图片
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];

    
    [self setUI];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)setUI{
    //账号
    UITextField * loginText = [[UITextField alloc]init];
    loginText.font = [UIFont systemFontOfSize:12];
    loginText.textColor = [UIColor blackColor];
    loginText.placeholder = @"请输入您的手机号";
    loginText.textAlignment = NSTextAlignmentLeft;
    loginText.borderStyle = UITextBorderStyleRoundedRect;
    loginText.clearButtonMode = UITextFieldViewModeUnlessEditing;
    loginText.layer.cornerRadius = 10;
    
    UIImage * image01 = [UIImage imageNamed:@"tou_01"];
    UIImageView * loginTextImageView = [[UIImageView alloc]initWithImage:image01];
    UIView * lefLigView = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 34, 30)];
    lefLigView.backgroundColor = [UIColor whiteColor];
    loginTextImageView.center = lefLigView.center;
    [lefLigView addSubview:loginTextImageView];
    loginText.leftViewMode = UITextFieldViewModeAlways;
    loginText.leftView = lefLigView;
    [loginText sizeToFit];
    
    
    
    //密码
    UITextField * passWText = [[UITextField alloc]init];
    passWText.font = [UIFont systemFontOfSize:12];
    passWText.textColor = [UIColor blackColor];
    passWText.placeholder = @"请输入您的密码";
    passWText.textAlignment = NSTextAlignmentLeft;
    passWText.secureTextEntry = YES;
    passWText.borderStyle = UITextBorderStyleRoundedRect;
    passWText.clearButtonMode = UITextFieldViewModeUnlessEditing;
    passWText.layer.cornerRadius = 10;
    
    
    UIButton *lockBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 2, 34, 30)];
    [lockBtn setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    lockBtn.userInteractionEnabled = NO;
    passWText.leftView = lockBtn;
    passWText.leftViewMode = UITextFieldViewModeAlways;
  
    UIButton * eyeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 2, 36, 32)];
    [eyeBtn setBackgroundImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    [eyeBtn addTarget:self action:@selector(clickEyeAction) forControlEvents:UIControlEventTouchUpInside];
    lockBtn.userInteractionEnabled = YES;
    passWText.rightView = eyeBtn;
    passWText.rightViewMode = UITextFieldViewModeAlways;
    
    //登陆按钮
    UIButton * registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [registBtn setTintColor:[UIColor blackColor]];
    registBtn.backgroundColor = [UIColor grayColor];
    registBtn.layer.cornerRadius = 10;
    registBtn.layer.borderColor = [UIColor blackColor].CGColor;
    registBtn.layer.borderWidth = 0.2f;
    
    UIButton * iphoneLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [iphoneLogin setTitle:@"手机验证码登陆" forState:UIControlStateNormal];
    [iphoneLogin setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    iphoneLogin.titleLabel.font = [UIFont systemFontOfSize:14];
    [iphoneLogin addTarget:self action:@selector(clickIphoneVC) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *  forgetPassBt= [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetPassBt setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPassBt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    forgetPassBt.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetPassBt addTarget:self action:@selector(clickForgetVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:loginText];
    [self.view addSubview:passWText];
    [self.view addSubview:registBtn];
    [self.view addSubview:iphoneLogin];
    [self.view addSubview:forgetPassBt];
    
    [loginText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 44));
    }];
    
    [passWText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginText.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 44));
    }];
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passWText.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 45));
    }];
    
    [iphoneLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(registBtn.mas_bottom).offset(20);
        make.left.equalTo(registBtn.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(100, 32));
        
    }];
    
    [forgetPassBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iphoneLogin.mas_top).offset(0);
        make.right.equalTo(registBtn.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(60, 32));
    }];
    
}

//登陆
-(void)loginAction{
    RCTabController * homeVC = [[RCTabController alloc]init];
    [self.navigationController pushViewController:homeVC animated:YES];
    NSLog(@"登陆..");
    
}


//查看密码
-(void)clickEyeAction{
    
    NSLog(@"查看密码");
}


//手机验证登陆
-(void)clickIphoneVC{
    RCBoundIphoneController * boundVC = [[RCBoundIphoneController alloc]init];
    [self.navigationController pushViewController:boundVC animated:YES];
    
}

//忘记密码
-(void)clickForgetVC{
    RCResetPasswController * resetVC = [[RCResetPasswController alloc]init];
    [self.navigationController pushViewController:resetVC animated:YES];
    
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
