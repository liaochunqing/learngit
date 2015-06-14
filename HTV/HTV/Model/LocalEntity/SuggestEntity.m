//版权所有：版权所有(C) 2012，东信移动控股有限公司
//系统名称：皇庭V酒店
//文件名称：SuggestEntity
//作　　者：饶仲初
//完成日期：2012-11-12
//功能说明：意见反馈
//-----------------------------------------

#import "SuggestEntity.h"

@implementation SuggestEntity
@synthesize name,phone,detail,language;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.language = [aDecoder decodeIntForKey:@"language"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeInt:language forKey:@"language"];
}


@end
