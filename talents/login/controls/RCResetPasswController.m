//
//  RCResetPasswController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//  重置密码

#import "RCResetPasswController.h"
#import "RCAgainPassWordController.h"

@interface RCResetPasswController ()

@end

@implementation RCResetPasswController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"重置密码";
    
    //加载UI
    [self setUI];
    
    // Do any additional setup after loading the view.
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
    UIView * LeftCodeView = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 44, 32)];
    LeftCodeView.backgroundColor = [UIColor whiteColor];
    passTextImageView.center = LeftCodeView.center;
    [LeftCodeView addSubview:passTextImageView];
    codeText.leftViewMode = UITextFieldViewModeAlways;
    codeText.leftView = LeftCodeView;
    [codeText sizeToFit];
    
    UIButton * sendCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 100, 32)];
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
    
    //完成按钮
    UIButton * registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"验证" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [registBtn setTintColor:[UIColor blackColor]];
    registBtn.backgroundColor = [UIColor grayColor];
    registBtn.layer.cornerRadius = 10;
    registBtn.layer.borderColor = [UIColor blackColor].CGColor;
    registBtn.layer.borderWidth = 0.2f;
    
    UIView * line_1 = [[UIView alloc]init];
    line_1.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    
    UIButton * butTitle1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [butTitle1 setTitle:@"1.验证手机号" forState:UIControlStateNormal];
    [butTitle1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    butTitle1.userInteractionEnabled = NO;
    
    UIImageView * imageView_1 = [[UIImageView alloc]init];
    imageView_1.image = [UIImage imageNamed:@"arrow"];
    
    
    UIView * line_2 = [[UIView alloc]init];
    line_2.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
   
    UIButton * butTitle2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [butTitle2 setTitle:@"2.设置新密码" forState:UIControlStateNormal];
    [butTitle2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [butTitle2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    butTitle2.userInteractionEnabled = NO;
    
    [self.view addSubview:line_1];
    [self.view addSubview:line_2];
    [self.view addSubview:imageView_1];
    [self.view addSubview:butTitle1];
    [self.view addSubview:butTitle2];
    [self.view addSubview:loginText];
    [self.view addSubview:codeText];
    [self.view addSubview:registBtn];
    
    [line_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(88);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    [butTitle1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line_1.mas_bottom).offset(2);
        make.left.equalTo(self.view).offset(0);
        make.size.mas_equalTo(CGSizeMake((kScreen_WIDTH-20)/2, 30));
    }];
    
    [imageView_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line_1.mas_bottom).offset(2);
        make.left.equalTo(butTitle1.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(20, 30));
    }];
    
    [butTitle2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line_1.mas_bottom).offset(2);
        make.right.equalTo(self.view).offset(0);
        make.size.mas_equalTo(CGSizeMake((kScreen_WIDTH-20)/2, 30));
    }];
    
    [line_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(butTitle1.mas_bottom).offset(5);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(1);
     }];
    
    [loginText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 44));
    }];
    
    [codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginText.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 44));
    }];
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeText.mas_bottom).offset(30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 45));
    }];
    
}

//获取验证码
-(void)clickSendCode{
    
    
}

//验证
-(void)loginAction{
    RCAgainPassWordController * againVC = [[RCAgainPassWordController alloc]init];
    [self.navigationController pushViewController:againVC animated:YES];
    
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
