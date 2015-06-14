
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：QueryDishEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：查看菜品
//-------------------------------

#import "QueryDishEntity.h"

@implementation QueryDishEntity
@synthesize uid,name,icon,img,detail,language;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeIntForKey:@"uid"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.img = [aDecoder decodeObjectForKey:@"img"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.language = [aDecoder decodeIntForKey:@"language"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.img forKey:@"img"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeInt:language forKey:@"language"];
}


@end
