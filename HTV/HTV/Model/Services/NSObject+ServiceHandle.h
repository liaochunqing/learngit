
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+ServiceHandle
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：业务类辅助封装
//-------------------------------

#import <Foundation/Foundation.h>

@interface NSObject (ServiceHandle)

/**
 @method 请求URL业务处理，根据枚举返回请求URL
 @param 接口分类
 @return 接口分类对应的url
 */
-(NSString *)requestURLHandle:(ResponseClass)responseClass;

/**
 @method 本地数据业务处理，根据枚举
 @param responseClass 接口枚举
 @param data 请求参数Json串
 @return 本地信息数组
 */
-(NSArray *)localDataHandle:(ResponseClass)responseClass withParam:(NSString *)data;

/**
 @method 在线数据业务处理，根据枚举
 @param responseClass 接口枚举
 @param data 请求参数Json串
 @param root 接口响应数据字典
 @return 处理后的信息数组
 */
-(NSMutableArray *)onlineDataHandle:(ResponseClass)responseClass 
                          withParam:(NSString *)data 
                    withReceiveData:(NSDictionary *)root;

@end
