//
//  WaittingView.m
//  WongTeeHotel
//
//  Created by 钱阵雷 on 13-1-23.
//  Copyright (c) 2013年 donson. All rights reserved.
//

#import "WaittingView.h"

@implementation WaittingView

@synthesize activityView            = _activityView;
@synthesize promptLab               = _promptLab;
@synthesize promptMsg               = _promptMsg;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createSubviews];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - Custom Methods
- (void)createSubviews
{
    //
    if (!self.activityView)
    {
        UIActivityIndicatorView *aView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        aView.frame = CGRectMake(0, (int)((self.frame.size.height-15)/2), 15, 15);
        aView.backgroundColor = [UIColor clearColor];
        self.activityView = aView;
        [self addSubview:aView];
    }
    
    //
    if (!self.promptLab)
    {
        int x = self.activityView.frame.origin.x+self.activityView.frame.size.width+5;
        int y = (int)(self.frame.size.height-15)/2;
        UILabel *aLab = [[UILabel alloc] initWithFrame:CGRectMake(x, y, self.frame.size.width-x, 15)];
        aLab.textAlignment = NSTextAlignmentLeft;
        aLab.backgroundColor = [UIColor clearColor];
        aLab.textColor = [UIColor blackColor];
        if (GetCurrentLanguage)
        {
            aLab.text = @"正在加载中";
        }
        else
        {
            aLab.text = @"loading";
        }
        aLab.font = [UIFont systemFontOfSize:14];
        self.promptLab = aLab;
        [self addSubview:aLab];
    }
    
    //
    if (!self.promptMsg)
    {
        NSArray *array = nil;
        
        if (GetCurrentLanguage)
        {
            array = [[NSArray alloc] initWithObjects:@"正在加载中", @"正在加载中.",
                              @"正在加载中..", @"正在加载中...", @"正在加载中....", @"正在加载中.....", @"正在加载中......", nil];
        }
        else
        {
            array = [[NSArray alloc] initWithObjects:@"loading", @"loading.",
                              @"loading..", @"loading...", @"loading....", @"loading.....", @"loading......", nil];
        }
        
        self.promptMsg = array;
    }
}

- (void)start
{
    //
    if (![self.activityView isAnimating])
    {
        [self.activityView startAnimating];
    }
    
    //
    index = 0;
    
    //
    if (!_timer)
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.3
                                                  target:self
                                                selector:@selector(switchPromptMsg)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)switchPromptMsg
{
    //
    if (self.promptMsg)
    {
        int count = [self.promptMsg count];
        if (index < count)
        {
            self.promptLab.text = [self.promptMsg objectAtIndex:index];
            index++;
            if (index == count)
            {
                index = 0;
            }
        }
    }
}

- (void)stop
{
    //
    if ([self.activityView isAnimating])
    {
        [self.activityView stopAnimating];
    }
    
    //
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
    //
    self.promptLab.text = @"";
    
    //
    if ([self superview])
    {
        [self removeFromSuperview];
    }
}

- (void)stopWithPrompt:(NSString*)prompt
{
    //
    if ([self.activityView isAnimating])
    {
        [self.activityView stopAnimating];
    }
    
    //
    if (_timer)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
    //
    self.promptLab.text = prompt;
}

@end
