//
//  RCMyController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCMyController.h"
#import "UIbutton+middleButton.h"

@interface RCMyController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * titleArr;
@end

@implementation RCMyController
-(NSArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = @[@"我的简历",@"应聘信息",@"收藏夹",@"我的关注"];
    }
    return _titleArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 179, kScreen_WIDTH, kScreen_HEIGHT-179) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
//    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
    [self.view addSubview:self.tableView];
    
    [self setHeaderView];
    // Do any additional setup after loading the view.
}


-(void)setHeaderView{
    UIView * headerView = [[UIView alloc]init];
//    headerView.backgroundColor = [UIColor redColor];
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"myGround"];
    
    
    UIButton * iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"touxiang_2"] forState:UIControlStateNormal];
    
    
    UIButton * setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    
    UILabel * nickLabel = [[UILabel alloc]init];
    nickLabel.text = @"马晓云";
    nickLabel.font = [UIFont systemFontOfSize:18];
    
    UILabel * numberLabel = [[UILabel alloc]init];
    numberLabel.text = @"积分:258";
    numberLabel.font = [UIFont systemFontOfSize:14];
    
    //会员标签
    UIImageView * vipImage = [[UIImageView alloc]init];
    vipImage.image = [UIImage imageNamed:@"huiyuan"];
    
    UIButton * vipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [vipBtn setTitle:@"会员中心>" forState:UIControlStateNormal];
    vipBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [headerView addSubview:imageView];
    [headerView addSubview:iconBtn];
    [headerView addSubview:setBtn];
    [headerView addSubview:nickLabel];
    [headerView addSubview:numberLabel];
    [headerView addSubview:vipImage];
    [headerView addSubview:vipBtn];
    [self.view addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.height.mas_equalTo(179);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(headerView).offset(0);
    }];
    
    [setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(44);
        make.right.equalTo(headerView.mas_right).offset(-15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(81);
        make.left.equalTo(headerView).offset(15);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    [nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconBtn.mas_top).offset(0);
        make.left.equalTo(iconBtn.mas_right).offset(19);
        make.size.mas_equalTo(CGSizeMake(52, 17));
    }];
    
    [vipImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nickLabel.mas_top).offset(0);
        make.left.equalTo(nickLabel.mas_right).offset(19);
        make.size.mas_equalTo(CGSizeMake(23, 11));
        
    }];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nickLabel.mas_bottom).offset(12);
        make.left.equalTo(nickLabel.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(67, 13));
        
    }];

    [vipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(114);
        make.right.equalTo(headerView.mas_right).offset(-17);
        make.size.mas_equalTo(CGSizeMake(64, 14));
    }];
}


#pragma mark --- UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else{
        return 0;
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
//    if (indexPath.section == 0) {
//
//    }else{
//
//
//    }
    if (indexPath.row == 0) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"职业意向" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
         [cell.textLabel setAttributedText:string];
    }
    if (indexPath.row == 1) {
    
        cell.textLabel.text = @"博大服务";
        
    }
    
    if (indexPath.row == 2) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"人才测评" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
//        cell.textLabel.attributedText = string;
        [cell.textLabel setAttributedText:string];
    }
    
    if (indexPath.row == 3) {
//        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"人才测评" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
//         [cell.textLabel setAttributedText:string];
        cell.textLabel.text = @"职业培训";
        
    }
    
    if (indexPath.row == 4) {
//        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"人才测评" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 15],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
//          [cell.textLabel setAttributedText:string];
        cell.textLabel.text = @"成长路径模块";
    }
    
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableAttributedString *resumeStr = [[NSMutableAttributedString alloc] initWithString:self.titleArr[0] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]}];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setAttributedTitle:resumeStr forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(22,24,40,26);
    btn.titleEdgeInsets = UIEdgeInsetsMake(68, 0, 11, 5);
    [btn addTarget:self action:@selector(clickMyjian) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:10];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 0.5f;
    
    
    NSMutableAttributedString *resumeStr_2 = [[NSMutableAttributedString alloc] initWithString:self.titleArr[1] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]}];
    UIButton * btn_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_2 setAttributedTitle:resumeStr_2 forState:UIControlStateNormal];
    [btn_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_2 setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    btn_2.imageEdgeInsets = UIEdgeInsetsMake(22,24,40,26);
    btn_2.titleEdgeInsets = UIEdgeInsetsMake(68, 0, 11, 5);
    [btn_2 addTarget:self action:@selector(clickMessage) forControlEvents:UIControlEventTouchUpInside];
    btn_2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn_2.layer.borderWidth = 0.5f;
    
    NSMutableAttributedString *resumeStr_3 = [[NSMutableAttributedString alloc] initWithString:self.titleArr[2] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]}];
    UIButton * btn_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_3 setAttributedTitle:resumeStr_3 forState:UIControlStateNormal];
    [btn_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_3 setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    btn_3.imageEdgeInsets = UIEdgeInsetsMake(22,24,40,26);
    btn_3.titleEdgeInsets = UIEdgeInsetsMake(68, 0, 11, 5);
    [btn_3 addTarget:self action:@selector(clickShouCang) forControlEvents:UIControlEventTouchUpInside];
    btn_3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn_3.layer.borderWidth = 0.5f;
    
    NSMutableAttributedString *resumeStr_4 = [[NSMutableAttributedString alloc] initWithString:self.titleArr[3] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]}];
    UIButton * btn_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_4 setAttributedTitle:resumeStr_4 forState:UIControlStateNormal];
    [btn_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_4 setImage:[UIImage imageNamed:@"tou_01"] forState:UIControlStateNormal];
    btn_4.imageEdgeInsets = UIEdgeInsetsMake(22,24,40,26);
    btn_4.titleEdgeInsets = UIEdgeInsetsMake(68, 0, 11, 5);
    [btn_4 addTarget:self action:@selector(clickGuanzhu) forControlEvents:UIControlEventTouchUpInside];
    btn_4.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn_4.layer.borderWidth = 0.5f;
    
    [headView addSubview:btn_2];
    [headView addSubview:btn];
    [headView addSubview:btn_3];
    [headView addSubview:btn_4];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headView).offset(13);
        make.left.equalTo(headView).offset(15);
        make.size.mas_equalTo(CGSizeMake(75, 90));
    }];
    
    [btn_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn.mas_top).offset(0);
        make.left.equalTo(btn.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(75, 90));
    }];
    
    [btn_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn_2.mas_top).offset(0);
        make.left.equalTo(btn_2.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(75, 90));
    }];
    
    [btn_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn_3.mas_top).offset(0);
        make.left.equalTo(btn_3.mas_right).offset(15);
        make.size.mas_equalTo(CGSizeMake(75, 90));
    }];
    
    return headView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 118;
    }else{
        
        return 0;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return 15;
    }else{
        return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return 45;
    }else{
        return 55;
        
    }
    
}



#pragma mark --- UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        //求职意向
        
    }else if (indexPath.row == 2){
        //人才测评
        
    }else if (indexPath.row == 3){
        //职业培训
        
    }else if (indexPath.row == 4){
        //成长路径
        
    }else{
        
        
    }
    
}


//我的简历
-(void)clickMyjian{
    NSLog(@"我的简历");
    
}

//应聘信息
-(void)clickMessage{
    NSLog(@"i应聘信息");
    
}

//收藏夹
-(void)clickShouCang{
    NSLog(@"收藏夹");
    
}
//我的关注
-(void)clickGuanzhu{
    NSLog(@"我的关注");
    
}

// 设置按钮和图片垂直居中
-(void)setButtonContentCenter:(UIButton *) btn

{
    CGSize imgViewSize,titleSize,btnSize;
    UIEdgeInsets imageViewEdge,titleEdge;
    CGFloat heightSpace = 10.0f;
    //设置按钮内边距
    imgViewSize = btn.imageView.bounds.size;
    titleSize = btn.titleLabel.bounds.size;
    btnSize = btn.bounds.size;
    imageViewEdge = UIEdgeInsetsMake(heightSpace,0.0, btnSize.height -imgViewSize.height - heightSpace, - titleSize.width);
    [btn setImageEdgeInsets:imageViewEdge];
    titleEdge = UIEdgeInsetsMake(imgViewSize.height +heightSpace, - imgViewSize.width, 0.0, 0.0);
    [btn setTitleEdgeInsets:titleEdge];
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
