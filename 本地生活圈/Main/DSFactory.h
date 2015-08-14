//
//  DSFactory.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DSFactory : NSObject

+ (UIButton *)buttonWithType:(DSButtonType)buttonType withTitle:(NSString *)title withFrame:(CGRect)rect withTag:(NSInteger)tag;

+ (UIButton *)buttonWithType:(DSButtonType)buttonType withTitle:(NSString *)title withFrame:(CGRect)rect withTag:(NSInteger)tag withTarget:(id)target withAction:(SEL)action;


@end
