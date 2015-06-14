//
//  AutoFadeWithLabel.m
//  ios_psychologies
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AutoFadeWithLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation AutoFadeWithLabel


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}
- (id)initWithString:(NSString*)string{
	CGRect rect = CGRectMake(0, 0, 160, 160);
	self = [super initWithFrame:rect];
	if (self) {
		self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.8];
		self.layer.cornerRadius = 20.0f;

		
		UILabel *aLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 88)];
		aLabel.backgroundColor = [UIColor clearColor];
		aLabel.textColor = [UIColor whiteColor];
		aLabel.font = [UIFont boldSystemFontOfSize:18];
		aLabel.text = string;
		aLabel.numberOfLines = 0;
		aLabel.textAlignment = NSTextAlignmentCenter;
		[self addSubview:aLabel];
		aLabel.center = self.center;
		
	}
	return self;
}

+ (void)labelWithString:(NSString*)string{
	AutoFadeWithLabel *label = [[AutoFadeWithLabel alloc] initWithString:string];
	[label show];
}

+ (AutoFadeWithLabel*)labelWithString:(NSString*)string delegate:(id)delegate
{
    AutoFadeWithLabel *label = [[AutoFadeWithLabel alloc] initWithString:string];
    [label setDelegate:delegate];
    return label;
}




@end
