//
//  CustomUIPageControl.h
//  NewPageControl
//
//  Created by Miaohz on 11-8-31.
//  Copyright 2011 Etop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomUIPageControlDelegate <NSObject>

@optional
- (void)pageControlMoveToIndex:(int)index;

@end

@interface CustomUIPageControl : UIPageControl
{
    id <CustomUIPageControlDelegate> __weak _delegate;
	UIImage *imagePageStateNormal;
	UIImage *imagePageStateHightlighted;
}

@property (weak) id <CustomUIPageControlDelegate> delegate;
@property (nonatomic, strong) UIImage *imagePageStateNormal;
@property (nonatomic, strong) UIImage *imagePageStateHightlighted;

- (void) updateDots;
- (void) updateDots:(int)index;
- (id) initWithFrame:(CGRect)frame;
- (CGFloat)myWidth;

@end
