//
//  UIExtendLabel.m
//  ios_PDFMagazine
//
//  Created by apple on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

/* ******************
 
使用说明, 与使用UILabel一样, 例如:

UIExtendLabel *lab = [[UIExtendLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
lab.text = @"为避免重复购买，请确认你是否已是订阅用户。如果是订阅用户，请先进行恢复订阅为避免重复购买，请确认你是否已是订阅用户。";
lab.textColor = [UIColor redColor];
lab.font = [UIFont systemFontOfSize:18];
lab.textAlignment = UITextAlignmentLeft;
lab.backgroundColor = [UIColor clearColor];
lab.numberOfLines = 1;
lab.lineBreakMode = UILineBreakModeWordWrap;
[self addSubview:lab];
[lab release];
 
****************** */

#import "UIExtendLabel.h"

@implementation UIExtendLabel

@synthesize textAlignment       = _textAlignment;
@synthesize numberOfLines       = _numberOfLines;
@synthesize lineBreakMode       = _lineBreakMode;
@synthesize text                = _text;
@synthesize textColor           = _textColor;
@synthesize font                = _font;
@synthesize backgroundColor     = _backgroundColor;
@synthesize scrollView          = _scrollView;
@synthesize lab                 = _lab;
@synthesize labIndex            = _labIndex;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createSubview];
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

#pragma mark - CustomMethods
- (void)createSubview
{
    if (!self.lab)
    {
        UILabel *lab = [[UILabel alloc] init];
        lab.textAlignment = NSTextAlignmentCenter;
        _textAlignment = NSTextAlignmentCenter;
        lab.textColor = [UIColor blackColor];
        lab.numberOfLines = 1;
        lab.backgroundColor = [UIColor clearColor];
        lab.lineBreakMode = NSLineBreakByWordWrapping;
        lab.userInteractionEnabled = YES;
        self.lab = lab;
    }    
    
    if (!self.scrollView)
    {
        UIScrollView *scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        scrollerView.userInteractionEnabled = YES;
        scrollerView.showsHorizontalScrollIndicator = NO;
        scrollerView.showsVerticalScrollIndicator = NO;
        scrollerView.backgroundColor = [UIColor clearColor];
        scrollerView.bounces = YES;
        scrollerView.scrollEnabled = YES;
        scrollerView.delaysContentTouches = YES;
        scrollerView.directionalLockEnabled = YES;
        [scrollerView addSubview:self.lab];
        self.scrollView = scrollerView;
        [self addSubview:scrollerView];
    }
}

#pragma mark - set methods
- (void)changeProperty
{
    //
    CGSize maximumLabelSize = CGSizeMake(9999,self.lab.frame.size.height);
    CGSize expectedLabelSize = [self.lab.text sizeWithFont:self.lab.font
                                         constrainedToSize:maximumLabelSize
                                             lineBreakMode:[self.lab lineBreakMode]];
    
    //
    int width = expectedLabelSize.width+5;
    if (self.lab.textAlignment == NSTextAlignmentCenter)
    {
        if (width >= self.scrollView.frame.size.width)
        {
            self.lab.frame = CGRectMake(0, 0, width, expectedLabelSize.height);
        }
        else
        {
            self.lab.frame = CGRectMake((int)((self.scrollView.frame.size.width-width)/2), 0, width, expectedLabelSize.height);
        }
    }
    else
    {
        self.lab.frame = CGRectMake(0, 0, width, expectedLabelSize.height);
    }
    [self.lab setNeedsDisplay];
    
    //
    self.scrollView.contentSize = CGSizeMake(self.lab.frame.size.width, self.frame.size.height);
    [self.scrollView setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    if (_text != text)
    {
        _text = text;
        
        self.lab.text = _text;
        [self changeProperty];
    }
}

- (void)setLineBreakMode:(UILineBreakMode)lineBreakMode
{
    if (_lineBreakMode != lineBreakMode)
    {
        _lineBreakMode = lineBreakMode;
        self.lab.lineBreakMode = _lineBreakMode;
        [self changeProperty];
    }
}

- (void)setFont:(UIFont *)font
{
    if (_font != font)
    {
        _font = font;
        
        self.lab.font = _font;
        [self changeProperty];
    }
}

- (void)setTextAlignment:(UITextAlignment)textAlignment
{
    if (_textAlignment != textAlignment)
    {
        _textAlignment = textAlignment;
        self.lab.textAlignment = _textAlignment;
        [self.lab setNeedsDisplay];
    }
}

- (void)setTextColor:(UIColor *)textColor
{
    if (_textColor != textColor)
    {
        _textColor = textColor;
        
        self.lab.textColor = _textColor;
        [self.lab setNeedsDisplay];
    }
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
    if (_numberOfLines != numberOfLines)
    {
        _numberOfLines = numberOfLines;
        self.lab.numberOfLines = _numberOfLines;
        [self.lab setNeedsDisplay];
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    if (_backgroundColor != backgroundColor)
    {
        _backgroundColor = backgroundColor;
        
        self.lab.backgroundColor = _backgroundColor;
        [self.lab setNeedsDisplay];
    }
}


@end
