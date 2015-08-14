//
//  DSTwoTempController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSTwoTempController.h"

@interface DSTwoTempController ()

@end

@implementation DSTwoTempController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = @"测试控制器2";

}

// 重写父类的方法
- (void)backMethod{

    UIApplication *app = [UIApplication sharedApplication];

    AppDelegate *delegate = app.delegate;

    [delegate.tabBarVc hideenTabBarWhenPush:NO];
    
    [self.navigationController popViewControllerAnimated:YES];

}

@end
