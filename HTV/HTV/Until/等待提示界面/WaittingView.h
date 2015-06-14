//
//  WaittingView.h
//  WongTeeHotel
//
//  Created by 钱阵雷 on 13-1-23.
//  Copyright (c) 2013年 donson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaittingView : UIView
{
    UIActivityIndicatorView     *_activityView;
    UILabel                     *_promptLab;
    NSArray                     *_promptMsg;
    NSTimer                     *_timer;
    int                         index;
}

@property (nonatomic, strong) UIActivityIndicatorView     *activityView;
@property (nonatomic, strong) UILabel                     *promptLab;
@property (nonatomic, strong) NSArray                     *promptMsg;

- (void)start;
- (void)stop;
- (void)stopWithPrompt:(NSString*)prompt;

@end
