
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：RequestDataMessage
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：请求数据基类
//-------------------------------

#import "RequestDataMessage.h"

@implementation RequestDataMessage

@synthesize delegate,requestTag,conditionData,responseClass;

/**
 @method 异步请求
 @param path 接口路径
 @param condition 条件
 @return 无
 */
-(void)asyRequestServer:(NSString *)path withSearchData:(NSString *)condition
{
    //交互URL
    NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    asiRequest = [ASIFormDataRequest requestWithURL:url];
    [asiRequest setTimeOutSeconds:60.0];
    [asiRequest setDelegate:self];
    
    //设置请求的服务器URL
    [asiRequest setRequestMethod:@"POST"];
    [asiRequest setPostFormat:ASIMultipartFormDataPostFormat];
    [asiRequest addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];
    [asiRequest setPostBody:(NSMutableData *)[condition dataUsingEncoding:NSUTF8StringEncoding]];
    [asiRequest setURL:url];
    
    //开始异步请求
    [asiRequest startAsynchronous];
}

#pragma mark - 请求响应完成返回数据
- (void)requestFinished:(ASIHTTPRequest *)request
{
    if (delegate && [delegate respondsToSelector:@selector(responseFinishLoad:withRequestDataMessage:)])
    {
        [delegate responseFinishLoad:[request responseString] withRequestDataMessage:self];
    }
}

#pragma mark - 请求超时
- (void)requestFailed:(ASIHTTPRequest *)request
{
    if (delegate && [delegate respondsToSelector:@selector(responseFail:withRequestDataMessage:)])
    {
        [delegate responseFail:TimeOut withRequestDataMessage:self];
    }
}

-(void)dealloc
{
    if (asiRequest)
    {
        asiRequest.delegate = nil;
    }
}

@end
