//
//  SinaWeiBoVC.h
//  Ellassay_iphone
//
//  Created by donsonsz donson on 12-11-29.
//  Copyright (c) 2012年 donson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBSendView.h"
#import "UIViewExtend.h"

@protocol SinaWeiBoVCDelegate <NSObject>

-(void)didLogin;
-(void)didLogout;

@optional
-(void)cancelObserve;
-(void)observeFriendSuccess;

@end

@interface SinaWeiBoVC : UIViewController<WBEngineDelegate,WBSendViewDelegate>
{
    WBEngine* weiboEngine;
    NSString* strText;
    UIImage* imgTosend;
    UIActivityIndicatorView *indicatorView;
    
    BOOL bSendFlag;
    
    id <SinaWeiBoVCDelegate> __weak delegate;
}

@property (nonatomic,strong) NSString* strText;
@property (nonatomic,strong) UIImage* imgTosend;
@property (nonatomic,weak) id <SinaWeiBoVCDelegate> delegate;

/**
 @method:登陆新浪微博
 @param:无
 @return:无
 */
-(void)loginSinaWeiBo;

/**
 @method:登出新浪微博
 @param:无
 @return:无
 */
-(void)logoutSinaWeiBo;

/**
 @method:新浪微博是否已经登陆
 @param:无
 @return:无
 */
-(BOOL)isLogIn;

/**
 @method:新浪微博分享
 @param:分享的文字 分享的图片 － （也可只分享文字或图片，不分享的参数设置为nil）
 @return:无
 */
-(void)sendSinaWeiBoWithText:(NSString*)text image:(UIImage*)img;

/**
 @method:关注好友
 @param:好友名称 关注好友的uid
 @return:无
 */
-(void)observeFriend:(NSString*)strName uid:(int64_t)uid;

@end
