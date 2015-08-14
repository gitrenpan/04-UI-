//
//  DSFunction.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MD5.h"

@interface DSFunction : NSObject

// 获得时间戳
+ (NSString *)getTimeStamp;

// 加密
+ (NSString *)MD5StringWith:(NSArray *)array;

@end
