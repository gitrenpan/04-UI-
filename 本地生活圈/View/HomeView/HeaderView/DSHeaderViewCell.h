//
//  DSHeaderViewCell.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/12.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSHomeModel.h"

@interface DSHeaderViewCell : UITableViewCell

@property (nonatomic,strong) FocusListModel *foucsModel;

+ (instancetype)headerViewCell;

@end
