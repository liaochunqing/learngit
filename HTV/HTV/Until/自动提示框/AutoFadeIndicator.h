//
//  AutoFadeIndicator.h
//  ios_psychologies
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AutoFadeLabelDelegate;

@interface AutoFadeIndicator : UIView {
	UIImage						*_image;
	NSString					*_title;
	NSTimeInterval				_liveDuration;
    
    BOOL                        _isAlert;
    id                          __weak _delegate;
}
@property (nonatomic, assign) NSTimeInterval				liveDuration;

@property (nonatomic, strong) NSString					* title;

@property (nonatomic, strong) UIImage						* image;

@property (nonatomic ,weak)id <AutoFadeLabelDelegate> delegate;

- (void)show;

@end


@protocol AutoFadeLabelDelegate <NSObject>

- (void) indicatorDidFadeout:(AutoFadeIndicator*)indicator;

@end