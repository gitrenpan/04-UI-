//
//  DSHTTPClient.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSHTTPClient.h"

#define KBaseURL @"http://www.qd-life.com/"

@implementation DSHTTPClient

// 创建一个单例对象
+ (instancetype)shareInstance
{
    static DSHTTPClient *client = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        client = [[DSHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:KBaseURL]];
        
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    });
    
    return client;
}


#pragma mark - 方法一:使用block

// 1.GET请求
+ (void)DSGET:(NSString *)url withParameters:(NSDictionary *)parameters withSuccessBlock:(SuccessBlock)success withFailedBlock:(FailedBlock)fail withErrorBlock:(ErrorBlock)error
{
    [[self shareInstance] GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString *status = responseObject[@"status"];
        
        if([status isEqualToString:@"success"]){
        
            success(responseObject);
            
        }else if ([status isEqualToString:@"error"]){
        
            NSLog(@"请求失败,请稍后再试");
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        fail(error);
        
    }];


}

// 2.POST请求
+ (void)DSPOST:(NSString *)url withParameters:(NSDictionary *)parameters withSuccessBlock:(SuccessBlock)success withFailedBlock:(FailedBlock)fail withErrorBlock:(ErrorBlock)error
{
    [[self shareInstance] POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString *status = responseObject[@"status"];
        
        if([status isEqualToString:@"success"]){
            
            success(responseObject);
            
        }else if ([status isEqualToString:@"error"]){
            
            NSLog(@"请求失败,请稍后再试");
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        fail(error);
    }];
}


#pragma mark - 方法二:使用代理

+ (void)DSGET:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id)delegate
{
    [[self shareInstance] DSGET:url withParameters:parameters delegate:delegate];
}

- (void)DSGET:(NSString *)url withParameters:(NSDictionary *)parameters delegate:(id)delegate
{
    _delegate = delegate;
    
    [self GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSString *status = responseObject[@"status"];
        
        if([status isEqualToString:@"success"]){
            
            if([self.delegate respondsToSelector:@selector(didSuccessRequest:)]){
                
                [self.delegate didSuccessRequest:responseObject];
            }
            
        }else if ([status isEqualToString:@"error"]){
            
            if([self.delegate respondsToSelector:@selector(didErrorRequest:)]){
            
                [self.delegate didErrorRequest:@"请求失败,请稍后再试"];
            }
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if([self.delegate respondsToSelector:@selector(didErrorRequest:)]){
            
            [self.delegate didFailedRequest:error];
        }
    }];
}

@end
