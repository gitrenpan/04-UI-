//
//  DSLocationManager.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^PositionSuccessBlock)(CLLocation *location);
typedef void(^PositionFailedBlock)(NSError *error);

@interface DSLocationManager : NSObject

// 创建一个单例对象
+ (instancetype)shareInstance;

// block回调方法
+ (void)positionSuccess:(PositionSuccessBlock)success failed:(PositionFailedBlock)failed;

@end
