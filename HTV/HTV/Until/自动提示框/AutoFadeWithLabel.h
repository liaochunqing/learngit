//
//  AutoFadeWithLabel.h
//  ios_psychologies
//
//  Created by qianzhenlei on 12-3-16.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AutoFadeIndicator.h"

@interface AutoFadeWithLabel : AutoFadeIndicator {
    
}



+ (void)labelWithString:(NSString*)string;
- (id)initWithString:(NSString*)string;

+ (AutoFadeWithLabel*)labelWithString:(NSString*)string delegate:(id)delegate;

@end