//
//  SinaWeiBoVC.m
//  Ellassay_iphone
//
//  Created by donsonsz donson on 12-11-29.
//  Copyright (c) 2012年 donson. All rights reserved.
//

#import "SinaWeiBoVC.h"
#import "AutoFadeWithLabel.h"

@interface SinaWeiBoVC ()

@end

@implementation SinaWeiBoVC

@synthesize strText,imgTosend,delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - ### 新浪微博分享处理方法 ###
/**
 @method:关注好友
 @param:好友名称 关注好友的uid
 @return:无
 */
-(void)observeFriend:(NSString*)strName uid:(int64_t)uid
{
    if ([weiboEngine isLoggedIn] && ![weiboEngine isAuthorizeExpired])
    {
        //添加关注
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:2];
        [params setValue:strName forKey:@"screen_name"];
        [params setValue:[NSString stringWithFormat:@"%lld",uid] forKey:@"uid"];
        
        [weiboEngine loadRequestWithMethodName:@"friendships/create.json"
                             httpMethod:@"POST"
                                 params:params
                           postDataType:kSinaWBRequestPostDataTypeNormal
                       httpHeaderFields:nil];
    }
    else
    {
        [self loginSinaWeiBo];
    }
}


-(id)init
{
    self=[super init];
    if (self) {
        [self initWithAppkey:kSinaSDKDemoAppKey appSecret:kSinaSDKDemoAppSecret redirectURI:KSinaRedirectURI];
        bSendFlag=NO;
    }
    return self;
}

-(void)initWithAppkey:(NSString*)appkey appSecret:(NSString*)secret redirectURI:(NSString*)uri
{
    weiboEngine=[[WBEngine alloc] initWithAppKey:appkey appSecret:secret];
    [weiboEngine setRootViewController:self];
    [weiboEngine setDelegate:self];
    [weiboEngine setRedirectURI:uri];
}

/**
 @method:登陆新浪微博
 @param:无
 @return:无
 */
-(void)loginSinaWeiBo
{
    if ([weiboEngine isLoggedIn] && ![weiboEngine isAuthorizeExpired])
    {
        [AutoFadeWithLabel labelWithString:@"你已经登陆了,请先登出"];
        return;
    }
    else
    {
        [weiboEngine logIn];
    }
}

/**
 @method:登出新浪微博
 @param:无
 @return:无
 */
-(void)logoutSinaWeiBo
{
    [weiboEngine logOut];
}

/**
 @method:新浪微博是否已经登陆
 @param:无
 @return:无
 */
-(BOOL)isLogIn
{
    return ([weiboEngine isLoggedIn] && ![weiboEngine isAuthorizeExpired]);
}

/**
 @method:新浪微博分享
 @param:分享的文字 分享的图片 － （也可只分享文字或图片，不分享的参数设置为nil）
 @return:无
 */
-(void)sendSinaWeiBoWithText:(NSString*)text image:(UIImage*)img
{
    if ([weiboEngine isLoggedIn] && ![weiboEngine isAuthorizeExpired])
    {
        WBSendView *sendView = [[WBSendView alloc] initWithAppKey:kSinaSDKDemoAppKey
                                                        appSecret:kSinaSDKDemoAppSecret
                                                             text:text
                                                            image:img];
        [sendView setDelegate:self];
        [sendView show:YES];
    }
    else
    {
        bSendFlag=YES;
        self.strText=text;
        self.imgTosend=img;
        [weiboEngine logIn];
    }
}

#pragma mark - WBEngineDelegate
- (void)engineAlreadyLoggedIn:(WBEngine *)engine
{
    [indicatorView stopAnimating];
    if ([engine isUserExclusive])
    {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
                                                           message:@"请先登出！" 
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定" 
                                                 otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)engineDidLogIn:(WBEngine *)engine
{
    if (bSendFlag)
    {
        bSendFlag=NO;
        WBSendView *sendView = [[WBSendView alloc] initWithAppKey:kSinaSDKDemoAppKey
                                                        appSecret:kSinaSDKDemoAppSecret
                                                             text:strText
                                                            image:imgTosend];
        [sendView setDelegate:self];
        [sendView show:YES];
    }
    
    //更多设置里面，绑定微博使用
    if ([self.delegate respondsToSelector:@selector(didLogin)])
    {
        [self.delegate didLogin];
    }
}

- (void)engineDidLogOut:(WBEngine *)engine
{
    //更多设置里面，接触绑定使用
    if ([self.delegate respondsToSelector:@selector(didLogout)])
    {
        [self.delegate didLogout];
    }
}

- (void)engine:(WBEngine *)engine didFailToLogInWithError:(NSError *)error
{
    [indicatorView stopAnimating];
    NSLog(@"didFailToLogInWithError: %@", error);
    if (GetCurrentLanguage)
    {
        [AutoFadeWithLabel labelWithString:@"登录失败"];
    }
    else
    {
        [AutoFadeWithLabel labelWithString:@"Login failed"];
    }
}

- (void)engineNotAuthorized:(WBEngine *)engine
{
    
}

- (void)engineAuthorizeExpired:(WBEngine *)engine
{
    if (GetCurrentLanguage)
    {
        [AutoFadeWithLabel labelWithString:@"授权过期,请重新登录"];
    }
    else
    {
        [AutoFadeWithLabel labelWithString:@"Authorization expired, please re-login"];
    }
}

- (void)engine:(WBEngine *)engine requestDidFailWithError:(NSError *)error
{
    
}

- (void)engine:(WBEngine *)engine requestDidSucceedWithResult:(id)result
{
    
}

#pragma mark - WBSendViewDelegate
- (void)sendViewDidFinishSending:(WBSendView *)view
{
    [view removeHUDActivityView];
    [view hide:YES];
    
    NSString* strMsg=nil;
    if (GetCurrentLanguage==1)
    {
        strMsg=@"微博发送成功";
    }
    else
    {
        strMsg=@"send successfully";
    }
    
    [AutoFadeWithLabel labelWithString:strMsg];
}

- (void)sendView:(WBSendView *)view didFailWithError:(NSError *)error
{
    [view removeHUDActivityView];
    NSLog(@"didFailWithError: %@", error);
    NSString* strMsg=[[error userInfo] valueForKey:@"error"];
    if ([[[error userInfo] valueForKey:@"error_code"] intValue]==20019)
    {
        if (GetCurrentLanguage==1)
        {
            strMsg=@"相同内容请间隔10分钟后再分享";
        }
        else
        {
            strMsg=@"repeat content,please send after 10 minutes";
        }
    }
    
    [view hide:YES];
    [AutoFadeWithLabel labelWithString:strMsg];
}

- (void)sendViewNotAuthorized:(WBSendView *)view
{
    [view hide:YES];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)sendViewAuthorizeExpired:(WBSendView *)view
{
    [view hide:YES];
    [self dismissViewControllerAnimated:YES completion:^{}];
}


#pragma mrak - 关注成功代理方法
- (void)engine:(WBEngine *)engine observeSuccess:(id)result
{
    if ([self.delegate respondsToSelector:@selector(observeFriendSuccess)])
    {
        [self.delegate observeFriendSuccess];
    }
}

@end
