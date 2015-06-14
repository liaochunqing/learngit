
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+OperatorData
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：数据解析操作

#import <Foundation/Foundation.h>

@interface NSObject (OperatorData)

/**
 @biref 首页焦点图
 */
-(NSMutableArray *)focusHandle:(NSDictionary *)root;

/**
 @biref 首页分类
 */
-(NSMutableArray *)homecategoryHandle:(NSDictionary *)root;

/**
 @biref 首页列表
 */
-(NSMutableArray *)homeListHandle:(NSDictionary *)root;

/**
 @biref 查看菜品
 */
-(NSMutableArray *)queryDishHandle:(NSDictionary *)root;

/**
 @biref 酒店预定
 */
-(NSMutableArray *)hotelHandle:(NSDictionary *)root;

/**
 @biref 客房预定
 */
-(NSMutableArray *)orderHandle:(NSDictionary *)root;

/**
 @biref 订单查询
 */
-(NSMutableArray *)orderQueryHandle:(NSDictionary *)root;

/**
 @biref 城市导航
 */
-(NSMutableArray *)cityNavHandle:(NSDictionary *)root;

/**
 @biref 关于我们
 */
-(NSMutableArray *)aboutHandle:(NSDictionary *)root;

/**
 @biref 帮助
 */
-(NSMutableArray *)helpHandle:(NSDictionary *)root;

@end
