//
//  NetImageView.h
//  ASILoaderDemo
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

typedef enum{
	imageViewStateLoading = 0,//正在下载
	imageViewStateLoadDone = 1,//加载成功
	imageViewStateLoadFailed = 2,//加载失败
	imageViewStateUnload = 3//未加载
}imageViewState;//图片加载状态

@protocol NetImageViewDelegate;
@interface NetImageView : UIImageView <ASIHTTPRequestDelegate>
{
    BOOL                                    _isLoading;
    NSString                                *_imageURL;
    UIActivityIndicatorView					*_lodingView;
    id<NetImageViewDelegate>                __weak _delegate;
    NSInteger								_state;
    ASIHTTPRequest                          *_request;
    
    NSString                                *_originImgURL;
}
@property (nonatomic,copy) NSString                     *imageURL;
@property (nonatomic,strong) UIActivityIndicatorView    *loadingView;
@property (nonatomic,weak)id<NetImageViewDelegate>    delegate;
@property (nonatomic,readonly)NSInteger                 state;
@property (nonatomic,strong) ASIHTTPRequest             *request;
@property (nonatomic, strong)  NSString                 *originImgURL;

- (id)initWithImageURL:(NSString *)URL;
-(void)buildLoadingView; 
@end


//图片加载完成后的delegate
@protocol NetImageViewDelegate <NSObject>

@optional
-(void)loadImageFinish; 
-(void)loadImageFinishWithSelf:(NetImageView*)netImageVeiw;

@end
