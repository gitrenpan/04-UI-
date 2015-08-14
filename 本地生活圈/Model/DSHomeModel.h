//
//  DSHomeModel.h
//  广四生活圈
//
//  Created by Apple on 15/8/10.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "JSONModel.h"
@class FocusListModel,DSGroupList;


@protocol FocusModel;

#pragma mark - DSHomeModel属性声明

@interface DSHomeModel : JSONModel

@property(nonatomic,strong) FocusListModel *focus;

@property(nonatomic,strong) DSGroupList *group;

@end


#pragma mark -- FocusListModel属性声明

@interface FocusListModel : JSONModel

@property(nonatomic,strong) NSArray<FocusModel> *list;

@end


#pragma mark - FocusModel属性声明<##>

@interface FocusModel : JSONModel

/**
 * 焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  焦点图标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;
/**
 *  所要跳转的基础连接
 */
@property(nonatomic,copy)NSString *link;
/**
 *  跳转到指定的模块
 */
@property(nonatomic,copy)NSString *res_name;
/**
 *  指定模块下的详情ID
 */
@property(nonatomic,copy)NSString *res_id;

@end


#pragma mark -- GroupList属性声明
@protocol DSGroupModel;

@interface DSGroupList : JSONModel

@property(nonatomic,strong) NSArray <DSGroupModel> *list;

@end

#pragma mark - GroupModel属性声明

@interface DSGroupModel : JSONModel

/**
 * 焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  焦点图标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;

@end


/*
 {
 famous =     {
 list =         (
 {
 cover = "http://www.qd-life.com/static/upload/2015/04/09/index_20150409153830000000_1_92289_57.jpg";
 distance = 21km;
 id = 3225;
 intro = "\U4e00\U5bb6\U7279\U8272\U70d8\U7119\U8fde\U9501\U4f01\U4e1a\Uff0c\U4e3b\U8425\U4e1a\U52a1...";
 name = "\U9ea6\U4e50\U6ecb\U86cb\U7cd5\U5e97";
 score = 0;
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/04/08/index_20150408153820000000_1_98894_50.jpg";
 distance = 38km;
 id = 3169;
 intro = "\U5e97\U5185\U73af\U5883\U5e72\U51c0\U6574\U6d01\Uff0c\U4ef7\U683c\U5b9e\U60e0\Uff0c\U5473...";
 name = "\U857e\U68ee\U5c45\U7f8e\U98df\U57ce";
 score = 0;
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/04/03/index_20150403135622000000_1_109155_62.jpg";
 distance = 38km;
 id = 3083;
 intro = "\U4ee5\U5241\U8fa3\U6912\U7684\U201c\U54b8\U201d\U548c\U201c\U8fa3\U201d\U6c81\U5165\U9c7c...";
 name = "\U6e14\U7c73\U4e4b\U6e58\U65b0\U6982";
 score = 0;
 },
 {
 cover = "http://www.qd-life.com/static/upload/2014/12/26/index_20141226104752000000_1_895455_62.jpg";
 distance = 5km;
 id = 46;
 intro = "\U4e3b\U8981\U7ecf\U8425\U7279\U8272\U79d8\U5236\U70e4\U8089\Uff0c\U72ec\U5bb6\U79d8\U65b9...";
 name = "\U96c5\U535a\U6e21\U8089\U4e32\U738b";
 score = 0;
 }
 );
 };

 guess =     {
 list =         (
 {
 cover = "http://www.qd-life.com/static/upload/2015/06/23/index_20150623103654000000_1_52741_43.jpg";
 id = 217;
 intro = "\U9ed1\U849c\U539f\U4ef7106\U5143/\U6876\Uff0c\U73b0\U4ef788\U5143/\U6876\U3002";
 price = "88.00";
 title = "\U65b0\U519c\U76df\U9ed1\U849c";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/05/07/index_20150507124255000000_1_55342_99.jpg";
 id = 170;
 intro = "\U539f\U4ef742\U5143/200g\Uff0c\U73b0\U4ef7\U53ea\U970014.8\U5143\Uff0c\U8fd8\U7b49\U4ec0\U4e48\Uff0c\U901f\U901f\U62a2\U8d2d\U5427\Uff01";
 price = "14.80";
 title = "\U70ad\U70e4\U9c7f\U9c7c\U8db3\U7247";
 },
 {
 cover = "http://www.qd-life.com/static/upload/2015/03/17/index_20150317110153000000_1_51555_49.jpg";
 id = 89;
 intro = "\U56e2\U8d2d\U4ef7\U683c\Uff1a300\U5143/\U7bb1\Uff08\U6bcf\U7bb130\U4e2a\Uff09 ";
 price = "300.00";
 title = "\U83f2\U7f8e\U679c\U56ed-\U725b\U6cb9\U679c";
 }
 );
 };
 status = success;
 }
 */
