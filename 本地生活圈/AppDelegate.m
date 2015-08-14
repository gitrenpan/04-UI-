//
//  AppDelegate.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "AppDelegate.h"
#import "DSNewFeatureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"flag"]){
    
        self.tabBarVc = [[DSBaseTabBarController alloc] init];
        self.window.rootViewController = self.tabBarVc;
    
    }else{
    
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"flag"];
        
        //新特性控制器
        DSNewFeatureController *newFeatureController = [[DSNewFeatureController alloc] init];
        
        self.window.rootViewController = newFeatureController;
    }

    [self.window makeKeyAndVisible];
  
    return YES;
}


@end
