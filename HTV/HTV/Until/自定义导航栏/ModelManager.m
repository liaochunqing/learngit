//
//  ModelManager.m
//  MigainoDemo
//
//  Created by Admin Admin on 12-7-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ModelManager.h"
#import <QuartzCore/QuartzCore.h>

@interface ModelManager (private_methods)
- (void)reSetTransitionType;
@end

@implementation ModelManager
@synthesize transitionType;
@synthesize TransitionSubType;
- (id)init{
    self = [super init];
    if (self) {
        subcontrollers = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}


+ (id)shareManager{
    if (nil == g_modelManager) {
        g_modelManager = [[ModelManager alloc] init];
    }
    return g_modelManager;
}

+ (void)releaseManager{
}

- (void)setRootControllerWith:(UIViewController*)controller{
//    if (nil == rootviewcontroller) {
        rootviewcontroller = controller;//weak
//    }
}

- (void)pushController:(UIViewController*)controller WithDelegate:(id<ModelManagerDelegate>)obj{
    if (obj && [obj respondsToSelector:@selector(viewWillShow)]) {
        [obj performSelector:@selector(viewWillShow)];
    }
    if (controller) {
        [subcontrollers addObject:controller];
        [rootviewcontroller.view addSubview:controller.view];
        
        CATransition *transition = [CATransition animation];
        transition.delegate = self;
        transition.duration = 0.3f;
        transition.type = nil==self.transitionType ? kCATransitionPush : self.transitionType;
        transition.subtype = nil==self.TransitionSubType ? kCATransitionFromRight : self.TransitionSubType;
        [rootviewcontroller.view.layer addAnimation:transition forKey:nil];
        [self reSetTransitionType];
    }
}

- (void)popController:(UIViewController*)controller WithDelegate:(id<ModelManagerDelegate>)obj{
    if (obj && [obj respondsToSelector:@selector(viewWillRemove)]) {
        [obj performSelector:@selector(viewWillRemove)];
    }
    if (controller) {
        CATransition *transition = [CATransition animation];
        transition.delegate = self;
        transition.duration = 0.3f;
        transition.timingFunction = UIViewAnimationCurveEaseInOut;
        transition.type = nil==self.transitionType ? kCATransitionPush : self.transitionType;
        transition.subtype = nil==self.TransitionSubType ? kCATransitionFromLeft : self.TransitionSubType;
        [controller.view removeFromSuperview];
        
        [rootviewcontroller.view.layer addAnimation:transition forKey:nil];
        [subcontrollers removeObject:controller];
        [self reSetTransitionType];
    }
}

- (void)popToRootControllerWithDelegate:(id<ModelManagerDelegate>)obj{
    if (obj && [obj respondsToSelector:@selector(viewWillRemove)]) {
        [obj performSelector:@selector(viewWillRemove)];
    }
    CATransition *transition = [CATransition animation];
	transition.delegate = self;
	transition.duration = 0.3f;
	transition.timingFunction = UIViewAnimationCurveEaseInOut;
	transition.type = nil==self.transitionType ? kCATransitionPush : self.transitionType;
	transition.subtype = nil==self.TransitionSubType ? kCATransitionFromLeft : self.TransitionSubType;
	for (int i=[subcontrollers count]-1; i>=0; i--) {
		UIViewController*controller = [subcontrollers objectAtIndex:i];
        [controller.view removeFromSuperview];
        [subcontrollers removeObject:controller];
    }
	[rootviewcontroller.view.layer addAnimation:transition forKey:nil];
    [self reSetTransitionType];
}

- (void)reSetTransitionType{
    self.transitionType = nil;
    self.TransitionSubType = nil;
}

- (void)setTransitionTypeWithType:(NSString*)type{
    self.transitionType = type;
}

- (void)setTransitionSubTypeWithType:(NSString*)type{
    self.TransitionSubType = type;
}

@end
