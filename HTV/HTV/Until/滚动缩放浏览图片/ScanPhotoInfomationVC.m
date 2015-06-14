//
//  ScanPhotoInfomationVC.m
//  LunBoDemo
//
//  Created by apple on 12-12-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ScanPhotoInfomationVC.h"
#import "LunBoEntity.h"

#define POPBGHEIGHT  30
#define ContentHeight 20
#define SPACE 10

static int totalHeight = (POPBGHEIGHT+SPACE+ContentHeight);

@interface ScanPhotoInfomationVC ()

@end

@implementation ScanPhotoInfomationVC

@synthesize images          = _images;
@synthesize scrollView      = _scrollView;
@synthesize popBG           = _popBG;
@synthesize numLab          = _numLab;
@synthesize content         = _content;
@synthesize contentBG       = _contentBG;
@synthesize direction       = _direction;
@synthesize entity          = _entity;
@synthesize sinaVC          = _sinaVC;


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
    //
    self.view.backgroundColor = [UIColor blackColor];
    self.view.frame = CGRectMake(0, 0, MainViewWidth, MainViewHeight);

    //
    [[self leftButton] setHidden:NO];
    [[self rightButton] setHidden:NO];
    
    //
    if (!self.scrollView)
    {
        UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,
                                                                                   self.view.frame.size.width,
                                                                                   self.view.frame.size.height)];
        aScrollView.backgroundColor = [UIColor clearColor];
        aScrollView.showsHorizontalScrollIndicator = NO;
        aScrollView.showsVerticalScrollIndicator = NO;
        aScrollView.pagingEnabled = YES;
        aScrollView.delegate = self;
        aScrollView.directionalLockEnabled = YES;
        aScrollView.bounces = YES;
        self.scrollView = aScrollView;
        [self.view addSubview:aScrollView];
        [self.view sendSubviewToBack:aScrollView];
        
        // 单击手势 用于显示/隐藏导航栏
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
        gesture.numberOfTapsRequired = 1;
        gesture.numberOfTouchesRequired = 1;
        [gesture addTarget:self action:@selector(scrollViewSingleTapped)];
        [self.scrollView addGestureRecognizer:gesture];
    }
    
    //
    if (!self.popBG)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-POPBGHEIGHT,
                                                                self.view.frame.size.width, totalHeight)];
        view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        self.popBG = view;
        [self.view addSubview:view];
        
        // qlzei 2013.03.06
        self.popBG.hidden = !_isShowTitle;
    }
    
    //
    if (!self.numLab)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.popBG.frame.size.width-50-4, 0, 50, 20)]; // 20
        label.backgroundColor = [UIColor clearColor];
        label.text = @"";
        label.textColor = [UIColor colorWithRed:170/255.0 green:162/255.0 blue:177/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentRight;
        label.numberOfLines = 1;
        label.font = YHFont(10);
        self.numLab = label;
        [self.popBG addSubview:label];
    }
    
    //
    if (!self.direction)
    {
        UIImageView *aImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                              self.numLab.frame.origin.y+
                                                                              self.numLab.frame.size.height,
                                                                              self.popBG.frame.size.width, 7)]; // 7
        aImgView.backgroundColor = [UIColor clearColor];
        aImgView.image = GETIMG(@"chengshifengguang_line_up.png");
        self.direction = aImgView;
        [self.popBG addSubview:aImgView];
    }
    
    if (!self.contentBG)
    {
        UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                                   self.direction.frame.origin.y+
                                                                                   self.direction.frame.size.height+SPACE,
                                                                                   self.popBG.frame.size.width, ContentHeight)];
        aScrollView.backgroundColor = [UIColor clearColor];
        aScrollView.showsHorizontalScrollIndicator = NO;
        aScrollView.showsVerticalScrollIndicator = NO;
        aScrollView.pagingEnabled = NO;
        aScrollView.directionalLockEnabled = YES;
        self.contentBG = aScrollView;
        [self.popBG addSubview:aScrollView];
    }
    
    //
    if (!self.content)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(6, 0,
                                                                   self.contentBG.frame.size.width-5*2,
                                                                   self.contentBG.frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"";
        label.textColor = [UIColor colorWithRed:170/255.0 green:162/255.0 blue:177/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentLeft;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        label.font = YHFont(10);
        self.content = label;
        [self.contentBG addSubview:label];
    }
    
    //
    if (self.images)
    {
        // qzlei 2013.03.06
        if (_isShowTitle)
        {
            if (_currentIndex < [self.images count])
            {
                [self setTitleString:[[self.images objectAtIndex:_currentIndex] title]];
            }
            else
            {
                if (GetCurrentLanguage)
                {
                    [self setTitleString:@"图片浏览"];
                }
                else
                {
                    [self setTitleString:@"Scan photo"];
                }
            }
            
            [self setData];
        }
        else
        {
            if (GetCurrentLanguage)
            {
                [self setTitleString:@"图片浏览"];
            }
            else
            {
                [self setTitleString:@"Scan photo"];
            }
            
            [self setDataWithImageURL];
        }
    }
    else
    {
        [self setTitleString:self.entity.title];
        [self setDataWithEntity:self.entity];
    }
    
    //
    self.popBG.frame = CGRectMake(0, self.view.frame.size.height-POPBGHEIGHT, self.view.frame.size.width, totalHeight);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Custom Methods
- (id)initWithInfomation:(NSArray*)images withIndex:(NSInteger)currentIdex showTitle:(BOOL)isShow
{
    self = [super init];
    if (self) {
        self.images = images;
        _currentIndex = currentIdex;
        self.entity = nil;
        _isShowTitle = isShow;
    }
    
    return self;
}

- (id)initWithInfomation:(CityNavEntity*)aEntity
{
    self = [super init];
    if (self) {
        self.entity = aEntity;
        self.images = nil;
        _currentIndex = 0;
        _isShowTitle = NO;
    }
    
    return self;
}

- (void)setData
{
    if (self.images && [self.images count])
    {
        CGFloat width = self.scrollView.frame.size.width;
        CGFloat height = self.scrollView.frame.size.height;
        
        for (NSInteger i = 0; i < [self.images count]; i++)
        {
            //
            UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
            aScrollView.backgroundColor = [UIColor clearColor];
            aScrollView.delegate = self;
            aScrollView.showsHorizontalScrollIndicator = NO;
            aScrollView.showsVerticalScrollIndicator = NO;
            aScrollView.maximumZoomScale = 2.0f;
            aScrollView.minimumZoomScale = 1.0f;
            aScrollView.zoomScale = 1.0f;
            [self.scrollView addSubview:aScrollView];
            
            //
            LunBoEntity *aEntity = [self.images objectAtIndex:i];
            NetImageView *aView = [[NetImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
            aView.delegate = self;
            aView.image = GETIMG(@"tupian_lunbo.png");
            [aScrollView addSubview:aView];
            aView.imageURL = aEntity.image;
        }
        
        //
        self.scrollView.contentOffset = CGPointMake(_currentIndex*width, 0);
        self.scrollView.contentSize = CGSizeMake(width*[self.images count], height);
        
        //
        CGRect rect = self.titleBar.frame;
        self.titleBar.frame = CGRectMake(rect.origin.x, 0-rect.size.width, rect.size.width, rect.size.height);
        self.numLab.text = [NSString stringWithFormat:@"%d/%d", _currentIndex+1, [self.images count]];
        [self resetContentFrame];
    }
}

- (void)setDataWithImageURL
{
    //
    if (self.images && [self.images count])
    {
        NSInteger count = [self.images count];
        CGFloat width = self.scrollView.frame.size.width;
        CGFloat height = self.scrollView.frame.size.height;
        
        for (NSInteger i = 0; i < count; i++)
        {
            //
            UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
            aScrollView.backgroundColor = [UIColor clearColor];
            aScrollView.delegate = self;
            aScrollView.showsHorizontalScrollIndicator = NO;
            aScrollView.showsVerticalScrollIndicator = NO;
            aScrollView.maximumZoomScale = 2.0f;
            aScrollView.minimumZoomScale = 1.0f;
            aScrollView.zoomScale = 1.0f;
            [self.scrollView addSubview:aScrollView];
            
            //
            NSString *url = [self.images objectAtIndex:i];
            NetImageView *aView = [[NetImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
            aView.delegate = self;
            aView.image = GETIMG(@"tupian_lunbo.png");
            [aScrollView addSubview:aView];
            aView.imageURL = url;
        }
        
        //
        self.scrollView.contentOffset = CGPointMake(_currentIndex*width, 0);
        self.scrollView.contentSize = CGSizeMake(width*count, height);
        
        //
        CGRect rect = self.titleBar.frame;
        self.titleBar.frame = CGRectMake(rect.origin.x, 0-rect.size.width, rect.size.width, rect.size.height);
    }
}

- (void)setDataWithEntity:(CityNavEntity*)aEntity
{
    //
    if (aEntity)
    {
        CGFloat width = self.scrollView.frame.size.width;
        CGFloat height = self.scrollView.frame.size.height;
    
        //
        UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        aScrollView.backgroundColor = [UIColor clearColor];
        aScrollView.delegate = self;
        aScrollView.showsHorizontalScrollIndicator = NO;
        aScrollView.showsVerticalScrollIndicator = NO;
        aScrollView.maximumZoomScale = 2.0f;
        aScrollView.minimumZoomScale = 1.0f;
        aScrollView.zoomScale = 1.0f;
        [self.scrollView addSubview:aScrollView];
        
        //
        NetImageView *aView = [[NetImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        aView.delegate = self;
        aView.image = GETIMG(@"tupian_lunbo.png");
        [aScrollView addSubview:aView];
        aView.imageURL = aEntity.img;
        
        //
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.scrollView.contentSize = CGSizeMake(width, height);
        
        //
        CGRect rect = self.titleBar.frame;
        self.titleBar.frame = CGRectMake(rect.origin.x, 0-rect.size.width, rect.size.width, rect.size.height);
        
        //
        self.numLab.text = [NSString stringWithFormat:@"%d/%d", 1, 1];
        
        //
        [self resetContentFrame:aEntity];
    }
}

- (void)resetZoomScale
{
    if (self.scrollView)
    {
        NSArray *subviews = [self.scrollView subviews];
        for (UIView *view in subviews)
        {
            if (view && [view isKindOfClass:[UIScrollView class]])
            {
                UIScrollView *aScrollView = (UIScrollView*)view;
                if (aScrollView.zoomScale != aScrollView.minimumZoomScale)
                {
                    aScrollView.zoomScale = aScrollView.minimumZoomScale;
                }
            }
        }
    }
}

- (void)resetContentFrame
{
    //
    if (_currentIndex < [self.images count])
    {
        
        LunBoEntity *aEntity = [self.images objectAtIndex:_currentIndex];
        self.content.text = aEntity.content;
        CGSize size = [self labFactSize:self.content];
        if (size.height <= ContentHeight)
        {
            size.height = ContentHeight;
            
            totalHeight = POPBGHEIGHT+SPACE+size.height+SPACE/2;
            CGRect rect = self.popBG.frame;
            self.popBG.frame = CGRectMake(rect.origin.x, (self.view.frame.size.height-totalHeight),
                                          rect.size.width, totalHeight);
            rect = self.contentBG.frame;
            self.contentBG.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
            rect = self.content.frame;
            self.content.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width,
                                            self.contentBG.frame.size.height);
        }
        else
        {
            if (size.height > 100)
            {
                totalHeight = POPBGHEIGHT+SPACE+100;
                CGRect rect = self.popBG.frame;
                self.popBG.frame = CGRectMake(rect.origin.x, (self.view.frame.size.height-totalHeight),
                                              rect.size.width, totalHeight);
                rect = self.contentBG.frame;
                self.contentBG.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 100);
                self.contentBG.contentSize = CGSizeMake(rect.size.width, size.height);
                rect = self.content.frame;
                self.content.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
            }
            else
            {
                totalHeight = POPBGHEIGHT+SPACE+size.height+SPACE/2;
                CGRect rect = self.popBG.frame;
                self.popBG.frame = CGRectMake(rect.origin.x, (self.view.frame.size.height-totalHeight),
                                              rect.size.width, totalHeight);
                rect = self.contentBG.frame;
                self.contentBG.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
                rect = self.content.frame;
                self.content.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width,
                                                self.contentBG.frame.size.height);
            }
        }
    }
}

- (void)resetContentFrame:(CityNavEntity*)aEntity
{
    //
    if (aEntity)
    {
        self.content.text = aEntity.detail;
        CGSize size = [self labFactSize:self.content];
        if (size.height <= ContentHeight)
        {
            size.height = ContentHeight;
        }
        else
        {
            if (size.height > 100)
            {
                totalHeight = POPBGHEIGHT+SPACE+100;
                CGRect rect = self.popBG.frame;
                self.popBG.frame = CGRectMake(rect.origin.x, (self.view.frame.size.height-totalHeight),
                                              rect.size.width, totalHeight);
                rect = self.contentBG.frame;
                self.contentBG.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 100);
                self.contentBG.contentSize = CGSizeMake(rect.size.width, size.height);
                rect = self.content.frame;
                self.content.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
            }
            else
            {
                totalHeight = POPBGHEIGHT+SPACE+size.height+SPACE/2;
                CGRect rect = self.popBG.frame;
                self.popBG.frame = CGRectMake(rect.origin.x, (self.view.frame.size.height-totalHeight),
                                              rect.size.width, totalHeight);
                rect = self.contentBG.frame;
                self.contentBG.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size.height);
                rect = self.content.frame;
                self.content.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width,
                                                self.contentBG.frame.size.height);
            }
        }
    }
}

// 获取UILabel实际高度
- (CGSize)labFactSize:(UILabel*)lab
{
    CGSize size = [lab.text sizeWithFont:lab.font constrainedToSize:CGSizeMake(lab.frame.size.width, MAXFLOAT)
                           lineBreakMode:NSLineBreakByWordWrapping];
    CGSize newSize = CGSizeMake((int)size.width, (int)size.height);
    return newSize;
}

- (void)scrollViewSingleTapped
{
    [UIView beginAnimations:@"curl" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    
    CGFloat y = self.popBG.frame.origin.y;
    if (y == self.view.frame.size.height-POPBGHEIGHT)
    {
        CGRect rect = self.titleBar.frame;
        self.titleBar.frame = CGRectMake(rect.origin.x, 0, rect.size.width, rect.size.height);
        self.direction.image = GETIMG(@"chengshifengguang_line_down.png");
        self.popBG.frame = CGRectMake(0, self.view.frame.size.height-totalHeight,
                                      self.view.frame.size.width, totalHeight);
    }
    
    if (y == self.view.frame.size.height-totalHeight)
    {
        CGRect rect = self.titleBar.frame;
        self.titleBar.frame = CGRectMake(rect.origin.x, 0-rect.size.width, rect.size.width, rect.size.height);
        self.direction.image = GETIMG(@"chengshifengguang_line_up.png");
        self.popBG.frame = CGRectMake(0, self.view.frame.size.height-POPBGHEIGHT,
                                      self.view.frame.size.width, totalHeight);
    }
    
    [UIView commitAnimations];
}

#pragma mark - override
- (void)homeAction
{
    NSLog(@"ScanPhotoInfomationVC:弹出分享界面!");
    
    //
    if (!self.sinaVC)
    {
        SinaWeiBoVC *aVC = [[SinaWeiBoVC alloc] init];
        self.sinaVC = aVC;
    }
    
    //
    if (self.images)
    {
        if (_isShowTitle)
        {
            NSString *shareText = @"";
            if (_currentIndex < [self.images count])
            {
                LunBoEntity *aEntity = [self.images objectAtIndex:_currentIndex];
                shareText = aEntity.title;
                
                NetImageView *aView = [[NetImageView alloc] initWithImageURL:aEntity.image];
                [self.sinaVC sendSinaWeiBoWithText:shareText image:aView.image];
            }
        }
        else
        {
            NSString *shareText = @"";
            if (_currentIndex < [self.images count])
            {
                NSString *url = [self.images objectAtIndex:_currentIndex];
                NetImageView *aView = [[NetImageView alloc] initWithImageURL:url];
                [self.sinaVC sendSinaWeiBoWithText:shareText image:aView.image];
            }
        }
    }
    else
    {
        if (self.entity)
        {
            NSString *shareText = self.entity.title;
            NetImageView *aView = [[NetImageView alloc] initWithImageURL:self.entity.img];
            [self.sinaVC sendSinaWeiBoWithText:shareText image:aView.image];
        }
    }
}

#if 0
- (void)backAction
{
    [super backAction];
    
    if (_isShowTitle)
    {
        [[ViewController sharedMainmenu] showMainMenu];
    }
    else
    {
        [[ViewController sharedMainmenu] hideMainMenu];
    }
}
#endif

// 截取图片适配iphone5兼容iphone4、iphone4s（兼容原理:从iphone5尺寸中截图iphone4、iphone4s的尺寸
- (void)cutImage:(NetImageView*)imageView
{
    //截取图片大小
    CGSize size = CGSizeMake(imageView.image.size.width, imageView.image.size.height);
    float bl = MainViewWidth/size.width;
    CGSize newsize = CGSizeMake((int)(size.width*bl), (int)(size.height*bl));
    CGPoint point = CGPointMake(imageView.frame.origin.x, imageView.frame.origin.y);
    imageView.frame = CGRectMake(point.x, point.y, newsize.width, newsize.height);
    
    //开始取图，参数：截图图片大小
    UIGraphicsBeginImageContext(newsize);
    
    //截图层放入上下文中
    [imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //从上下文中获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [imageView setImage:image];
    
    //结束截图
    UIGraphicsEndImageContext();
}

#pragma mark - NetImageViewDelegate
-(void)loadImageFinishWithSelf:(NetImageView*)netImageVeiw
{
#if 0
    // 设置图片的原始大小
    if (netImageVeiw)
    {
        CGSize size = CGSizeMake(netImageVeiw.image.size.width, netImageVeiw.image.size.height);
        if (size.width > MainViewWidth)
        {
            // 按iphone4s设备宽度等比压缩
            [self cutImage:netImageVeiw];
        }
        
        CGSize newsize = CGSizeMake(netImageVeiw.image.size.width, netImageVeiw.image.size.height);
        netImageVeiw.frame = CGRectMake((self.view.frame.size.width-newsize.width)/2,
                                        (self.view.frame.size.height-newsize.height)/2,
                                        newsize.width, newsize.height);
        [netImageVeiw setNeedsDisplay];
    }
#else
    // 设置图片的原始大小
    if (netImageVeiw)
    {
        NSLog(@"%@", netImageVeiw.imageURL);
        UIScrollView *superView = (UIScrollView*)[netImageVeiw superview];
        if (superView)
        {
            CGSize size = CGSizeMake(netImageVeiw.image.size.width, netImageVeiw.image.size.height);
            if (size.height > superView.frame.size.height)
            {
                superView.contentSize = CGSizeMake(size.width, size.height);
                
                if (size.width >= superView.frame.size.width)
                {
                    netImageVeiw.frame = CGRectMake(0, 0, size.width, size.height);
                }
                else
                {
                    netImageVeiw.frame = CGRectMake((int)((superView.frame.size.width-size.width)/2),
                                                    0,
                                                    size.width, size.height);
                }
            }
            else
            {
                superView.contentSize = CGSizeMake(size.width, superView.contentSize.height);
                
                if (size.width >= superView.frame.size.width)
                {
                    netImageVeiw.frame = CGRectMake(0, (int)((superView.frame.size.height-size.height)/2),
                                                    size.width, size.height);
                }
                else
                {
                    netImageVeiw.frame = CGRectMake((int)((superView.frame.size.width-size.width)/2),
                                                    (int)((superView.frame.size.height-size.height)/2),
                                                    size.width, size.height);
                }
            }
        }
    }
#endif
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //
    if (scrollView == self.scrollView)
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int index = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
        if (_currentIndex != index)
        {
            _currentIndex = index;
            
            // qzlei 2013.03.06
            if (_isShowTitle)
            {
                self.numLab.text = [NSString stringWithFormat:@"%d/%d", _currentIndex+1, [self.images count]];
                [self setTitleString:[[self.images objectAtIndex:_currentIndex] title]];
            }
            
            //
            [self resetZoomScale];
            
            // qzlei 2013.03.06
            if (_isShowTitle)
            {
                [self resetContentFrame];
            }
        }
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //
    if (scrollView != self.scrollView)
    {
        NSArray *subviews = [scrollView subviews];
        if (subviews && [subviews count])
        {
            return [subviews objectAtIndex:0];
        }
    }
    
    return nil;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if (scrollView != self.scrollView)
    {
        //获取当前的缩放图片
        UIImageView *tempImage = [[scrollView subviews] objectAtIndex:0];
        //重置位置
        CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
        (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
        CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
        (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
        tempImage.center = CGPointMake((int)(scrollView.contentSize.width * 0.5 + offsetX),
                                       (int)(scrollView.contentSize.height * 0.5 + offsetY));
    }
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    // 缩放时禁止外层大scrollview的滚动
    self.scrollView.scrollEnabled = NO;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    // 缩放结束时打开外层大scrollview的滚动
    self.scrollView.scrollEnabled = YES;
}

@end
