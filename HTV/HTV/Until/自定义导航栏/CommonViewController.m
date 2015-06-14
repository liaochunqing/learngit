//
//  CommonViewController.m
//  Donson
//
//  Created by donson on 12-7-21.
//  Copyright (c) 2012年 Donson. All rights reserved.
//

#import "CommonViewController.h"


//
NSString* LeftBtnImage=nil;
NSString* RightBtnImage=nil;

// 
#define TitleBG             @"tilebar.png"

//
#define TITLELABELTAG   900
#define LEFTBUTTONTAG   901
#define RIGHTBUTTONTAG  902
#define LEFTBLANK       7

//
#define retina 1 // 高清图片

@implementation CommonViewController


@synthesize titleBar;

 // Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    
    if (GetCurrentLanguage==1) 
    {
        LeftBtnImage=@"fanhui.png";    
        RightBtnImage=@"fenxing.png";
    }
    else
    {
        LeftBtnImage=@"tongyong_back.png";
        RightBtnImage=@"fenxing_english.png";
    }
    
    //
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, MainViewWidth, MainViewHeight);
    
    // 创建添加导航条视图
    if (!titleBar)
    {
        titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainViewWidth, [self getTitleBarHeight])];
        titleBar.backgroundColor = [UIColor clearColor];
        [self.view addSubview:titleBar];
        
        // 创建导航条背景图片
        UIImage *image = GETIMG(TitleBG);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titleBar.frame.size.width, titleBar.frame.size.height)];
        imageView.image = image;
        [titleBar addSubview:imageView];
    }
    
    // 设置左右按钮事件
    UIButton *backBtn = [self leftButton];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *homeBtn = [self rightButton];
    [homeBtn addTarget:self action:@selector(homeAction) forControlEvents:UIControlEventTouchUpInside];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake(0, 0, MainViewWidth, MainViewHeight);
    
    // 创建添加导航条视图
    if (!titleBar)
    {
        titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainViewWidth, [self getTitleBarHeight])];
        titleBar.backgroundColor = [UIColor clearColor];
        [self.view addSubview:titleBar];
        
        // 创建导航条背景图片
        UIImage *image = GETIMG(TitleBG);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, titleBar.frame.size.width, titleBar.frame.size.height)];
        imageView.image = image;
        [titleBar addSubview:imageView];
    }

    // 设置左右按钮事件
    UIButton *backBtn = [self leftButton];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *homeBtn = [self rightButton];
    [homeBtn addTarget:self action:@selector(homeAction) forControlEvents:UIControlEventTouchUpInside];
    
}

// 返回导航条高度
- (int) getTitleBarHeight
{
    UIImage *image = GETIMG(TitleBG);
#if retina
    return (int)(image.size.height/2); // 高清屏的图片
#else
    return image.size.height; // 普通屏的图片
#endif
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setTitleString:(NSString*)string{
    
    UILabel *_titlelabel = self.titleLabel;
    _titlelabel.text = string;
}

- (UILabel*) titleLabel
{
    UILabel *_titlelabel = (UILabel*)[titleBar viewWithTag:TITLELABELTAG];
    if (nil == _titlelabel) {
        
        CGRect frame = titleBar.bounds;
        _titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, frame.size.width-65*2, frame.size.height)];
        _titlelabel.backgroundColor = [UIColor clearColor];
        _titlelabel.tag = TITLELABELTAG;
        _titlelabel.textColor = [UIColor whiteColor];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        [titleBar addSubview:_titlelabel];
        [_titlelabel setFont:YHFont(20)];
    }
    return _titlelabel;
}

- (UIButton*)leftButton{
    UIButton *backBtn = (UIButton*)[titleBar viewWithTag:LEFTBUTTONTAG];
    if (nil == backBtn) {
        backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTag:LEFTBUTTONTAG];
        UIImage *bgImage = GETIMG(LeftBtnImage);
        UIImageView *imageView= [[UIImageView alloc] initWithImage:bgImage];
        
#if retina      
        // 高清图片 要除以2取整
        [backBtn setFrame:CGRectMake(LEFTBLANK, 
                                     (int)((titleBar.frame.size.height - (int)(imageView.frame.size.height/2)) / 2.0), 
                                     (int)(imageView.frame.size.width/2), (int)(imageView.frame.size.height/2))];
#else  
        // 普通图片
        [backBtn setFrame:CGRectMake(LEFTBLANK, 
                                     (int)((titleBar.frame.size.height - imageView.frame.size.height) / 2.0), 
                                     imageView.frame.size.width, imageView.frame.size.height)];
#endif
        
        [backBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
        [titleBar addSubview:backBtn];
    }
    return backBtn;
}

- (UIButton*)rightButton{
    UIButton* rightBtn = (UIButton*)[titleBar viewWithTag:RIGHTBUTTONTAG];
    if (nil == rightBtn) {
        rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setTag:RIGHTBUTTONTAG];
        
        UIImage *bgImage = GETIMG(RightBtnImage);
        UIImageView *imageView= [[UIImageView alloc] initWithImage:bgImage];

#if retina      
        // 高清图片 要除以2取整
        [rightBtn setFrame:CGRectMake(titleBar.frame.size.width - LEFTBLANK - (int)(imageView.frame.size.width/2), 
                                      (int)((titleBar.frame.size.height - (int)(imageView.frame.size.height/2)) / 2.0), 
                                      (int)(imageView.frame.size.width/2), (int)(imageView.frame.size.height/2))];
#else  
        // 普通图片
        [rightBtn setFrame:CGRectMake(LEFTBLANK, 
                                      (int)((titleBar.frame.size.height - imageView.frame.size.height) / 2.0), 
                                      imageView.frame.size.width, imageView.frame.size.height)];
#endif
        
        [rightBtn setBackgroundImage:bgImage forState:UIControlStateNormal];
        [titleBar addSubview:rightBtn];
    }
    return rightBtn;
}

- (void)backAction{
    [self popViewController];
}

- (void)homeAction{
    [self popToRoot];
}

- (void)pushViewController:(UIViewController*)controller{
    [[ModelManager shareManager] pushController:controller WithDelegate:self];
}
- (void)popViewController{
    [[ModelManager shareManager] popController:self WithDelegate:self];
}

- (void)popToRoot{
    [[ModelManager shareManager] popToRootControllerWithDelegate:self];
}

- (void)setTransitionType:(NSString*)type{
    [[ModelManager shareManager] setTransitionTypeWithType:type];
}

- (void)setTransitionSubType:(NSString*)type{
    [[ModelManager shareManager] setTransitionSubTypeWithType:type];
}

#pragma mask -
#pragma ModelManagerDelegate
- (void)viewWillShow{
    
}

- (void)viewWillRemove{
    
}

@end
