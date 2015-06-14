
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：MessageEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页焦点图
//-------------------------------

#import "FocusEntity.h"

@implementation FocusEntity

@synthesize img,describe,language,title;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.img = [aDecoder decodeObjectForKey:@"img"];
        self.describe = [aDecoder decodeObjectForKey:@"describe"];
        self.language = [aDecoder decodeIntForKey:@"language"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.img forKey:@"img"];
    [aCoder encodeObject:self.describe forKey:@"describe"];
    [aCoder encodeInt:language forKey:@"language"];
    [aCoder encodeObject:self.title  forKey:@"title"];
}


@end
