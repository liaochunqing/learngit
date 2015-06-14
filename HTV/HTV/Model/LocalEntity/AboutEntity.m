
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：AboutEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：关于我们
//-------------------------------

#import "AboutEntity.h"

@implementation AboutEntity
@synthesize uid,phone,logoImg,img,detail,language;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeIntForKey:@"uid"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.logoImg = [aDecoder decodeObjectForKey:@"logoImg"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.img = [aDecoder decodeObjectForKey:@"img"];
        self.language = [aDecoder decodeIntForKey:@"language"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.logoImg forKey:@"logoImg"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeObject:self.img forKey:@"img"];
    [aCoder encodeInt:language forKey:@"language"];
}


@end
