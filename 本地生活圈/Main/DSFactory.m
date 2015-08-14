//
//  DSFactory.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSFactory.h"

@implementation DSFactory

+ (UIButton *)buttonWithType:(DSButtonType)buttonType withTitle:(NSString *)title withFrame:(CGRect)rect withTag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.tag = tag;

    return button;
}

+ (UIButton *)buttonWithType:(DSButtonType)buttonType withTitle:(NSString *)title withFrame:(CGRect)rect withTag:(NSInteger)tag withTarget:(id)target withAction:(SEL)action
{
    UIButton *button = [self buttonWithType:buttonType withTitle:title withFrame:rect withTag:tag];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return button;

}


@end
