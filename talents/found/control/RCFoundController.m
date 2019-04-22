//
//  RCFoundController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCFoundController.h"
#import "XXPageTabView.h"
#import "RCInformationController.h"
#import "RCCourseController.h"

@interface RCFoundController ()<XXPageTabViewDelegate>

@end

@implementation RCFoundController

{
    XXPageTabView * _pageTabView;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化segmentType_0View
    [self setupUI];
}


#pragma mark - 初始化segmentType_0View
- (void)setupUI{
    // 1.我的项目组
    RCInformationController *title_0VC = [[RCInformationController alloc] init];
    title_0VC.view.backgroundColor = SYS_Cyan_Color;
    
    // 2.通讯录
    RCCourseController *title_1VC = [[RCCourseController alloc] init];
    title_1VC.view.backgroundColor = SYS_Yellow_Color;
    
    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];
    
    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"行业资讯", @"成长课程"]];
    _pageTabView.frame = CGRectMake(0, 22, kScreen_WIDTH, kScreen_HEIGHT-SYS_NavigationBar_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 44);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = [UIColor blackColor];
    _pageTabView.selectedColor = [UIColor redColor];
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
}

#pragma mark - XXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);
    
    switch (selectedTabIndex) {
        case 0:
        {
            // 行业资讯
        }
            break;
        case 1:
        {
            // 成长课程
        }
            break;
    }
}


@end
