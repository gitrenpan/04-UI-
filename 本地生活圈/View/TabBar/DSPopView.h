//
//  DSPopView.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/10.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DSItemBtnClickProtocol;

@interface DSPopView : UIView

@property (nonatomic,strong) id <DSItemBtnClickProtocol> delegate;

@end
