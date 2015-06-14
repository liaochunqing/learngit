
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：RequestServer
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：服务端接口类
//-------------------------------

#import <Foundation/Foundation.h>
#import "ServiceConstants.h"
#import "RequestDataMessage.h"
#import "SBJson.h"
#import "NSObject+OperatorDataArchive.h"

@protocol RequestServerDelegate <NSObject>

@optional
/**
 @method 接口响应完成的方法
 @param dataData 返回的数据 
 @param tag 返回的请求tag
 @return 无
 */
-(void)responseSuccess:(NSArray *)dataData 
               withTag:(NSInteger)tag;

/**
 @method 接口响应失败（请求失败，请求异常，请求超时）
 @param type 异常类型
 @param tag 返回的请求tag
 @return 无
 */
-(void)responseState:(ExceptionType)exceptionType 
            withTag:(int)tag;

@end

@interface RequestServer : NSObject<RequestDataMessageDelegate>
{
    NSMutableArray *_queueArray;
}

@property(nonatomic, weak)id<RequestServerDelegate> delegate;

/**
 @biref 请求接口
 @param responseClass 接口分类
 @param data 接口参数
 @param tag 请求标记
 @return 无
 */
-(void)requestServer:(ResponseClass)responseClass
           withParam:(NSString *)data
             withTag:(NSInteger)tag;

@end
