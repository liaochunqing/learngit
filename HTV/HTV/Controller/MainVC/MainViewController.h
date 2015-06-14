//
//  MainViewController.h
//  HengDaiPhone
//
//  Created by 钱阵雷 on 14-2-18.
//  Copyright (c) 2014年 钱阵雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : CommonViewController
{
    UIView *_contentView;//内容视图
    UIImageView *_bottomBar;//底部菜单栏

}

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *bottomBar;

@end
