//
//  NetImageView.m
//  ASILoaderDemo
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "NetImageView.h"
#import "ASIDownloadCacheNew.h"

@implementation NetImageView
@synthesize imageURL        = _imageURL;
@synthesize loadingView     = _lodingView;
@synthesize state           = _state;
@synthesize delegate        = _delegate;
@synthesize request         = _request;
@synthesize originImgURL    = _originImgURL;

-(void)dealloc
{
    self.imageURL = nil;
    [self.loadingView stopAnimating];
    self.delegate = nil;
    [self.request setDownloadCache:nil];
    [self.request clearDelegatesAndCancel];
}

- (id)init
{
    self = [super init];
	if (self) 
    {
        _isLoading = NO;
        _state = imageViewStateUnload;
        [self buildLoadingView];
	}
    
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _isLoading = NO;
        _state = imageViewStateUnload;
        [self buildLoadingView];
    }
    
    return  self;
}

- (id)initWithImageURL:(NSString *)URL
{
	self = [super init];
	if (self)
    {
        _isLoading = NO;
        _state = imageViewStateUnload;
        [self buildLoadingView];
        self.imageURL = URL;
	}
    
	return self;
}

-(void)buildLoadingView
{
    if (!self.loadingView)
    {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] 
                                                initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        loadingView.hidesWhenStopped = YES;
        self.loadingView = loadingView;
        [self addSubview:self.loadingView];
    }
    
    // 菊花的大小 (20, 20)
    CGRect rect = self.frame;
    self.loadingView.frame = CGRectMake((rect.size.width-20)/2, (rect.size.height-20)/2, 20, 20);
}

//实现_imageURL 的setter
- (void)setImageURL:(NSString *)URL
{
    [self buildLoadingView];
    
    if (_imageURL != URL)
    {
        _imageURL = URL;
        if (_imageURL) 
        {
            [self.loadingView startAnimating];
            
            BOOL loadImage = NO;
            NSURL *imageUrl = [NSURL URLWithString:URL];
            NSString *dataPath = [[ASIDownloadCacheNew sharedCache] cacheFilePath:imageUrl];
            NSFileManager *fileManager = [NSFileManager defaultManager];
            
            //判断图片文件是否存在
            if ([fileManager fileExistsAtPath:dataPath]) 
            {
                //如果存在就读取cache文件
                self.image = [UIImage imageWithContentsOfFile:dataPath];
                if (self.image)
                {
                    [self.loadingView stopAnimating];
                    _state = imageViewStateLoadDone;
                    loadImage = YES;
                    
                    if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinish)])
                    {
                        [self.delegate loadImageFinish];
                    }
                    
                    //
                    if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinishWithSelf:)])
                    {
                        [self.delegate loadImageFinishWithSelf:self];
                    }
                }
                else
                {
                    _state = imageViewStateLoadFailed;
                    loadImage = NO;
                }
            }
            
            //本地加载图片失败，从网络读取
            if (!loadImage)
            {
                //
                if (self.request)
                {
                    [self.request setDownloadCache:nil];
                    [self.request clearDelegatesAndCancel];
                    self.request = nil;
                }
                
                //
                ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:imageUrl];
                self.request = request;
                [request setDownloadCache:[ASIDownloadCache sharedCache]];
                [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
                request.delegate = self;
                [request startAsynchronous];
            }
        }
    }
    else
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinish)])
        {
            [self.delegate loadImageFinish];
        }
        
        //
        if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinishWithSelf:)])
        {
            [self.delegate loadImageFinishWithSelf:self];
        }
    }
}

#pragma mark - ASIHTTPRequestDelegate
-(void)requestStarted:(ASIHTTPRequest *)request
{
    [self.loadingView startAnimating];
    _state = imageViewStateLoading;
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    [self.loadingView stopAnimating];
    self.loadingView.hidden = YES;
    if ([request responseData])
    {
        [self setImage:[UIImage imageWithData:[request responseData]]];
        _state = imageViewStateLoadDone;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinish)])
        {
            [self.delegate loadImageFinish];
        }
        
        //
        if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinishWithSelf:)])
        {
            [self.delegate loadImageFinishWithSelf:self];
        }
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"NetImageView: 加载网络图片失败!!");
    [self.loadingView stopAnimating];
    _state = imageViewStateLoadFailed;
    if (self.delegate && [self.delegate respondsToSelector:@selector(loadImageFinish)])
    {
        [self.delegate loadImageFinish];
    }
}

@end
