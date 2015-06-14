//
//  PreLoadVC.m
//  HengDaiPhone
//
//  Created by 钱阵雷 on 14-2-18.
//  Copyright (c) 2014年 钱阵雷. All rights reserved.
//

#import "PreLoadVC.h"
#import "MainViewController.h"

@interface PreLoadVC ()

@end

@implementation PreLoadVC

@synthesize logoImageView = _logoImageView;

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self imageFadeIn];
}

/**
 @功能：启动动画淡入效果
 @参数：无
 @返回值：无
 */
-(void)imageFadeIn
{
    self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景"]];
    self.logoImageView.frame = CGRectMake(0, 0, MainViewWidth, MainViewHeight);
    [self.view addSubview:self.logoImageView];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setFrame:CGRectMake(51, 90, 218, 106)];
    [logo setImage:[UIImage imageNamed:@"startlogo"]];
    [self.logoImageView addSubview:logo];
    
    //定义一个动画
    CATransition *animation = [CATransition animation];
    animation.timingFunction = UIViewAnimationCurveEaseInOut;//动画显示模式
    animation.duration = 3.0;//动画时间
    animation.type = kCATransitionFade;//过渡效果
    animation.subtype = kCATransitionFromTop;//过渡方向
    [self.view.layer addAnimation:animation forKey:nil];//向视图添加动画
    
    //一秒后执行的方法
    [self performSelector:@selector(imageFadeOut)
               withObject:nil
               afterDelay:3.0];
}

/**
 @功能：启动动画淡出效果
 @参数：无
 @返回值：无
 */
-(void)imageFadeOut
{
    //定义一个动画
    CATransition *animation = [CATransition animation];
    animation.duration = 2.0f; //动画时间
    animation.timingFunction = UIViewAnimationCurveEaseInOut;//动画显示模式
    animation.type = kCATransitionFade;//过渡效果
    animation.subtype = kCATransitionFromTop;//过渡方向
    [self.view.layer addAnimation:animation forKey:nil];//添加动画到视图
    
    [self.logoImageView removeFromSuperview];
    
    [self performSelector:@selector(startRootView) withObject:nil afterDelay:2.0];
}

/**
 @功能：启动主界面
 @参数：无
 @返回值：无
 */
-(void)startRootView
{
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self presentViewController:mainVC animated:NO completion:^{}];
}

@end
