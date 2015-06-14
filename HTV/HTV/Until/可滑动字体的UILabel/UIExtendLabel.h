//
//  UIExtendLabel.h
//  ios_PDFMagazine
//
//  Created by apple on 12-7-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIExtendLabel : UIView
{   
    NSString        *_text;
    UITextAlignment _textAlignment;
    UIColor         *_textColor;
    UIFont          *_font;
    NSInteger       _numberOfLines;
    UIColor         *_backgroundColor;
    UILineBreakMode _lineBreakMode;
    
    // ...
    UILabel        *_lab;
    UIScrollView   *_scrollView;
    
    NSIndexPath    *_labIndex;
}

@property (nonatomic) UITextAlignment         textAlignment;
@property (nonatomic) NSInteger               numberOfLines;
@property (nonatomic) UILineBreakMode         lineBreakMode;
@property (nonatomic, strong) NSString        *text;
@property (nonatomic, strong) UIColor         *textColor;
@property (nonatomic, strong) UIFont          *font;
@property (nonatomic, strong) UIColor         *backgroundColor;
@property (nonatomic, strong) UILabel         *lab;
@property (nonatomic, strong) UIScrollView    *scrollView;
@property (nonatomic, strong) NSIndexPath     *labIndex;

@end
