//
//  ScanPhotoInfomationVC.h
//  LunBoDemo
//
//  Created by apple on 12-12-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonViewController.h"
#import "CityNavEntity.h"
#import "SinaWeiBoVC.h"
#import "NetImageView.h"

@interface ScanPhotoInfomationVC : CommonViewController <UIScrollViewDelegate, NetImageViewDelegate>
{
    NSArray         *_images;
    UIScrollView    *_scrollView;
    NSInteger       _currentIndex;
    
    UIView          *_popBG;
    UILabel         *_numLab;
    UIScrollView    *_contentBG;
    UILabel         *_content;
    UIImageView     *_direction;
    
    CityNavEntity   *_entity;
    
    //
    SinaWeiBoVC     *_sinaVC;
    
    //
    BOOL            _isShowTitle;
}

@property (nonatomic, strong) NSArray         *images;
@property (nonatomic, strong) UIScrollView    *scrollView;
@property (nonatomic, strong) UIView          *popBG;
@property (nonatomic, strong) UILabel         *numLab;
@property (nonatomic, strong) UIScrollView    *contentBG;
@property (nonatomic, strong) UILabel         *content;
@property (nonatomic, strong) UIImageView     *direction;
@property (nonatomic, strong) CityNavEntity   *entity;
@property (nonatomic, strong) SinaWeiBoVC     *sinaVC;


- (id)initWithInfomation:(CityNavEntity*)aEntity;
- (id)initWithInfomation:(NSArray*)images withIndex:(NSInteger)currentIdex showTitle:(BOOL)isShow;

@end
