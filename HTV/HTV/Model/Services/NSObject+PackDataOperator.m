
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+PackDataOperator
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：打包封装Json参数包类
//-------------------------------

#import "NSObject+PackDataOperator.h"

@implementation NSObject (PackDataOperator)

/**
 @method 首页焦点图
 */
-(NSString *)focusPackData
{
    return [NSString stringWithFormat:@"p={\"a\":%d}",GetCurrentLanguage];
}

/**
 @method 首页分类
 */
-(NSString *)homeCategoryPackData
{
    return [NSString stringWithFormat:@"p={\"a\":%d}",GetCurrentLanguage];
}

/**
 @method 首页列表
 @param type 1.餐饮展示，2.会议及宴会，3. 休闲娱乐，4.V优惠，5.V快讯
 @param pages 当前页
 */
-(NSString *)homeListPackData:(int)type withCurrentPage:(int)pages
{
    return [NSString stringWithFormat:@"p={\"type\":%d,\"language\":%d,\"page\":%d}",type,GetCurrentLanguage,pages];
}

/**
 @method 查看菜品
 @param uid 餐饮展示唯一标识UID
 */
-(NSString *)queryDishPackData:(int)uid
{
    return [NSString stringWithFormat:@"p={\"a\":%d,\"b\":%d}",uid,GetCurrentLanguage];
}

/**
 @method 酒店预定
 */
-(NSString *)hotelPackData
{
    if (GetCurrentLanguage == 0)
    {
        return [NSString stringWithFormat:@"p={\"a\":2}"];
    }
    else
    {
        return [NSString stringWithFormat:@"p={\"a\":%d}",GetCurrentLanguage];
    }
}

/**
 @method 新酒店预定
 */
-(NSString *)newHotelPackData:(NSString*)checkInTime
                 checkEndTime:(NSString*)checkEndTime
                      roomNum:(int)num
{
    if (GetCurrentLanguage == 0)
    {
        return [NSString stringWithFormat:@"p={\"a\":\"%@\",\"b\":\"%@\",\"c\":%d,\"d\":2}", checkInTime, checkEndTime, num];
    }
    else
    {
        return [NSString stringWithFormat:@"p={\"a\":\"%@\",\"b\":\"%@\",\"c\":%d,\"d\":%d}", checkInTime, checkEndTime, num, GetCurrentLanguage];
    }
}

/**
 @method 客房预定
 @param order 客房预定
 */
-(NSString *)orderPackData:(OrderEntity *)order
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:order.remark forKey:@"a"];
    [dic setObject:order.checkIn forKey:@"b"];
    [dic setObject:order.hotelCode forKey:@"c"];
    [dic setObject:order.apiAccount forKey:@"d"];
    [dic setObject:order.channel forKey:@"e"];
    [dic setObject:order.supplyCode forKey:@"f"];
    [dic setObject:order.priceCode forKey:@"g"];
    [dic setObject:order.roomCode forKey:@"h"];
    [dic setObject:order.checkOut forKey:@"i"];
    [dic setObject:order.name forKey:@"j"];
    [dic setObject:order.phone forKey:@"k"];
    [dic setObject:[NSNumber numberWithFloat:order.roomTotal] forKey:@"l"];
    [dic setObject:[NSNumber numberWithFloat:order.totalAll] forKey:@"m"];
    [dic setObject:[NSNumber numberWithInt:order.rooms] forKey:@"n"];
    [dic setObject:[NSNumber numberWithInt:order.amount] forKey:@"o"];
    [dic setObject:order.email forKey:@"p"];
    return [self generateParameter:dic];
}

/**
 @method 判断数据类型，拼装成Json格式
 */
-(NSString *)generateParameter:(NSDictionary *)dic
{
    //定义Json字符串
    NSMutableString *data = [[NSMutableString alloc] initWithString:@"p={"];
    int i = 0;
    NSArray *dataArray = [dic allKeys];
    for(NSString *key in dataArray)
    {
        i = i + 1;
        [data appendFormat:@"\""];
        [data appendString:key];
        [data appendFormat:@"\":"];
        id param = [dic objectForKey:key];
        if([param isKindOfClass:[NSString class]])
        {
            [data appendFormat:@"\""];
            [data appendString:param];
            [data appendFormat:@"\""];
        }
        
        if([param isKindOfClass:[NSNumber class]])
        {
            const char * pObjCType = [((NSNumber*)param) objCType];
            if (strcmp(pObjCType, @encode(int))  == 0)
            {
                [data appendString:[NSString stringWithFormat:@"%d",[param intValue]]];
            }
            if (strcmp(pObjCType, @encode(float)) == 0)
            {
                [data appendString:[NSString stringWithFormat:@"%.1f",[param floatValue]]];
            }
            if (strcmp(pObjCType, @encode(double))  == 0)
            {
                [data appendString:[NSString stringWithFormat:@"%f",[param doubleValue]]];
            }
            if (strcmp(pObjCType, @encode(BOOL)) == 0)
            {
                [data appendString:[NSString stringWithFormat:@"%i",[param boolValue]]];
            }
        }
        if (i != [dataArray count])
        {
            [data appendFormat:@","];
        }
    }
    
    [data appendFormat:@"}"]; 
    return data;
}

/**
 @method 订单查询
 */
-(NSString *)orderQueryPackData:(NSString *)orderID
{
    return [NSString stringWithFormat:@"p={\"a\":\"%@\"}",orderID];
}

/**
 @method 城市导航
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食
 */
-(NSString *)cityNavPackData:(int)type
{
    return [NSString stringWithFormat:@"p={\"a\":%d,\"b\":%d}",type,GetCurrentLanguage];
}

/**
 @method 客房预定
 @param order 客房预定
 */
-(NSString *)suggestPackData:(SuggestEntity *)suggest
{
    return [NSString stringWithFormat:@"p={\"a\":\"%@\",\"b\":\"%@\",\"c\":\"%@\",\"d\":%d}",suggest.name,
            suggest.phone,suggest.detail,suggest.language];
}

/**
 @method 关于我们
 */
-(NSString *)aboutPackData
{
    return [NSString stringWithFormat:@"p={\"a\":%d}",GetCurrentLanguage];
}

/**
 @method 帮助
 */
-(NSString *)helpPackData
{
    return [NSString stringWithFormat:@"p={\"a\":%d}",GetCurrentLanguage];
}

@end
