
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：RequestServer
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：服务端接口类
//-------------------------------

#import "RequestServer.h"
#import "WatchDog.h"
#import "NSObject+ServiceHandle.h"
#import "NSObject+OperatorData.h"

@implementation RequestServer

@synthesize delegate;

/**
 @biref 请求接口
 @param responseClass 接口分类
 @param data 接口参数
 @param tag 请求标记
 @return 无
 */
-(void)requestServer:(ResponseClass)responseClass
           withParam:(NSString *)data
             withTag:(NSInteger)tag
{
    //判断网络是否存在
    if ([[WatchDog luckDog] haveNetWork])
    {
        NSString *path = [self requestURLHandle:responseClass];
        RequestDataMessage *dataMessage = [[RequestDataMessage alloc] init];
        [dataMessage asyRequestServer:path withSearchData:data];
        dataMessage.requestTag = tag;
        dataMessage.responseClass = responseClass;
        dataMessage.conditionData = data;
        dataMessage.delegate = self;
        
        if (!_queueArray)
        {
            _queueArray = [[NSMutableArray alloc] init];
        }
        
        [_queueArray addObject:dataMessage];
    }
    else
    {
        //读取本地数据
        NSArray *dataArr = [self localDataHandle:responseClass withParam:data];
        if (delegate && [delegate respondsToSelector:@selector(responseSuccess:withTag:)])
        {
            [delegate responseSuccess:dataArr withTag:tag];
        }
    }
}

#pragma mark - RequestDataMessageDelegate
/**
 @method 响应失败：请求失败，请求异常，请求超时
 @param type 异常类型
 @param requestDataMessage 当前请求对象
 @return 无
 */
-(void)responseFail:(ExceptionType)exceptionType withRequestDataMessage:(RequestDataMessage *)requestDataMessage
{
    //数据异常
    if (delegate && [delegate respondsToSelector:@selector(responseState:withTag:)])
    {
        [delegate responseState:RequestException withTag:requestDataMessage.requestTag];
    }
    if (_queueArray && [_queueArray containsObject:requestDataMessage])
    {
        [_queueArray removeObject:requestDataMessage];
    }
}

/**
 @method 请求接口响应完成加载的方法
 @param receiveDatas 请求返回的数据
 @param requestDataMessage 当前请求对象
 @return 无
 */
-(void)responseFinishLoad:(NSString *)receiveDatas withRequestDataMessage:(RequestDataMessage *)requestDataMessage
{
    //返回数据验证
    NSDictionary *root;
    if (![receiveDatas isEqualToString:@""])
    {
        root = [receiveDatas JSONValue];
    }
    else
    {
        //数据异常
        if (delegate && [delegate respondsToSelector:@selector(responseState:withTag:)])
        {
            [delegate responseState:RequestException withTag:requestDataMessage.requestTag];
        }
        
        if (_queueArray && [_queueArray containsObject:requestDataMessage])
        {
            [_queueArray removeObject:requestDataMessage];
        }
        return;
    }
    
    //返回数据类型验证
    if([[[root objectForKey:@"z"] objectForKey:@"a"] intValue] != 200)
    {
        //数据异常
        if (delegate && [delegate respondsToSelector:@selector(responseState:withTag:)])
        {
            [delegate responseState:RequestException withTag:requestDataMessage.requestTag];
        }
        
        if (_queueArray && [_queueArray containsObject:requestDataMessage])
        {
            [_queueArray removeObject:requestDataMessage];
        }
        return;
    }
    
    //返回的数据验证成功
    if (delegate && [delegate respondsToSelector:@selector(responseState:withTag:)])
    {
        [delegate responseState:RequestSuccess withTag:requestDataMessage.requestTag];
    }
    
    //处理网络返回数据
    NSMutableArray *arr  = [self onlineDataHandle:requestDataMessage.responseClass 
                                        withParam:requestDataMessage.conditionData
                                  withReceiveData:root];
    
    //返回处理后的网络数据
    if (delegate && [delegate respondsToSelector:@selector(responseSuccess:withTag:)])
    {
        [delegate responseSuccess:arr withTag:requestDataMessage.requestTag];
    }
    
    if (_queueArray && [_queueArray containsObject:requestDataMessage])
    {
        [_queueArray removeObject:requestDataMessage];
    }
}

@end
