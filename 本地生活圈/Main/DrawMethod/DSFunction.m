//
//  DSFunction.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/11.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSFunction.h"

@implementation DSFunction

// 获得时间戳
+ (NSString *)getTimeStamp
{
    NSString *timeStamp = [NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];
    
    return timeStamp;
}


// 加密
+ (NSString *)MD5StringWith:(NSArray *)array
{
    NSMutableString *string = [NSMutableString string];
    
    [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger idx, BOOL *stop) {
        
        [string appendString:str];
        
    }];
    
    return [MD5 MD5Encrypt:string];
}

@end
