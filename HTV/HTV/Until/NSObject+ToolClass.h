//
//  NSObject+ToolClass.h
//  XYJ_Estate
//
//  Created by donsonsz donson on 12-9-12.
//  Copyright (c) 2012年 donson. All rights reserved.
//

#import <Foundation/Foundation.h>

//设置字体为微软雅黑和对应的字体大小
#define YHFont(x) [UIFont fontWithName:@"Microsoft YaHei" size:x]

//获取本地图片的路径
#define GETIMG(name)  [UIImage imageWithContentsOfFile: [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name]]

//获取屏幕
#define IPADSCREEN [[UIScreen mainScreen] bounds]

//屏幕宽度
#define WIDTH IPADSCREEN.size.height

//屏幕高度
#define HEIGHT IPADSCREEN.size.width

// 是否为高清屏
#define isRetina ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

// 主界面宽，高
#define MainViewWidth  [[UIScreen mainScreen] bounds].size.width
#define MainViewHeight ([[UIScreen mainScreen] bounds].size.height-20)

//获取当前语言类型
//返回值为 1 或 0,分别代表中文或英文。
#define GetCurrentLanguage [[[NSUserDefaults standardUserDefaults] objectForKey:@"Language"] intValue]

#define APPDEBUG 0

// 判断是否为iphone5
#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 新浪微博
#define kSinaSDKDemoAppKey      @"3601604349"
#define kSinaSDKDemoAppSecret   @"7894dfdd1fc2ce7cc6e9e9ca620082fb"
#define KSinaRedirectURI        @"http://hi.baidu.com/jt_one"

