//
//  DSPopView.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSPopView.h"
#import "DSItemBtnClickProtocol.h"

@implementation DSPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    bgView.image = [UIImage imageNamed:@"home_topbar"];
    // 添加背景view
    [self addSubview:bgView];
    
    // 2.1 添加子控件
    // 摇一摇
    UIButton *shakeBtn = [DSFactory buttonWithType:DSButtonTypeNomal withTitle:@"摇一摇" withFrame:CGRectMake(0, 0, 160.0/640*KScreenWidth, popViewHeight) withTag:5 withTarget:self withAction:@selector(popBtnClick:)];
    
    [self addSubview:shakeBtn];
    
    // 生活工具
    UIButton *liveToolBtn = [DSFactory buttonWithType:DSButtonTypeNomal withTitle:@"生活工具" withFrame:CGRectMake(160.0/640*KScreenWidth, 0, 176.0/640*KScreenWidth, popViewHeight) withTag:6 withTarget:self withAction:@selector(popBtnClick:)];
    
    [self addSubview:liveToolBtn];
    
    // 周边
    UIButton *surroundBtn = [DSFactory buttonWithType:DSButtonTypeNomal withTitle:@"周边" withFrame:CGRectMake(348.0/640*KScreenWidth, 0, 128.0/640*KScreenWidth, popViewHeight) withTag:7 withTarget:self withAction:@selector(popBtnClick:)];
    
    [self addSubview:surroundBtn];
}


- (void)popBtnClick:(UIButton *)button
{
    self.hidden = YES;
    
    if([self.delegate respondsToSelector:@selector(btnClickWithIndex:)])
    {
        [self.delegate btnClickWithIndex:button.tag];
    }
}

@end
