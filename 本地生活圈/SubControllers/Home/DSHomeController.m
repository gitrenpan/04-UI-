//
//  DSHomeController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSHomeController.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperation.h"
#import "DSGroupViewCell.h"
#import "DSHeaderViewCell.h"


@interface DSHomeController () <DSHTTPClientDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) CLLocation *location;

@property (nonatomic, strong) DSHomeModel *homeModel;

@property (nonatomic, strong) DSHeaderViewCell *headerCell;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DSHomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"青岛生活圈";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置tabBleView的顶部视图
    self.headerCell = [DSHeaderViewCell headerViewCell];
    
    self.headerCell.frame = CGRectMake(0, 0, KScreenWidth, 170);
    
    self.tableView.tableHeaderView = self.headerCell;
    
//    self.groupViewCell.frame = CGRectMake(0, CGRectGetMaxY(self.headerCell.frame), KScreenWidth, 170);
    
    // 获取数据
    [DSLocationManager positionSuccess:^(CLLocation *location) {
        
        self.location = location;
        
        [self getDataUseBlock];
        
    } failed:^(NSError *error) {
        
        // 设置一个默认的经纬度
        CLLocation *location = [[CLLocation alloc] initWithLatitude:30.77 longitude:44.888];
        
        self.location = location;
        
        [self getDataUseDelegate];
    }];
    
}


#pragma mark - UITableViewDataSource数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    
    DSGroupViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil){
        
        cell = [DSGroupViewCell groupViewCell];
        
    }
    
    cell.groupList = self.homeModel.group;
    
    return cell;
    
}


#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        return 353/2.0;
    }
    
    return 100;
}



#pragma mark - 使用block创建请求

- (void)getDataUseBlock
{
    // 1.设置参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // 1.1 设置经纬度
    [parameters setObject:[NSString stringWithFormat:@"%f",self.location.coordinate.longitude] forKey:@"lon"];
    [parameters setObject:[NSString stringWithFormat:@"%f",self.location.coordinate.latitude] forKey:@"lat"];
    
    // 1.2 设置时间戳
    NSString *timeStamp = [DSFunction getTimeStamp];
    [parameters setObject:timeStamp forKey:@"time"];
    
    // 1.3 设置加密
    NSArray *array = @[APP_ID,parameters[@"lon"],parameters[@"lat"],parameters[@"time"],APP_IDSign];
    NSString *signStr = [DSFunction MD5StringWith:array];
    
    [parameters setObject:signStr forKey:@"sign"];
    
    // 1.4 设置APP_ID
    [parameters setObject:APP_ID forKey:@"app_id"];
    
    // 2.使用block创建一个GET请求
    [DSHTTPClient DSGET:KHomeInfoURL withParameters:parameters withSuccessBlock:^(id data) {
        
        self.homeModel = [[DSHomeModel alloc] initWithDictionary:data error:nil];
        
        self.headerCell.foucsModel = self.homeModel.focus;
        
        [self.tableView reloadData];
        
    } withFailedBlock:^(NSError *error) {
        
        
    } withErrorBlock:^(id error) {
        
    }];
}

#pragma mark - 使用代理创建请求

- (void)getDataUseDelegate{
    
    // 1.设置参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    // 1.1 设置经纬度
    [parameters setValue:[NSString stringWithFormat:@"%f",self.location.coordinate.longitude] forKey:@"lon"];
    [parameters setValue:[NSString stringWithFormat:@"%f",self.location.coordinate.latitude] forKey:@"lat"];
    
    // 1.2 设置时间戳
    NSString *timeStamp = [DSFunction getTimeStamp];
    [parameters setValue:timeStamp forKey:@"time"];
    
    // 1.3 设置加密
    NSArray *array = @[APP_ID,parameters[@"lon"],parameters[@"lat"],parameters[@"time"],APP_IDSign];
    NSString *signStr = [DSFunction MD5StringWith:array];
    
    [parameters setValue:signStr forKey:@"sign"];
    
    // 1.4 设置APP_ID
    [parameters setValue:APP_ID forKey:@"app_id"];
    
    // 2.使用代理创建一个GET请求
    [DSHTTPClient DSGET:KHomeInfoURL withParameters:parameters delegate:self];
    
}


#pragma mark - DSHTTPClientDelegate的代理方法
- (void)didSuccessRequest:(id)data{
    
    NSLog(@"请求成功! 获得请求数据data");
}

- (void)didErrorRequest:(id)error
{
    
    
}

- (void)didFailedRequest:(NSError *)error
{
    
    
}


// 按钮的点击事件：按钮已经删除
- (void)homeBtnClick {
    
    DSTempViewController *vc = [[DSTempViewController alloc] init];
    
    vc.view.backgroundColor = DSRandomColor;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    // 隐藏tableView
    UIApplication *app = [UIApplication sharedApplication];
    
    AppDelegate *appDelegate = (AppDelegate *)app.delegate;
    
    [appDelegate.tabBarVc hideenTabBarWhenPush:YES];
    
}



@end
















