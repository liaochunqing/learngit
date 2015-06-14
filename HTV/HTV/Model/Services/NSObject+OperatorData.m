
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+OperatorData
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：数据解析操作
//-------------------------------

#import "NSObject+OperatorData.h"
#import "FocusEntity.h"
#import "HomeListEntity.h"
#import "QueryDishEntity.h"
#import "HotelEntity.h"
#import "OrderManageEntity.h"
#import "CityNavEntity.h"
#import "AboutEntity.h"
#import "HomeCategoryEntity.h"
#import "HelpEntity.h"

@implementation NSObject (OperatorData)

/**
 @method 首页焦点图
 */
-(NSMutableArray *)focusHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        for(NSDictionary *dic in [root objectForKey:@"a"])
        {
            FocusEntity *focus = [[FocusEntity alloc] init];
            focus.img = [dic objectForKey:@"b"];
            focus.language = [[dic objectForKey:@"c"] intValue];
            focus.describe = [dic objectForKey:@"d"];
            focus.title = [dic objectForKey:@"e"];
            [arr addObject:focus];
        }
    }
    return arr;
}

/**
 @method 首页分类
 */
-(NSMutableArray *)homecategoryHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        for(NSDictionary *dic in [root objectForKey:@"a"])
        {
            HomeCategoryEntity *homecategory = [[HomeCategoryEntity alloc] init];
            homecategory.uid = [[dic objectForKey:@"b"] intValue];
            homecategory.title = [dic objectForKey:@"c"];
            homecategory.language = [[dic objectForKey:@"d"] intValue];
            [arr addObject:homecategory];
        }
    }
    return arr;
}

/**
 @method 首页列表
 */
-(NSMutableArray *)homeListHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        for(NSDictionary *dic in [root objectForKey:@"a"])
        {
            HomeListEntity *home = [[HomeListEntity alloc] init];
            home.uid = [[dic objectForKey:@"b"] intValue];
            home.title = [dic objectForKey:@"c"];
            home.icon = [dic objectForKey:@"d"];
            home.brief = [dic objectForKey:@"e"];
            home.img = [dic objectForKey:@"f"];
            home.phone = [dic objectForKey:@"g"];
            home.detail = [dic objectForKey:@"h"];
            home.type = [[dic objectForKey:@"i"] intValue];
            home.language = [[dic objectForKey:@"j"] intValue];
            home.validate = [dic objectForKey:@"k"];
            home.date = [dic objectForKey:@"l"];
            home.address = [dic objectForKey:@"m"];
            home.url = [dic objectForKey:@"n"];
            [arr addObject:home];
        }
    }
    return arr;
}

/**
 @method 查看菜品
 */
-(NSMutableArray *)queryDishHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        for (NSDictionary *dic in [root objectForKey:@"a"])
        {
            QueryDishEntity *dish = [[QueryDishEntity alloc] init];
            dish.uid = [[dic objectForKey:@"b"] intValue];
            dish.name = [dic objectForKey:@"c"];
            dish.icon = [dic objectForKey:@"d"];
            dish.img = [dic objectForKey:@"e"];
            dish.detail = [dic objectForKey:@"f"];
            dish.language = [[dic objectForKey:@"g"] intValue];
            [arr addObject:dish];
        }
    }
    return arr;
}

/**
 @method 酒店预定
 */
-(NSMutableArray *)hotelHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if ([[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        for (NSDictionary *dic in [root objectForKey:@"a"])
        {
            if (!dic || [dic isKindOfClass:[NSNull class]])
            {
                continue;
            }
            
            //
            HotelEntity *hotel = [[HotelEntity alloc] init];
            hotel.uid = [[dic objectForKey:@"b"] intValue];
            hotel.hotelCode = [dic objectForKey:@"c"];
            hotel.apiAccount = [dic objectForKey:@"d"];
            hotel.channel = [dic objectForKey:@"e"];
            hotel.supplyCode = [dic objectForKey:@"f"];
            hotel.roomCode = [dic objectForKey:@"g"];
            hotel.title = [dic objectForKey:@"h"];
            hotel.amounts = [[dic objectForKey:@"i"] intValue];
            hotel.beds = [[dic objectForKey:@"j"] intValue];
            hotel.area = [[dic objectForKey:@"k"] intValue];
            
            if ([[dic objectForKey:@"l"] isKindOfClass:[NSString class]])
            {
                hotel.yhPrice =[dic objectForKey:@"l"];
            }
            else
            {
                hotel.yhPrice =@"";
            }
            
            if ([[dic objectForKey:@"m"] isKindOfClass:[NSString class]])
            {
                hotel.msPrice =[dic objectForKey:@"m"];
            }
            else
            {
                hotel.msPrice =@"";
            }
            
            if ([[dic objectForKey:@"n"] isKindOfClass:[NSString class]])
            {
                hotel.skPrice =[dic objectForKey:@"n"];
            }
            else
            {
                hotel.skPrice =@"";
            }
            
            hotel.phone =[dic objectForKey:@"o"];
            
            if ([[dic objectForKey:@"p"] isKindOfClass:[NSString class]])
            {
                hotel.imgs =[dic objectForKey:@"p"];
            }
            else
            {
                hotel.imgs =@"";
            }
            
            hotel.broadband =[dic objectForKey:@"q"];
            hotel.roomType =[dic objectForKey:@"r"];
            hotel.icon =[dic objectForKey:@"s"];
            hotel.detail =[dic objectForKey:@"t"];
            hotel.language = GetCurrentLanguage;
            
            //
            if ([dic objectForKey:@"u"])
            {
                hotel.checkInTime = [dic objectForKey:@"u"];
            }
            
            if ([dic objectForKey:@"v"])
            {
                hotel.checkEndTime = [dic objectForKey:@"v"];
            }
            if ([dic objectForKey:@"w"])
            {
                hotel.roomNum = [[dic objectForKey:@"w"] intValue];
            }
            
            [arr addObject:hotel];
        }
    }
    
    return arr;
}

/**
 @method 客房预定
 */
-(NSMutableArray *)orderHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDictionary* dic=[root objectForKey:@"a"];
    [arr addObject:[dic objectForKey:@"b"]];
    return arr;
}


/**
 @method 订单查询
 */
-(NSMutableArray *)orderQueryHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDictionary* dic=[root objectForKey:@"a"];
    OrderManageEntity *order = [[OrderManageEntity alloc] init];
    order.orderID = [dic objectForKey:@"b"];
    order.name = [dic objectForKey:@"c"];
    order.phone = [dic objectForKey:@"d"];
    order.checkInDate = [dic objectForKey:@"e"];
    order.checkOutDate = [dic objectForKey:@"f"];
    order.roomType = [dic objectForKey:@"g"];
    order.totalPrice = [[dic objectForKey:@"h"] floatValue];
    order.remark =[dic objectForKey:@"i"];
    order.rooms =[[dic objectForKey:@"j"] intValue];
    order.email =[dic objectForKey:@"k"];
    [arr addObject:order];
    return arr;
}

/**
 @method 城市导航
 */
-(NSMutableArray *)cityNavHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in [root objectForKey:@"a"])
    {
        CityNavEntity *cityNav = [[CityNavEntity alloc] init];
        cityNav.uid = [[dic objectForKey:@"b"] intValue];
        cityNav.title = [dic objectForKey:@"c"];
        cityNav.icon = [dic objectForKey:@"d"];
        cityNav.img= [dic objectForKey:@"e"];
        cityNav.detail = [dic objectForKey:@"f"];
        cityNav.type = [[dic objectForKey:@"g"] intValue];
        cityNav.language = [[dic objectForKey:@"h"] intValue];
        [arr addObject:cityNav];
    }
    return arr;
}

/**
 @method 关于我们
 */
-(NSMutableArray *)aboutHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDictionary* dic=[root objectForKey:@"a"];
    AboutEntity *about = [[AboutEntity alloc] init];
    about.uid = [[dic objectForKey:@"b"] intValue];
    about.phone = [dic objectForKey:@"c"];
    about.logoImg = [dic objectForKey:@"d"];
    about.img = [dic objectForKey:@"e"];
    about.detail = [dic objectForKey:@"f"];
    about.language = [[dic objectForKey:@"g"] intValue];
    [arr addObject:about];
    return arr;
}

/**
 @method 帮助
 */
-(NSMutableArray *)helpHandle:(NSDictionary *)root
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in [root objectForKey:@"a"])
    {
        HelpEntity *help = [[HelpEntity alloc] init];
        help.uid = [[dic objectForKey:@"b"] intValue];
        help.title = [dic objectForKey:@"c"];
        help.detail = [dic objectForKey:@"d"];
        help.language = [[dic objectForKey:@"e"] intValue];
        [arr addObject:help];
    }
    return arr;
}

@end
