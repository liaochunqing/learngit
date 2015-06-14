//
//  LunBoView.m
//  LunBoDemo
//
//  Created by apple on 12-11-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LunBoView.h"

#define SECONDS 2 // 轮播间隔时间
#define PageControlBGHeight 21 // 轮播背景高度

@implementation LunBoView

@synthesize delegate        = _delegate;
@synthesize images          = _images;
@synthesize scrollView      = _scrollView;
@synthesize pageControlBG   = _pageControlBG;
@synthesize pageControl     = _pageControl;
@synthesize title           = _title;

- (void)dealloc
{
    [self stop];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createSubviews];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Custom Methods
- (void)createSubviews
{
    //
    UIImageView *selfBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    selfBG.backgroundColor = [UIColor clearColor];
    selfBG.image = GETIMG(@"tupian_lunbo.png");
    selfBG.userInteractionEnabled = YES;
    [self addSubview:selfBG];
    
    //
    if (!self.scrollView)
    {
        UIScrollView *aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        aScrollView.backgroundColor = [UIColor clearColor];
        aScrollView.showsHorizontalScrollIndicator = NO;
        aScrollView.showsVerticalScrollIndicator = NO;
        aScrollView.pagingEnabled = YES;
        aScrollView.delegate = self;
        aScrollView.directionalLockEnabled = YES;
        aScrollView.bounces = YES;
        self.scrollView = aScrollView;
        [self addSubview:aScrollView];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] init];
        [gesture addTarget:self action:@selector(imageTapped)];
        [self.scrollView addGestureRecognizer:gesture];
    }
    
    //
    if (!self.pageControlBG)
    {
        UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-PageControlBGHeight, self.frame.size.width, PageControlBGHeight)];
        bg.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
        bg.userInteractionEnabled = YES;
        self.pageControlBG = bg;
        [self addSubview:bg];
        [self insertSubview:bg aboveSubview:self.scrollView];
    }
    
    //
    if (!self.pageControl)
    {
        CGFloat width = self.pageControlBG.frame.size.width/4;
        CustomUIPageControl *pageControl = [[CustomUIPageControl alloc] initWithFrame:CGRectMake(self.pageControlBG.frame.size.width-(int)width, 0, (int)width, self.pageControlBG.frame.size.height)];
        pageControl.numberOfPages = 0;
        pageControl.currentPage = 0;
        pageControl.backgroundColor = [UIColor clearColor];
        pageControl.delegate = self;
        [pageControl setImagePageStateNormal:[UIImage imageNamed:@"dian.png"]];
        [pageControl setImagePageStateHightlighted:[UIImage imageNamed:@"dian_up.png"]];
        self.pageControl = pageControl;
        [self.pageControlBG addSubview:pageControl];
    }
    
    if (!self.title)
    {
        // 图片描述
        CGFloat titleWidth = self.pageControlBG.frame.size.width/2;
        CGFloat titleHeight = self.pageControlBG.frame.size.height;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, (int)titleWidth, (int)titleHeight)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"";
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = YHFont(12);
        self.title = label;
        [self.pageControlBG addSubview:label];
    }
}

- (void)resetPageControlFrame
{
    CGFloat width = [self.images count] * 18;
    CGRect rect = CGRectMake(self.pageControlBG.frame.size.width-(int)width, self.pageControl.frame.origin.y, (int)width, self.pageControl.frame.size.height);
    self.pageControl.frame = rect;
}

- (void)setLunBoWithData:(NSMutableArray*)array
{
    //
    self.images = [NSMutableArray arrayWithArray:array];
    
    //
    if (self.images && [self.images count] && self.scrollView)
    {
        NSInteger count = [self.images count];
        CGFloat width = self.scrollView.frame.size.width;
        CGFloat height = self.scrollView.frame.size.height;
    
        for (NSInteger i = 0; i < count; i++)
        {
            LunBoEntity *aEntity = [self.images objectAtIndex:i];
            NetImageView *aView = [[NetImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
            aView.image = GETIMG(@"tupian_lunbo.png");
            aView.imageURL = aEntity.image;
            [self.scrollView addSubview:aView];
        }
        
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.scrollView.contentSize = CGSizeMake(width*count, height);
    }
    
    //
    _currentIndex = 0;
    
    //
    if ([self.images count] == 1)
    {
        self.pageControl.numberOfPages = 0;
        self.pageControl.currentPage = 0;
    }
    else
    {
        //
        [self resetPageControlFrame];
        
        //
        self.pageControl.numberOfPages = [self.images count];
        self.pageControl.currentPage = 0;
        [self.pageControl updateDots:0];
        
        //
        [self performSelector:@selector(start) withObject:nil afterDelay:SECONDS];
    }
}

- (void)setLunBoData:(NSMutableArray*)array
{
    //
    self.images = [NSMutableArray arrayWithArray:array];
    
    //
    if (self.images && [self.images count] && self.scrollView)
    {
        NSInteger count = [self.images count];
        CGFloat width = self.scrollView.frame.size.width;
        CGFloat height = self.scrollView.frame.size.height;
        
        for (NSInteger i = 0; i < count; i++)
        {
            NSString *str = [self.images objectAtIndex:i];
            
            NetImageView *aView = [[NetImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
            aView.image = GETIMG(@"tupian_lunbo.png");
            aView.imageURL = str;
            [self.scrollView addSubview:aView];
        }
        
        self.scrollView.contentOffset = CGPointMake(0, 0);
        self.scrollView.contentSize = CGSizeMake(width*count, height);
    }
    
    //
    _currentIndex = 0;
    
    //
    if ([self.images count] == 1)
    {
        self.pageControl.numberOfPages = 0;
        self.pageControl.currentPage = 0;
    }
    else
    {
        //
        [self resetPageControlFrame];
        
        //
        self.pageControl.numberOfPages = [self.images count];
        self.pageControl.currentPage = 0;
        [self.pageControl updateDots:0];
        
        //
        [self performSelector:@selector(start) withObject:nil afterDelay:SECONDS];
    }
}

- (void)start
{
    //
    [self stop];
    
    //
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:SECONDS
                                                  target:self
                                                selector:@selector(lunboShow)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)stop
{
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)lunboShow
{
    //
    _currentIndex++;
    
    //
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;
    
    if (self.images && _currentIndex >= [self.images count])
    {
        _currentIndex = 0;
        [self.scrollView scrollRectToVisible:CGRectMake(_currentIndex*width, 0, width, height) animated:NO];
        [self.pageControl updateDots:_currentIndex];
    }
    else
    {
        [self.scrollView scrollRectToVisible:CGRectMake(_currentIndex*width, 0, width, height) animated:YES];
    }
}

- (NetImageView*)netImageViewWithIndex:(NSInteger)index
{
    if (self.scrollView)
    {
        NSMutableArray *imageViewAry = [NSMutableArray array];
        NSArray *subviews = [self.scrollView subviews];
        for (UIView *v in subviews)
        {
            if ([v isKindOfClass:[NetImageView class]])
            {
                if (![imageViewAry containsObject:v])
                {
                    [imageViewAry addObject:v];
                }
            }
        }
        
        //
        if (imageViewAry && [imageViewAry count])
        {
            if (index < [imageViewAry count])
            {
                NetImageView *imageView = [imageViewAry objectAtIndex:index];
                return imageView;
            }
        }
    }
    
    return nil;
}

- (void)setTitleInfomation
{
    // 描述图片信息
    if (_currentIndex < [self.images count])
    {
        id aEntity = [self.images objectAtIndex:_currentIndex];
        if (aEntity && [aEntity isKindOfClass:[LunBoEntity class]])
        {
            LunBoEntity *entity = (LunBoEntity*)aEntity;
            self.title.text = entity.title;
        }
    }
}

#pragma mark - UITapGestureRecognizer
- (void)imageTapped
{
    if (_currentIndex < [self.images count])
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(imageSelected:currentIndex:)])
        {
            [self.delegate imageSelected:self.images currentIndex:_currentIndex];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //
    CGFloat pageWidth = scrollView.frame.size.width;
    int index = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
    _currentIndex = index;
    [self.pageControl updateDots:index];
   
    //
    CGFloat width = ([self.images count]-1)*scrollView.frame.size.width;
    if (scrollView.contentOffset.x >= width+60)
    {
        [scrollView scrollRectToVisible:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
        _currentIndex = 0;
    }
    
    if (scrollView.contentOffset.x <= -60)
    {
        [scrollView scrollRectToVisible:CGRectMake(width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
        _currentIndex = [self.images count]-1;
    }
    
    // 显示标题
//    [self setTitleInfomation];
}

#pragma mark - CustomUIPageControlDelegate
- (void)pageControlMoveToIndex:(int)index
{
    // ...
}

@end
