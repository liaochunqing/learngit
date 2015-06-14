
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HomeCategoryEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页分类

#import "HomeCategoryEntity.h"

@implementation HomeCategoryEntity
@synthesize uid,title,language;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeIntForKey:@"uid"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.language = [aDecoder decodeIntForKey:@"language"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeInt:language forKey:@"language"];
}

@end
