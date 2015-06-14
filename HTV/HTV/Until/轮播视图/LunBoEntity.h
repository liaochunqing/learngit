//
//  LunBoEntity.h
//  WongTeeHotel
//
//  Created by apple on 12-12-12.
//  Copyright (c) 2012年 donson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LunBoEntity : NSObject
{
    NSString        *_image;
    NSString        *_title;
    NSString        *_content;
}

@property (nonatomic, strong) NSString        *image;
@property (nonatomic, strong) NSString        *title;
@property (nonatomic, strong) NSString        *content;

@end
