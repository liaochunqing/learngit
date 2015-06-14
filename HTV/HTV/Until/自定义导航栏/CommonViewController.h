//
//  CommonViewController.m
//  Donson
//
//  Created by donson on 12-7-21.
//  Copyright (c) 2012年 Donson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ModelManager.h"

@interface CommonViewController : UIViewController<ModelManagerDelegate>{
    UIView* titleBar;//标题栏
}
@property (strong, nonatomic)UIView* titleBar;

- (void)setTitleString:(NSString*)string;
- (UIButton*)leftButton;
- (UIButton*)rightButton;
- (UILabel*) titleLabel;

- (void)backAction;
- (void)homeAction;

- (void)pushViewController:(UIViewController*)controller;
- (void)popViewController;
- (void)popToRoot;

- (void)setTransitionType:(NSString*)type;
- (void)setTransitionSubType:(NSString*)type;//设置动画方向

- (int) getTitleBarHeight;

@end

//////////////
/*
 使用说明
 1. 添加文件 ModelManager.h/ModelManager.m;
 2. 添加文件 Consts.h;
 3. 添加QuartzCore.framework;
 4. 导入微软字体，使用说明见微软字体文件夹ReadMe.rtf中
 */
//////////////