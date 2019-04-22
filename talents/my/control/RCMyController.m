//
//  RCMyController.m
//  人才端
//
//  Created by Liub on 2019/4/19.
//  Copyright © 2019年 Liub. All rights reserved.
//

#import "RCMyController.h"

@interface RCMyController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation RCMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 179, kScreen_WIDTH, kScreen_HEIGHT-179) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self setHeaderView];
    // Do any additional setup after loading the view.
}


-(void)setHeaderView{
    UIView * headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor redColor];
    
    UIButton * iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [iconBtn setBackgroundImage:[UIImage imageNamed:@"touxiang"] forState:UIControlStateNormal];
    
    
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
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"职业意向";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"博大服务";
    }
    
    if (indexPath.row == 2) {
        cell.textLabel.text = @"人才测评";
    }
    
    if (indexPath.row == 3) {
        cell.textLabel.text = @"职业培训";
        
    }
    
    if (indexPath.row == 4) {
        cell.textLabel.text = @"成长路径";
    }
    
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"我的简历" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickMyjian) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 0.5f;
    
    
    UIButton * btn_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_2 setTitle:@"应聘信息" forState:UIControlStateNormal];
    [btn_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_2 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn_2 addTarget:self action:@selector(clickMessage) forControlEvents:UIControlEventTouchUpInside];
    btn_2.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn_2.layer.borderWidth = 0.5f;
    
    UIButton * btn_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_3 setTitle:@"收藏夹" forState:UIControlStateNormal];
    [btn_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_3 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn_3 addTarget:self action:@selector(clickShouCang) forControlEvents:UIControlEventTouchUpInside];
    btn_3.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn_3.layer.borderWidth = 0.5f;
    
    UIButton * btn_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_4 setTitle:@"我的关注" forState:UIControlStateNormal];
    [btn_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn_4 setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
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
    return 118;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
