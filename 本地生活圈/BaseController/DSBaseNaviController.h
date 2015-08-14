//
//  DSBaseNaviController.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSBaseViewController.h"

@interface DSBaseNaviController : DSBaseViewController

@property (nonatomic,strong) UIView *naviView;

@property (nonatomic,strong) UIButton *leftBtn;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIButton *rightBtn;

@end
