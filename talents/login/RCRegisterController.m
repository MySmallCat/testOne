//
//  RCRegisterController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCRegisterController.h"
#import <Masonry.h>

@interface RCRegisterController ()

@end

@implementation RCRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backBtn setTitle:@"登陆>" forState:UIControlStateNormal];
//    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(clcikBackLogin) forControlEvents:UIControlEventTouchUpInside];
//
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
//
    
    [self setUI];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


////返回登陆界面
-(void)clickRrgistTo{

    [self.navigationController popViewControllerAnimated:YES];

}


-(void)setUI{
    UIView * headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor grayColor];
    
    UIButton * BackLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackLogin setTitle:@"登陆>" forState:UIControlStateNormal];
    [BackLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BackLogin addTarget:self action:@selector(clickRrgistTo) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"log_01"];
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:22];
    titleLabel.text = @"欢迎来到博大智平台";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    
    UILabel * viceTitleLabel = [[UILabel alloc]init];
    viceTitleLabel.font = [UIFont systemFontOfSize:14];
    viceTitleLabel.text = @"智慧链接人企校，精准匹配职无忧";
    viceTitleLabel.textAlignment = NSTextAlignmentCenter;
    viceTitleLabel.textColor = [UIColor lightGrayColor];
    
    [headerView addSubview:BackLogin];
    [headerView addSubview:imageView];
    [headerView addSubview:titleLabel];
    [headerView addSubview:viceTitleLabel];
    [self.view addSubview:headerView];
    
    UITextField * loginText = [[UITextField alloc]init];
    loginText.font = [UIFont systemFontOfSize:12];
    loginText.textColor = [UIColor blackColor];
    loginText.placeholder = @"请输入手机号登陆";
    loginText.textAlignment = NSTextAlignmentLeft;
    loginText.clearButtonMode = UITextFieldViewModeUnlessEditing;
    loginText.layer.cornerRadius = 10;
    loginText.layer.borderColor = [UIColor grayColor].CGColor;
    loginText.layer.borderWidth = 0.5f;
    loginText.clipsToBounds = YES;
    
    UIImage * image01 = [UIImage imageNamed:@"tou_01"];
    UIImageView * loginTextImageView = [[UIImageView alloc]initWithImage:image01];
    UIView * lefLigView = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 34, 30)];
    lefLigView.backgroundColor = [UIColor whiteColor];
    loginTextImageView.center = lefLigView.center;
    [lefLigView addSubview:loginTextImageView];
    loginText.leftViewMode = UITextFieldViewModeAlways;
    loginText.leftView = lefLigView;
    [loginText sizeToFit];
    
    
    UITextField * codeText = [[UITextField alloc]init];
    codeText.font = [UIFont systemFontOfSize:12];
    codeText.textColor = [UIColor blackColor];
    codeText.placeholder = @"请输入短信验证码";
    codeText.textAlignment = NSTextAlignmentLeft;
    codeText.secureTextEntry = YES;
    codeText.clearButtonMode = UITextFieldViewModeUnlessEditing;
    codeText.layer.cornerRadius = 10;
    codeText.layer.borderColor = [UIColor grayColor].CGColor;
    codeText.layer.borderWidth = 0.5f;
    codeText.clipsToBounds = YES;
    
    UIImage * image02 = [UIImage imageNamed:@"tou_01"];
    UIImageView * passTextImageView = [[UIImageView alloc]initWithImage:image02];
    UIView * LeftCodeView = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 34, 30)];
    LeftCodeView.backgroundColor = [UIColor whiteColor];
    passTextImageView.center = LeftCodeView.center;
    [LeftCodeView addSubview:passTextImageView];
    codeText.leftViewMode = UITextFieldViewModeAlways;
    codeText.leftView = LeftCodeView;
    [codeText sizeToFit];
    
    UIButton * sendCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 2, 100, 32)];
    [sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendCodeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [sendCodeBtn addTarget:self action:@selector(clickSendCode) forControlEvents:UIControlEventTouchUpInside];
    sendCodeBtn.userInteractionEnabled = YES;
    sendCodeBtn.layer.cornerRadius = 10;
    //    sendCodeBtn.layer.borderWidth = 1;
    sendCodeBtn.layer.borderColor = [UIColor blackColor].CGColor;
    codeText.rightView = sendCodeBtn;
    codeText.rightViewMode = UITextFieldViewModeAlways;
    
   //
    UITextField * passWText = [[UITextField alloc]init];
    passWText.font = [UIFont systemFontOfSize:12];
    passWText.textColor = [UIColor blackColor];
    passWText.placeholder = @"请输入密码";
    passWText.textAlignment = NSTextAlignmentLeft;
    passWText.secureTextEntry = YES;
    passWText.clearButtonMode = UITextFieldViewModeUnlessEditing;
    passWText.layer.cornerRadius = 10;
    passWText.layer.borderColor = [UIColor grayColor].CGColor;
    passWText.layer.borderWidth = 0.5f;
    passWText.clipsToBounds = YES;
    
    //密码锁
    UIButton *lockBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, 2, 34, 30)];
    [lockBtn setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    lockBtn.userInteractionEnabled = NO;
    passWText.leftView = lockBtn;
    passWText.leftViewMode = UITextFieldViewModeAlways;
//
//
//    //密码眼睛
    UIButton * eyeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 2, 36, 32)];
    [eyeBtn setBackgroundImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    [eyeBtn addTarget:self action:@selector(clickEyeAction) forControlEvents:UIControlEventTouchUpInside];
    lockBtn.userInteractionEnabled = YES;
    passWText.rightView = eyeBtn;
    passWText.rightViewMode = UITextFieldViewModeAlways;
    //
    
    UIButton * registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registAction) forControlEvents:UIControlEventTouchUpInside];
    [registBtn setTintColor:[UIColor blackColor]];
    registBtn.backgroundColor = [UIColor grayColor];
    registBtn.layer.cornerRadius = 10;
    registBtn.layer.borderColor = [UIColor blackColor].CGColor;
    registBtn.layer.borderWidth = 0.2f;
    
    
    UILabel * moreloginLabel = [[UILabel alloc]init];
    moreloginLabel.textAlignment = NSTextAlignmentCenter;
    moreloginLabel.text = @"注册代表您已阅读并同意";
    moreloginLabel.font = [UIFont systemFontOfSize:12];
    moreloginLabel.textColor = [UIColor grayColor];
    
    UIButton * agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [agreementBtn setTitle:@"<<博大智协议>>" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [agreementBtn addTarget:self action:@selector(clickAgreement) forControlEvents:UIControlEventTouchUpInside];
    agreementBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    
    
    [self.view addSubview:loginText];
    [self.view addSubview:codeText];
    [self.view addSubview:passWText];
    [self.view addSubview:registBtn];
    [self.view addSubview:moreloginLabel];
    [self.view addSubview:agreementBtn];
    
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(240);
    }];
    
    [BackLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_top).offset(20);
        make.right.equalTo(headerView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 28));
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(15);
        make.centerX.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    [viceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.centerX.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(240, 26));
    }];
    
    //
    [loginText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 36));
    }];
    
    [codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginText.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 36));
    }];
    
    [passWText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeText.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 36));
    }];
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passWText.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 38));
    }];
    
    
    [moreloginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
        make.left.equalTo(self.view).offset(80);
        make.size.mas_equalTo(CGSizeMake(135, 30));
    }];
    [agreementBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moreloginLabel.mas_top).offset(0);
        make.left.equalTo(moreloginLabel.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(95, 30));
    }];
    
    
}



//注册
-(void)registAction{
    NSLog(@"注册...");
    
}

//查看协议
-(void)clickAgreement{
    NSLog(@"查看协议");
    
}

//发送验证码
-(void)clickSendCode{
    
    NSLog(@"开始发送");
}

//密码锁
-(void)clickLockAction{
    NSLog(@"开锁");
    
}

//查看密码
-(void)clickEyeAction{
    
    NSLog(@"查看密码");
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
