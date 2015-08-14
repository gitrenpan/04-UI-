//
//  AppDelegate.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSBaseTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    BOOL flag;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) DSBaseTabBarController *tabBarVc;

@end

