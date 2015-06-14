
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+OperatorDataArchive
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：读取归档，保存归档
//-------------------------------

#import "FocusEntity.h"
#import "HomeListEntity.h"
#import "QueryDishEntity.h"
#import "HotelEntity.h"
#import "CityNavEntity.h"
#import "HelpEntity.h"
#import "AboutEntity.h"
#import "HomeCategoryEntity.h"
#import "ServiceConstants.h"

@interface NSObject (OperatorDataArchive)

/**
 @method 读取归档数据
 @param responseClass 接口分类
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食 － 城市导航
 @param uid 餐饮展示唯一标识UID － 查看菜品
 @param hotelType 1.房客，2.公寓 － 酒店预定
 @result 归档数据
 */
-(id)readArchiverArrayData:(ResponseClass)responseClass
                  withType:(int)type
                   withUID:(int)uid
             withHotelType:(int)hotelType;

/**
 @brief 保存归档数据
 @param responseClass 类
 @param data 数组实体数组
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食(城市导航)
 @param uid 餐饮展示唯一标识UID(查看菜品)
 @param hotelType 1.房客，2.公寓(酒店预定)
 @result 归档数据
 */
-(void)saveArchiverArrayData:(ResponseClass)responseClass 
                    withData:(NSMutableArray *)data 
                    withType:(int)type 
                     withUID:(int)uid 
               withHotelType:(int)hotelType;

@end
