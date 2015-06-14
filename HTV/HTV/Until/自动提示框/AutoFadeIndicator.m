//
//  AutoFadeIndicator.m
//  ios_psychologies
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AutoFadeIndicator.h"


@implementation AutoFadeIndicator
@synthesize liveDuration	= _liveDuration;
@synthesize image			= _image;
@synthesize title			= _title;
@synthesize delegate        = _delegate;
static CGFloat kTransitionDuration = 0.3;
- (void)addObservers {
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(deviceOrientationDidChange:)
												 name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

- (void)removeObservers {
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:@"UIDeviceOrientationDidChangeNotification" object:nil];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
		self.liveDuration = 1.5; //0.5;
		self.backgroundColor = [UIColor clearColor];
		[self addObservers];
    }
    return self;
}


- (CGAffineTransform)transformForOrientation {
    if (_isAlert) {
        return CGAffineTransformIdentity;
    }
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (orientation == UIInterfaceOrientationLandscapeLeft) {
		return CGAffineTransformMakeRotation(M_PI*1.5);
	} else if (orientation == UIInterfaceOrientationLandscapeRight) {
		return CGAffineTransformMakeRotation(M_PI/2);
	} else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
		return CGAffineTransformMakeRotation(-M_PI);
	} else {
		return CGAffineTransformIdentity;
	}
}

- (void)show{
	[[UIApplication sharedApplication].keyWindow addSubview:self];
}

- (void)willMoveToWindow:(UIWindow *)newWindow{
    if (newWindow.windowLevel == 1996) {
        _isAlert = YES;
    }
    self.center = newWindow.center;
    if (!CGAffineTransformIsIdentity(newWindow.transform)) {
        self.center = CGPointMake(newWindow.center.y, newWindow.center.x);
    }
	self.alpha = 0;
	
	self.transform = CGAffineTransformScale([self transformForOrientation], 0.001, 0.001);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/1.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
	self.transform = CGAffineTransformScale([self transformForOrientation], 1.1, 1.1);
	self.alpha = 1;
	[UIView commitAnimations];

	
	
}

- (void)bounce1AnimationStopped {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
	self.transform = CGAffineTransformScale([self transformForOrientation], 0.9, 0.9);
	[UIView commitAnimations];
}

- (void)bounce2AnimationStopped {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showAnimationDidStop)];
	self.transform = [self transformForOrientation];
	[UIView commitAnimations];
}
- (void)didMoveToWindow{

	
}
- (void)showAnimationDidStop{
	[NSTimer scheduledTimerWithTimeInterval:_liveDuration
									 target:self
								   selector:@selector(fadeOut)
								   userInfo:nil
									repeats:NO];
}
- (void)fadeOut{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:0.25];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(viewDidFadeOut)];
	self.alpha = 0;
	[UIView commitAnimations];
}

- (void)viewDidFadeOut{
    if (_delegate && [_delegate respondsToSelector:@selector(indicatorDidFadeout:)]) {
        [self.delegate indicatorDidFadeout:self];
        self.delegate = nil;
    }
    
	[self removeFromSuperview];
}


- (void)deviceOrientationDidChange:(void*)object {

	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	self.transform = [self transformForOrientation];
	[UIView commitAnimations];
}


- (void)dealloc {
	[self removeObservers];
    self.delegate = nil;
}

@end

