//
//  DSTempViewController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSTempViewController.h"

@interface DSTempViewController ()

@end

@implementation DSTempViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = @"测试控制器";

}

// 重写父类的方法,隐藏tabBarView
- (void)backMethod{
    
    UIApplication *app = [UIApplication sharedApplication];
    
    AppDelegate *delegate = app.delegate;
    
    [delegate.tabBarVc hideenTabBarWhenPush:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
