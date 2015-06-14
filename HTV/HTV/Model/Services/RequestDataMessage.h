
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：RequestDataMessage
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：请求数据基类
//-------------------------------

#import <Foundation/Foundation.h>
#import "ServiceConstants.h"
#import "ASIFormDataRequest.h"
@class RequestDataMessage;

@protocol RequestDataMessageDelegate <NSObject>

@optional

/**
 @method 请求接口响应完成加载的方法
 @param receiveDatas 请求返回的数据 
 @param requestDataMessage 当前请求对象
 @return 无
 */
-(void)responseFinishLoad:(NSString *)receiveDatas withRequestDataMessage:(RequestDataMessage *)requestDataMessage;

/**
 @method 响应失败：请求失败，请求异常，请求超时
 @param type 异常类型
 @param requestDataMessage 当前请求对象
 @return 无
 */
-(void)responseFail:(ExceptionType)exceptionType withRequestDataMessage:(RequestDataMessage *)requestDataMessage;
@end

@interface RequestDataMessage : NSObject<ASIHTTPRequestDelegate>
{
    ASIFormDataRequest *asiRequest;
}

@property(nonatomic, weak) id<RequestDataMessageDelegate> delegate;
@property(nonatomic, assign) int requestTag; //请求的tag
@property(nonatomic, assign) ResponseClass responseClass; //请求的接口分类
@property(nonatomic, strong) NSString *conditionData; //请求的条件值

/**
 @method 异步请求
 @param path 接口路径
 @param condition 条件
 @return 无
 */
-(void)asyRequestServer:(NSString *)path withSearchData:(NSString *)condition;

@end
