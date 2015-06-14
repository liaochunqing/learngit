
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+ServiceHandle
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：业务类辅助封装
//-------------------------------

#import "NSObject+ServiceHandle.h"
#import "NSObject+OperatorData.h"

@implementation NSObject (ServiceHandle)

/**
 @method 请求URL业务处理，根据枚举返回请求URL
 @param 接口分类
 @return 接口分类对应的url
 */
-(NSString *)requestURLHandle:(ResponseClass)responseClass
{
    NSString *path;
    switch (responseClass)
    {
        case Focus:
            path  = FocusURL;
            break;
        case HomeCategory:
            path  = HomeCategoryURL;
            break;
        case HomeList:
            path = HomeListURL;
            break;
        case QueryDish:
            path  = QueryDishURL;
            break;
        case Hotel:
            path = HotelURL;
            break;
        case Order:
            path = OrderURL;
            break;
        case CityNav:
            path = CityNavURL;
            break;
        case OrderManage:
            path = OrderManageURL;
            break;
        case Suggest:
            path = SuggestURL;
            break;
        case About:
            path = AboutURL;
            break;
        case Help:
            path = HelpURL;
            break;
        case NewHotel:
            path = NewHotelURL;
            break;
    }
    return path;
}

/**
 @method 本地数据业务处理，根据枚举
 @param responseClass 接口枚举
 @param data 请求参数Json串
 @return 本地信息数组
 */
-(NSArray *)localDataHandle:(ResponseClass)responseClass withParam:(NSString *)data
{
    NSArray *dataArr = nil;
    switch (responseClass)
    {
        case Focus:
        {
            //读取数据
            dataArr = [self readArchiverArrayData:Focus withType:0 withUID:0 withHotelType:0];
            break;
        }
        case HomeCategory:
        {
            //读取数据
            dataArr = [self readArchiverArrayData:HomeCategory withType:0 withUID:0 withHotelType:0];
            break;
        }
        case HomeList:
        {
            //读取数据
            dataArr = [self readArchiverArrayData:HomeList withType:0 withUID:0 withHotelType:0];
            break;
        }
        case QueryDish:
        {
            //读取数据
            NSDictionary *parse = [data JSONValue];
            dataArr = [self readArchiverArrayData:QueryDish
                                         withType:0 
                                          withUID:[[parse objectForKey:@"a"] intValue] 
                                    withHotelType:0];
            break;
        }
        case Hotel:
        {
            //读取数据
            NSDictionary *parse = [data JSONValue];
            dataArr = [self readArchiverArrayData:Hotel 
                                         withType:0 
                                          withUID:0
                                    withHotelType:[[parse objectForKey:@"a"] intValue]];
            break;
        }
        case Order:
            break;
        case CityNav:
        {
            //读取数据
            NSDictionary *parse = [data JSONValue];
            dataArr = [self readArchiverArrayData:CityNav 
                                         withType:[[parse objectForKey:@"a"] intValue]
                                          withUID:0 
                                    withHotelType:0];
            break;
        }
        case OrderManage:
            break;
        case Suggest:
            break;
        case About:
        {
            //读取数据
            dataArr = [self readArchiverArrayData:About withType:0 withUID:0 withHotelType:0];
            break;
        }
        case Help:
        {
            //读取数据
            dataArr = [self readArchiverArrayData:Help withType:0 withUID:0 withHotelType:0];
            break;
        }
        case NewHotel:
        {
            //读取数据
            NSDictionary *parse = [data JSONValue];
            dataArr = [self readArchiverArrayData:NewHotel
                                         withType:0
                                          withUID:0
                                    withHotelType:[[parse objectForKey:@"a"] intValue]];
            break;
        }
    }
    return dataArr;
}

/**
 @method 在线数据业务处理，根据枚举
 @param responseClass 接口枚举
 @param data 请求参数Json串
 @param root 接口响应数据字典
 @return 处理后的信息数组
 */
-(NSMutableArray *)onlineDataHandle:(ResponseClass)responseClass
                          withParam:(NSString *)data
                    withReceiveData:(NSDictionary *)root
{
    //验证数据字段类型
    NSMutableArray *dataArr = nil;
    if (![[root objectForKey:@"a"] isKindOfClass:[NSDictionary class]] &&
        ![[root objectForKey:@"a"] isKindOfClass:[NSMutableArray class]])
    {
        return dataArr;
    }
    
    //根据接口分类处理数据
    switch (responseClass)
    {
        case Focus:
        {
            dataArr = [self focusHandle:root];
            //保存数据
            [self saveArchiverArrayData:Focus withData:dataArr withType:0 withUID:0 withHotelType:0];
            break;
        }
        case HomeCategory:
        {
            dataArr = [self homecategoryHandle:root];
            //保存数据
            [self saveArchiverArrayData:HomeCategory withData:dataArr withType:0 withUID:0 withHotelType:0];
            break;
        }
        case HomeList:
        {
            dataArr = [self homeListHandle:root];
            NSDictionary *parse = [data JSONValue];
            if ([[parse objectForKey:@"page"] intValue] == 1)
            {
                //保存数据
                [self saveArchiverArrayData:HomeList withData:dataArr withType:0 withUID:0 withHotelType:0];
            }
            break;
        }
        case QueryDish:
        {
            dataArr = [self queryDishHandle:root];
            //保存数据
            NSDictionary *parse = [data JSONValue];
            [self saveArchiverArrayData:QueryDish
                               withData:dataArr
                               withType:0 
                                withUID:[[parse objectForKey:@"a"] intValue] 
                          withHotelType:0];
            break;
        }
        case Hotel:
        {
            dataArr = [self hotelHandle:root];
            //保存数据
            NSDictionary *parse = [data JSONValue];
            [self saveArchiverArrayData:Hotel 
                               withData:dataArr 
                               withType:0
                                withUID:0 
                          withHotelType:[[parse objectForKey:@"a"] intValue] ];
            break;
        }
        case Order:
        {
            dataArr = [self orderHandle:root];
            break;
        }
        case CityNav:
        {
            dataArr = [self cityNavHandle:root];
            //保存数据
            NSDictionary *parse = [data JSONValue];
            [self saveArchiverArrayData:CityNav 
                               withData:dataArr 
                               withType:[[parse objectForKey:@"a"] intValue]
                                withUID:0 
                          withHotelType:0];
            break;
        }
        case OrderManage:
        {
            dataArr = [self orderQueryHandle:root];
            break;
        }
        case Suggest:
        {
            break;
        }
        case About:
        {
            dataArr = [self aboutHandle:root];
            //保存数据
            [self saveArchiverArrayData:About withData:dataArr withType:0 withUID:0 withHotelType:0];
            break;
        }
        case Help:
        {
            dataArr = [self helpHandle:root];
            //保存数据
            [self saveArchiverArrayData:Help withData:dataArr withType:0 withUID:0 withHotelType:0];
            break;
        }
        case NewHotel:
        {
            dataArr = [self hotelHandle:root];
            //保存数据
            NSDictionary *parse = [data JSONValue];
            [self saveArchiverArrayData:NewHotel
                               withData:dataArr
                               withType:0
                                withUID:0
                          withHotelType:[[parse objectForKey:@"a"] intValue] ];
            break;
        }
    }
    return dataArr;
}

@end
