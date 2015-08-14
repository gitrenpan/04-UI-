//
//  DSTabBarView.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSTabBarView.h"
#import "DSItemBtnClickProtocol.h"

@implementation DSTabBarView

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

    for(int i = 0; i < 5; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置背景图片
        NSString *nomalImage = [NSString stringWithFormat:@"home_%d",i];
        
        [button setImage:[UIImage imageNamed:nomalImage] forState:UIControlStateNormal];
        
        NSString *selectedImage = [NSString stringWithFormat:@"home_%d_pressed",i];
        
        [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        
        // 设置frame
        button.frame = CGRectMake(i*KScreenWidth/5, 0, KScreenWidth/5, TabBarHeight);
        
        button.tag = i;
        
        if(i == 0)
        {
            button.selected = YES;
        }
        
        [button addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
}

- (void)tabBarBtnClick:(UIButton *)button
{
    [self.subviews enumerateObjectsUsingBlock:^(UIButton * itemBtn, NSUInteger idx, BOOL *stop) {
        
        itemBtn.selected = NO;
    }];
    
    button.selected = YES;
    
    if([self.delegate respondsToSelector:@selector(btnClickWithIndex:)])
    {
        [self.delegate btnClickWithIndex:button.tag];
    }
}


@end
