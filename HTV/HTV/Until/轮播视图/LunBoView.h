//
//  LunBoView.h
//  LunBoDemo
//
//  Created by apple on 12-11-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomUIPageControl.h"
#import "LunBoEntity.h"
#import "NetImageView.h"

@protocol LunBoViewDelegate <NSObject>

@optional
- (void)imageSelected:(NSArray*)images currentIndex:(NSInteger)index;

@end

@interface LunBoView : UIView <UIScrollViewDelegate, CustomUIPageControlDelegate>
{
    id <LunBoViewDelegate>          __weak _delegate;
    
    NSMutableArray                  *_images;
    UIScrollView                    *_scrollView;
    
    NSTimer                         *_timer;
    NSInteger                       _currentIndex;
    
    UIImageView                     *_pageControlBG;
    CustomUIPageControl             *_pageControl;
    
    UILabel                         *_title;
}

@property (weak) id <LunBoViewDelegate>                       delegate;
@property (nonatomic, strong) NSMutableArray                    *images;
@property (nonatomic, strong) UIScrollView                      *scrollView;
@property (nonatomic, strong) UIImageView                       *pageControlBG;
@property (nonatomic, strong) CustomUIPageControl               *pageControl;
@property (nonatomic, strong) UILabel                           *title;

- (void)setLunBoWithData:(NSMutableArray*)array;
- (void)setLunBoData:(NSMutableArray*)array;
- (void)start;
- (void)stop;
- (NetImageView*)netImageViewWithIndex:(NSInteger)index;

@end
