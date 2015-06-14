//
//  MainViewController.m
//  HengDaiPhone
//
//  Created by 钱阵雷 on 14-2-18.
//  Copyright (c) 2014年 钱阵雷. All rights reserved.
//

#import "MainViewController.h"

#define BUTTONTAG 0x001000

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize contentView     = _contentView;
@synthesize bottomBar       = _bottomBar;

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
    
    self.titleBar.hidden = YES;//隐藏顶部导航栏
    [[ModelManager shareManager] setRootControllerWith:self];//设置push的根控制器vc
    
    if (!self.contentView)
    {
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainViewWidth, MainViewHeight)];
        aView.backgroundColor = [UIColor clearColor];
        self.contentView = aView;
        [self.view addSubview:aView];
    }
    
    if (!self.bottomBar)
    {
        UIImageView *aView = [[UIImageView alloc] initWithFrame:CGRectMake(0, MainViewHeight-48, MainViewWidth, 48)];
        aView.image = [UIImage imageNamed:@"底部导航"];
        aView.userInteractionEnabled = YES;//支持点击事件
        self.bottomBar = aView;
        [self.view addSubview:aView];
    }
    
    UIButton *pinPaiJieShao = [UIButton buttonWithType:UIButtonTypeCustom];
    pinPaiJieShao.frame = CGRectMake(0, 0, 64, 48);
    pinPaiJieShao.tag = BUTTONTAG;
    [pinPaiJieShao setBackgroundImage:[UIImage imageNamed:@"1菜单-主页"] forState:UIControlStateNormal];
    [pinPaiJieShao setBackgroundImage:[UIImage imageNamed:@"1菜单-主页-点击"] forState:UIControlStateHighlighted];
    [pinPaiJieShao setBackgroundImage:[UIImage imageNamed:@"1菜单-主页-点击"] forState:UIControlStateSelected];
    [pinPaiJieShao addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBar addSubview:pinPaiJieShao];
    
    UIButton *xiangMuJieShao = [UIButton buttonWithType:UIButtonTypeCustom];
    xiangMuJieShao.frame = CGRectMake(64*1, 0, 64, 48);
    xiangMuJieShao.tag = BUTTONTAG+1;
    [xiangMuJieShao setBackgroundImage:[UIImage imageNamed:@"2菜单-项目介绍"] forState:UIControlStateNormal];
    [xiangMuJieShao setBackgroundImage:[UIImage imageNamed:@"2菜单-项目介绍-点击"] forState:UIControlStateHighlighted];
    [xiangMuJieShao setBackgroundImage:[UIImage imageNamed:@"2菜单-项目介绍-点击"] forState:UIControlStateSelected];
    [xiangMuJieShao addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBar addSubview:xiangMuJieShao];
    
    UIButton *chanPinJieShao = [UIButton buttonWithType:UIButtonTypeCustom];
    chanPinJieShao.frame = CGRectMake(64*2, 0, 64, 48);
    chanPinJieShao.tag = BUTTONTAG+2;
    [chanPinJieShao setBackgroundImage:[UIImage imageNamed:@"3菜单-产品介绍"] forState:UIControlStateNormal];
    [chanPinJieShao setBackgroundImage:[UIImage imageNamed:@"3菜单-产品介绍-点击"] forState:UIControlStateHighlighted];
    [chanPinJieShao setBackgroundImage:[UIImage imageNamed:@"3菜单-产品介绍-点击"] forState:UIControlStateSelected];
    [chanPinJieShao addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBar addSubview:chanPinJieShao];
    
    UIButton *quWeiJieShao = [UIButton buttonWithType:UIButtonTypeCustom];
    quWeiJieShao.frame = CGRectMake(64*3, 0, 64, 48);
    quWeiJieShao.tag = BUTTONTAG+3;
    [quWeiJieShao setBackgroundImage:[UIImage imageNamed:@"4菜单-区位介绍"] forState:UIControlStateNormal];
    [quWeiJieShao setBackgroundImage:[UIImage imageNamed:@"4菜单-区位介绍-点击"] forState:UIControlStateHighlighted];
    [quWeiJieShao setBackgroundImage:[UIImage imageNamed:@"4菜单-区位介绍-点击"] forState:UIControlStateSelected];
    [quWeiJieShao addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBar addSubview:quWeiJieShao];
    
    UIButton *yuYue = [UIButton buttonWithType:UIButtonTypeCustom];
    yuYue.frame = CGRectMake(64*4, 0, 64, 48);
    yuYue.tag = BUTTONTAG+4;
    [yuYue setBackgroundImage:[UIImage imageNamed:@"5菜单-预约"] forState:UIControlStateNormal];
    [yuYue setBackgroundImage:[UIImage imageNamed:@"5菜单-预约-点击"] forState:UIControlStateHighlighted];
    [yuYue setBackgroundImage:[UIImage imageNamed:@"5菜单-预约-点击"] forState:UIControlStateSelected];
    [yuYue addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomBar addSubview:yuYue];
    
    //
    [self buttonClicked:pinPaiJieShao];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 @功能：功能按钮点击事件
 @参数：按钮
 @返回值：无
 */
- (void)buttonClicked:(UIButton*)button
{
    // 重置点击状态
    for (UIView *subView in self.bottomBar.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton*)subView;
            btn.selected = NO;
        }
    }
    button.selected = YES;
    
#if 0
    
    // 处下点击选项
    switch (button.tag) {
        case BUTTONTAG:
        {
            if (!self.brandVC)
            {
                self.brandVC = [[BrandIntroductionVC alloc] init];
                [self.contentView addSubview:self.brandVC.view];
            }
            
            [self.contentView bringSubviewToFront:self.brandVC.view];
        }
            break;
        case (BUTTONTAG+1):
        {
            if (!self.productIntroVC)
            {
                self.productIntroVC = [[ProductIntroduceVC alloc] init];
                [self.contentView addSubview:self.productIntroVC.view];
            }
            
            [self.contentView bringSubviewToFront:self.productIntroVC.view];
        }
            break;
        case (BUTTONTAG+2):
        {
            if (!self.chanpinVC)
            {
                self.chanpinVC = [[ChanPinJieShaoVC alloc] init];
                [self.contentView addSubview:self.chanpinVC.view];
            }
            
            [self.contentView bringSubviewToFront:self.chanpinVC.view];
        }
            break;
        case (BUTTONTAG+3):
        {
            if (!self.quweiVC)
            {
                self.quweiVC = [[QuWeiVC alloc] init];
                [self.contentView addSubview:self.quweiVC.view];
            }
            
            [self.contentView bringSubviewToFront:self.quweiVC.view];
        }
            break;
        case (BUTTONTAG+4):
        {
            if (!self.appointVC)
            {
                self.appointVC = [[AppointMentVC alloc] init];
                [self.contentView addSubview:self.appointVC.view];
            }
            
            [self.contentView bringSubviewToFront:self.appointVC.view];
        }
            break;
            
        default:
            break;
    }
#endif
}

@end
