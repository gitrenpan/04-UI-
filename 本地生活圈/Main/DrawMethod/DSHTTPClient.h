//
//  DSHTTPClient.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


#pragma mark - 方法一:使用block

// 请求成功的回调
typedef void(^SuccessBlock)(id data);
// 请求失败的回调
typedef void(^FailedBlock)(NSError *error);
// 请求错误的回调
typedef void(^ErrorBlock)(id error);


#pragma mark - 方法二:使用代理

@protocol DSHTTPClientDelegate <NSObject>

- (void)didSuccessRequest:(id)data;
- (void)didFailedRequest:(NSError *)error;
- (void)didErrorRequest:(id)error;

@end


#pragma mark - 属性和方法的声明

@interface DSHTTPClient : AFHTTPSessionManager

// 创建一个单例对象
+ (instancetype)shareInstance;


/******** 方法一:使用block ********/
// 1.GET请求:
+ (void)DSGET:(NSString *)url withParameters:(NSDictionary *)parameters withSuccessBlock:(SuccessBlock)success withFailedBlock:(FailedBlock)fail withErrorBlock:(ErrorBlock)error;

// 2.POST请求:
+ (void)DSPOST:(NSString *)url withParameters:(NSDictionary *)parameters withSuccessBlock:(SuccessBlock)success withFailedBlock:(FailedBlock)fail withErrorBlock:(ErrorBlock)error;


/******** 方法二:使用代理 ********/

// 设置代理
@property (nonatomic,weak) id <DSHTTPClientDelegate> delegate;

+ (void)DSGET:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id)delegate;


@end

















