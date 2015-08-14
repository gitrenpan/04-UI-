//
//  DSBaseTabBarController.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSBaseTabBarController.h"
#import "DSBaseNaviController.h"
#import "DSHomeController.h"
#import "DSCircleController.h"
#import "DSNewsController.h"
#import "DSToolsController.h"
#import "DSTabBarView.h"
#import "DSPopView.h"
#import "DSItemBtnClickProtocol.h"
#import "DSShakeController.h"
#import "DSLivieToolsController.h"
#import "DSSurroundController.h"

@interface DSBaseTabBarController () <DSItemBtnClickProtocol>

@property (nonatomic, strong) DSTabBarView *tabBarView;

@property (nonatomic, strong) DSPopView *popView;


@end

@implementation DSBaseTabBarController

#pragma mark - 懒加载
- (DSTabBarView *)tabBarView
{
    if(_tabBarView == nil)
    {
        _tabBarView = [[DSTabBarView alloc] init];
        
    }
    
    return _tabBarView;
}

- (DSPopView *)popView
{
    if(_popView == nil)
    {
        _popView = [[DSPopView alloc] init];
        
    }
    
    return _popView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置TabBarView
    [self setupTabBarView];
    
    // 2.设置Popview
    [self setupPopView];
    
    // 3.创建子控制器
    [self setupSubControllers];
    
    // 4.隐藏或删除系统的tabBar
//    self.tabBar.hidden = YES;
    [self.tabBar removeFromSuperview];
    
}


#pragma mark - 设置子控件

// 设置TabBarView
- (void)setupTabBarView
{
    // 1.设置底部工具条
    self.tabBarView = [[DSTabBarView alloc] initWithFrame:CGRectMake(0, KScreenHeight - TabBarHeight, KScreenWidth, TabBarHeight)];
    // 设置代理
    self.tabBarView.delegate = self;
    
    // 2.直接添加到自带的导航条上
    [self.view addSubview:self.tabBarView];
    
}

// 设置Popview
- (void)setupPopView
{
    // 1.设置popView
    self.popView = [[DSPopView alloc] initWithFrame:CGRectMake(0, KScreenHeight - TabBarHeight - popViewHeight, KScreenWidth, popViewHeight)];
    
    // 设置代理
    self.popView.delegate = self;
    // 2.设置popview隐藏
    self.popView.hidden = YES;
    
    // 3.添加到控制器的view上
    [self.view addSubview:self.popView];
    
}

#pragma mark - <##>DSItemBtnClickProtocol代理方法

- (void)btnClickWithIndex:(NSInteger)index
{
    if(index < 4)
    {
    
        self.selectedViewController = self.viewControllers[index];
        
        self.popView.hidden = YES;
        
    }else if (index == 4){
    
        self.popView.hidden = !self.popView.hidden;
        
    }else if (index > 4){
    
        self.selectedViewController = self.viewControllers[index-1];
        self.popView.hidden = YES;
    }
}

#pragma mark - 隐藏tabBarView

- (void)hideenTabBarWhenPush:(BOOL)flag
{
    if(flag){
    
        self.tabBarView.hidden = YES;
        self.popView.hidden = YES;
    
    }else{
    
        self.tabBarView.hidden = NO;
    }
}


#pragma mark - 创建子控制器

// 从xib中加载控制器的View
- (void)setupSubControllers2{

    DSHomeController *home = [[DSHomeController alloc] initWithNibName:nil bundle:nil];
    
    
    UINavigationController *homeVc = [[UINavigationController alloc]initWithRootViewController:home];
    
    DSCircleController *circle = [[DSCircleController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController *circleVc = [[UINavigationController alloc]initWithRootViewController:circle];
    
    DSNewsController *new = [[DSNewsController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController *newsVc = [[UINavigationController alloc]initWithRootViewController:new];
    
    DSToolsController *tools = [[DSToolsController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController *toolsVc = [[UINavigationController alloc]initWithRootViewController:tools];
    
    self.viewControllers = @[homeVc,newsVc,circleVc,toolsVc];

}

// 从storyboard中加载控制器
- (void)setupSubControllers
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // home控制器
    DSHomeController *home = [storyboard instantiateViewControllerWithIdentifier:@"DSHomeController"];
    
    UINavigationController *homeVc = [[UINavigationController alloc]initWithRootViewController:home];
    
    // circle控制器
    DSCircleController *circle = [storyboard instantiateViewControllerWithIdentifier:@"DSCircleController"];
    
    UINavigationController *circleVc = [[UINavigationController alloc]initWithRootViewController:circle];
    
    // news控制器
    DSNewsController *news = [storyboard instantiateViewControllerWithIdentifier:@"DSNewsController"];
    
    UINavigationController *newsVc = [[UINavigationController alloc]initWithRootViewController:news];
    
    // tools控制器
    DSToolsController *tools = [storyboard instantiateViewControllerWithIdentifier:@"DSToolsController"];
    
    UINavigationController *toolsVc = [[UINavigationController alloc]initWithRootViewController:tools];
    
    // shake控制器
    DSShakeController *shake = [[DSShakeController alloc] init];
    shake.view.backgroundColor = [UIColor brownColor];
    UINavigationController *shakeVc = [[UINavigationController alloc] initWithRootViewController:shake];
    
    // liveTools控制器
    DSShakeController *liveTools = [[DSShakeController alloc] init];
    liveTools.view.backgroundColor = [UIColor greenColor];
    UINavigationController *liveToolsVc = [[UINavigationController alloc] initWithRootViewController:liveTools];
    
    // surround控制器
    DSShakeController *surround = [[DSShakeController alloc] init];
    surround.view.backgroundColor = [UIColor lightGrayColor];
    UINavigationController *surroundVc = [[UINavigationController alloc] initWithRootViewController:surround];
    
    // 添加子控制器
    self.viewControllers = @[homeVc,newsVc,circleVc,toolsVc,shakeVc,liveToolsVc,surroundVc];
}


@end
