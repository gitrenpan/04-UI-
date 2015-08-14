//
//  DSConstant.h
//  本地生活圈
//
//  Created by 任攀 on 15/8/9.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#ifndef ______DSConstant_h
#define ______DSConstant_h


#ifdef DEBUG
#define DSLog(...) NSLog(__VA_ARGS__)
#else
#define DSLog(...)
#endif

/************ 颜色设置 **************/
#define DSRandomColor [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1.0]

#define DSRandomColorWith(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

/************ 控件宽高 **************/
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define KNaviViewHeight 64
#define KStatusHeight 20

#define TabBarHeight 49
#define popViewHeight 44


/************ 网络请求 **************/
#define APP_ID @"1001"
#define APP_IDSign @"5bV9JhaMn2GJ5MZe"

#define KHomeInfoURL @"?anu=api/1/index/get_index_info"

/************ 枚举 **************/
typedef enum
{
    DSButtonTypeNomal,
    DSButtonTypeConner,
    
    
}DSButtonType;


#endif
