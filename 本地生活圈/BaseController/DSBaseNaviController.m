//
//  DSBaseNaviController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSBaseNaviController.h"


#define KNaviBtnWidth 44
#define KNaviBtnHeight 44

@interface DSBaseNaviController ()

@end

@implementation DSBaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 隐藏系统的NavigationBar
    self.navigationController.navigationBarHidden = YES;
    
    // 设置导航栏
    [self setupNavigationBar];
    
}

- (void)setupNavigationBar
{
    // 导航条View
    self.naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KNaviViewHeight)];
    
    self.naviView.backgroundColor = DSRandomColorWith(217, 81, 30);
    
    [self.view addSubview:self.naviView];
    
    // 左边按钮
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.leftBtn.frame = CGRectMake(0, KStatusHeight, KNaviBtnWidth,KNaviBtnHeight);
    
    [self.leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    
    
    [self.leftBtn addTarget:self action:@selector(backMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [self.naviView addSubview:self.leftBtn];
    
    // 中间的Label
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    // 如果子类没有设置title则会使用父类的
//  self.titleLabel.text = @"电商";
    self.titleLabel.font = [UIFont systemFontOfSize:18];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    [self.naviView addSubview:self.titleLabel];
    
    // 右边按钮
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.rightBtn addTarget:self action:@selector(loginMethod) forControlEvents:UIControlEventTouchUpInside];
    
    [self.naviView addSubview:self.rightBtn];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // 设置Label的frame
    CGRect rect = [self.titleLabel.text boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]} context:nil];
    
    self.titleLabel.frame = CGRectMake((KScreenWidth - rect.size.width)*0.5, KStatusHeight + (KNaviBtnHeight - rect.size.height)*0.5, rect.size.width, rect.size.height);

    if(/* DISABLES CODE */ (NO)){ // 已经登录
        
        [self.rightBtn setBackgroundImage:[UIImage imageNamed:@"nav_user"] forState:UIControlStateNormal];
        
        [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
    
        self.rightBtn.frame = CGRectMake(KScreenWidth - KNaviBtnWidth, KStatusHeight, KNaviBtnWidth, KNaviBtnHeight);
    
    }else{ //还没有登录
    
        [self.rightBtn setImage:nil forState:UIControlStateNormal];
        
        [self.rightBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        
        [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        
        self.rightBtn.frame = CGRectMake(KScreenWidth - 2*KNaviBtnWidth, KStatusHeight, 2*KNaviBtnWidth, KNaviBtnHeight);
    
    }
}


- (void)backMethod{
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)loginMethod{

    DSTempViewController *vc = [[DSTempViewController alloc] init];
    
    vc.view.backgroundColor = [UIColor redColor];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
