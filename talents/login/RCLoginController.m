//
//  RCLoginController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCLoginController.h"
#import <Masonry/Masonry.h>
#import "RCRegisterController.h"
#import "RCPassLoginController.h"
#import "RCTabController.h"


@interface RCLoginController ()

@end

@implementation RCLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //头部视图
    [self setUI];
    
    // Do any additional setup after loading the view.
}

-(void)setUI{
    UIView * headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor grayColor];
    
    UIButton * regisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [regisBtn setTitle:@"注册>" forState:UIControlStateNormal];
    [regisBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regisBtn addTarget:self action:@selector(clickRrgistTo) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"log_01"];
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.text = @"欢迎来到博大智平台";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    
    UILabel * viceTitleLabel = [[UILabel alloc]init];
    viceTitleLabel.font = [UIFont systemFontOfSize:14];
    viceTitleLabel.text = @"智慧链接人企校，精准匹配职无忧";
    viceTitleLabel.textAlignment = NSTextAlignmentCenter;
    viceTitleLabel.textColor = [UIColor lightGrayColor];
    
    [headerView addSubview:regisBtn];
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
    UIView * lefLigView = [[UIView alloc]initWithFrame:CGRectMake(5, 2, 44, 32)];
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
   
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(toLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTintColor:[UIColor blackColor]];
    loginBtn.backgroundColor = [UIColor grayColor];
    loginBtn.layer.cornerRadius = 10;
    loginBtn.layer.borderColor = [UIColor blackColor].CGColor;
    loginBtn.layer.borderWidth = 0.2f;
    
    UIButton * passLogBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [passLogBtn setTitle:@"密码登陆" forState:UIControlStateNormal];
    [passLogBtn addTarget:self action:@selector(clickPassVC) forControlEvents:UIControlEventTouchUpInside];
    [passLogBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    passLogBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UILabel * moreloginLabel = [[UILabel alloc]init];
    moreloginLabel.textAlignment = NSTextAlignmentCenter;
    moreloginLabel.text = @"-更多登陆方式-";
    moreloginLabel.font = [UIFont systemFontOfSize:12];
    moreloginLabel.textColor = [UIColor grayColor];
    
    
    [self.view addSubview:loginText];
    [self.view addSubview:codeText];
    [self.view addSubview:loginBtn];
    [self.view addSubview:passLogBtn];
    [self.view addSubview:moreloginLabel];
    
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(240);
    }];
    
    [regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.size.mas_equalTo(CGSizeMake(kScreen_WIDTH, 30));
    }];
    
    [viceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.centerX.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(kScreen_WIDTH, 26));
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
    

    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeText.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 38));
    }];
    
    [passLogBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginBtn.mas_left).offset(0);
        make.top.equalTo(loginBtn.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 26));
    }];
    
    [moreloginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passLogBtn.mas_bottom).offset(40);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150, 30));
    }];
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}


//跳转注册
-(void)clickRrgistTo{
    RCRegisterController * registVC = [[RCRegisterController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
    
}

//登陆
-(void)toLogin{
    RCTabController * HomeVC = [[RCTabController alloc]init];
    [self.navigationController pushViewController:HomeVC animated:NO];
    
    NSLog(@"点击登陆...");
    
}

//跳转密码登陆
-(void)clickPassVC{
    RCPassLoginController * passVC = [[RCPassLoginController alloc]init];
    [self.navigationController pushViewController:passVC animated:YES];
    
}

//发送短信验证码
-(void)clickSendCode{
    
    NSLog(@"点击发送");
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
