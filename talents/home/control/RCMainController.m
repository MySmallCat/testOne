//
//  RCMainController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCMainController.h"
#import "XYBannerView.h"
#import "XXPageTabView.h"
#import "RCIntroduceController.h"
#import "RCTodayMatchController.h"

@interface RCMainController ()<XYBannerViewDelegate,XXPageTabViewDelegate>
@property (nonatomic,strong) UIButton * prossionalBtn;
@property (nonatomic,strong) UIButton * growthBtn;
@property (nonatomic,strong) UILabel * introduceLabel;
@end

@implementation RCMainController
{
    XXPageTabView * _pageTabView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    
    [self evaluetionView];
    
    [self setScrolUI];
}

//
-(void)evaluetionView{
    // 1.创建banner
    XYBannerView *banner = [[XYBannerView alloc] init];
    
    // 2.设置banner相关属性
    banner.imagesArr = @[@"timg_1",@"timg_2",@"timg_3",@"timg_4",@"timg_5"];
    
    //    banner.titlesArr = @[@"111111111",@"2222222222",@"333333333",@"444444444",@"555555555"];
    banner.frame = CGRectMake(0, 64, kScreen_WIDTH, 150);
    
    // 3. 监听设置代理
    banner.delegate = self;
    
    
    // 3.添加到UI上
    [self.view addSubview:banner];
    
    
    UIView * evaView = [[UIView alloc]init];
    evaView.backgroundColor = [UIColor colorWithRed:19/255.0 green:17/255.0 blue:54/255.0 alpha:1];
    
    UIButton * evaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [evaBtn setTitle:@"马上测评" forState:UIControlStateNormal];
    [evaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    evaBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [evaBtn setBackgroundImage:[UIImage imageNamed:@"evalbtn"] forState:UIControlStateNormal];
    [evaBtn addTarget:self action:@selector(clickEval) forControlEvents:UIControlEventTouchUpInside];
 
                                         
    UILabel * titleLabel_1 = [[UILabel alloc]init];
    titleLabel_1.text = @"已有 197987 位人才在博大智找到合适的工作";
    titleLabel_1.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:13];
    titleLabel_1.textColor = [UIColor colorWithRed:182/255.0 green:195/255.0 blue:205/255.0 alpha:1.0];
    titleLabel_1.numberOfLines = 0;
    
    self.prossionalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.prossionalBtn setBackgroundImage:[UIImage imageNamed:@"professional"] forState:UIControlStateNormal];
    [self.prossionalBtn addTarget:self action:@selector(clickProfessional) forControlEvents:UIControlEventTouchUpInside];
    
    self.growthBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.growthBtn setBackgroundImage:[UIImage imageNamed:@"growth"] forState:UIControlStateNormal];
    [self.growthBtn addTarget:self action:@selector(clickGrowth) forControlEvents:UIControlEventTouchUpInside];
    
    self.introduceLabel = [[UILabel alloc]init];
    self.introduceLabel.text = @"根据您的职业现状，今日匹配:30个岗位，5家公司";
    self.introduceLabel.numberOfLines = 1;
    self.introduceLabel.backgroundColor = [UIColor colorWithRed:249/255.0 green:231/255.0 blue:233/255.0 alpha:1];
    
    
    [self.view addSubview:self.prossionalBtn];
    [self.view addSubview:self.growthBtn];
    [self.view addSubview:self.introduceLabel];
    
    [evaView addSubview:evaBtn];
    [evaView addSubview:titleLabel_1];
    [self.view addSubview:evaView];
    
    [evaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(banner.mas_bottom).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(70);
    }];
    [evaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(evaView).offset(15);
        make.right.equalTo(evaView.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(114, 40));
    }];
    
    [titleLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(evaView).offset(15);
        make.left.equalTo(evaView).offset(17);
        make.size.mas_equalTo(CGSizeMake(163, 38));
    }];
    
    [self.prossionalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(evaView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(170, 95));
    }];
    
    [self.growthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.prossionalBtn.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(170, 95));
    }];
    
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.growthBtn.mas_bottom).offset(10);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(35);
    }];
    
}


-(void)setScrolUI{
    // 1.今日匹配
    RCTodayMatchController *title_0VC = [[RCTodayMatchController alloc] init];
    title_0VC.view.backgroundColor = SYS_Cyan_Color;
    
    // 2.推荐
    RCIntroduceController *title_1VC = [[RCIntroduceController alloc] init];
    title_1VC.view.backgroundColor = SYS_Yellow_Color;
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"今日匹配", @"推荐公司"]];
//    _pageTabView.frame = CGRectMake(0, 22, kScreen_WIDTH, kScreen_HEIGHT-SYS_NavigationBar_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 44);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = [UIColor blackColor];
    _pageTabView.selectedColor = [UIColor redColor];
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
    
    [_pageTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.introduceLabel.mas_bottom).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-49);
    }];
    
}



//点击轮播图
- (void)bannerView:(XYBannerView *)banner didClickImageAtIndex:(NSInteger)index
{
    NSLog(@"广告index == %ld",index);
}


//点击测评
-(void)clickEval{
    NSLog(@"点击测评");
    
}

//职业
-(void)clickProfessional{
    
    NSLog(@"职业");
}

//成长
-(void)clickGrowth{
    
    NSLog(@"成长");
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
