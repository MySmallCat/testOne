//
//  RCAgainPassWordController.m
//  talents
//
//  Created by Liub on 2019/4/22.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCAgainPassWordController.h"

@interface RCAgainPassWordController ()

@end

@implementation RCAgainPassWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
    
    // Do any additional setup after loading the view.
}


-(void)setUI{
    
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

    
    //完成按钮
    UIButton * registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"完成" forState:UIControlStateNormal];
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
    [self.view addSubview:passWText];
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
    
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line_2.mas_bottom).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 45));
    }];
    [passWText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line_2.mas_bottom).offset(20);
        make.left.equalTo(registBtn.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(260, 45));
    }];
    
}

//查看
-(void)clickEyeAction{
    
    
}

//完成密码修改
-(void)loginAction{
    NSLog(@"修改完成");
    
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
