//
//  DSLocationManager.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSLocationManager.h"

@interface DSLocationManager () <CLLocationManagerDelegate>

// 标记是否定位成功
{
    BOOL flag;
}

@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, copy) PositionSuccessBlock successBlock;
@property (nonatomic, copy) PositionFailedBlock failedBlock;

@end

@implementation DSLocationManager

- (instancetype)init
{
    if (self = [super init]) {
        
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        
        if([_manager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        
            [_manager requestAlwaysAuthorization];
            
            [_manager requestWhenInUseAuthorization];
        
        }
    }

    return self;
}


// 创建一个单例对象
+ (instancetype)shareInstance
{
    static DSLocationManager *dsManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        dsManager = [[DSLocationManager alloc] init];
        
    });
    
    return dsManager;
}

#pragma mark - block回调方法

+ (void)positionSuccess:(PositionSuccessBlock)success failed:(PositionFailedBlock)failed
{

    [[self shareInstance] positionSuccess:success failed:failed];

}

- (void)positionSuccess:(PositionSuccessBlock)success failed:(PositionFailedBlock)failed
{
    self.successBlock = success;
    self.failedBlock = failed;
    
    [_manager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate代理方法

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if(flag){
        
        return;
    }

    CLLocation *location = locations.lastObject;
    
    self.successBlock(location);
    flag = YES;
    [_manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusDenied){
    
        // 给一个默认的定位值
        self.failedBlock(nil);
        
        [_manager stopUpdatingLocation];
    }

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    // 给一个默认的定位值
    self.failedBlock(error);
    
    [_manager stopUpdatingLocation];

}

@end










