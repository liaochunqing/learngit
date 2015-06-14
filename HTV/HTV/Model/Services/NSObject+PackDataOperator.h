
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+PackDataOperator
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：打包封装Json参数包类
//-------------------------------

#import <Foundation/Foundation.h>
#import "OrderEntity.h"
#import "SuggestEntity.h"

@interface NSObject (PackDataOperator)

/**
 @biref 首页焦点图
 */
-(NSString *)focusPackData;

/**
 @biref 首页分类
 */
-(NSString *)homeCategoryPackData;

/**
 @biref 首页列表
 @param type 1.餐饮展示，2.会议及宴会，3. 休闲娱乐，4.V优惠，5.V快讯
 @param pages 当前页
 */
-(NSString *)homeListPackData:(int)type withCurrentPage:(int)pages;

/**
 @biref 查看菜品
 @param uid 餐饮展示唯一标识UID
 */
-(NSString *)queryDishPackData:(int)uid;

/**
 @biref 酒店预定
 */
-(NSString *)hotelPackData;

/**
 @biref 新酒店预定
 */
-(NSString *)newHotelPackData:(NSString*)checkInTime
                 checkEndTime:(NSString*)checkEndTime
                      roomNum:(int)num;

/**
 @biref 客房预定
 @param order 客房预定
 */
-(NSString *)orderPackData:(OrderEntity *)order;

/**
 @biref 订单查询
 */
-(NSString *)orderQueryPackData:(NSString *)orderID;

/**
 @biref 城市导航
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食
 */
-(NSString *)cityNavPackData:(int)type;

/**
 @biref 意见反馈
 @param order 客房预定
 */
-(NSString *)suggestPackData:(SuggestEntity *)suggest;

/**
 @biref 关于我们
 */
-(NSString *)aboutPackData;

/**
 @biref 帮助
 */
-(NSString *)helpPackData;


@end
