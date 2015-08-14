//
//  DSGroupCollectionViewCell.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/13.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSGroupCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) DSGroupModel *groupModel;

+ (instancetype)groupCollectionViewCell;

@end
