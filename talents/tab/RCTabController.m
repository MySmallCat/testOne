//
//  RCTabController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCTabController.h"
#import "RCMainController.h"
#import "RCMessageController.h"
#import "RCFoundController.h"
#import "RCMyController.h"

@interface RCTabController ()

@end

@implementation RCTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadControllers];
    
    //直接设置背景色
//    [[UITabBar appearance]setBarTintColor:[UIColor orangeColor]];
//    [UITabBar appearance].translucent = NO;
    
    //设置点击item背景色
//    CGSize indicatorImageSize =CGSizeMake(self.tabBar.bounds.size.width/4 , self.tabBar.bounds.size.height);
//    self.tabBar.selectionIndicatorImage = [self drawTabBarItemBackgroundUmageWithSize:indicatorImageSize];
    
}

-(void)loadControllers{
    RCMainController * home = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"home"];
    RCMessageController * message = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"message"];
    RCFoundController * foundVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"found"];
    RCMyController * myVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"myrc"];
    
    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:home];
    
    self.viewControllers = @[nav1,message,foundVC,myVC];
    
     nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home"]];
    message.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"message"] selectedImage:[UIImage imageNamed:@"message"]];
    foundVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"found"] selectedImage:[UIImage imageNamed:@"found"]];
    myVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"my"] selectedImage:[UIImage imageNamed:@"my"]];
    
    message.tabBarItem.badgeValue = @"2";
    message.tabBarItem.badgeColor = [UIColor redColor];
    
    self.tabBar.tintColor = [UIColor redColor];
    
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundImage = [[UIImage alloc]init];
}



-(UIImage *)drawTabBarItemBackgroundUmageWithSize:(CGSize)size
{
    //开始图形上下文
    UIGraphicsBeginImageContext(size);
    //获得图形上下文
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(ctx,253/255.0,232/255.0, 108/255.0, 1);
    CGContextFillRect(ctx,CGRectMake(0,0, size.width, size.height));
    
    
    CGRect rect =CGRectMake(0,0, size.width, size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextClip(ctx);
    
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    
    [image drawInRect:rect];
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
