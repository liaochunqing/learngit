
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HomeListEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页列表
//-------------------------------

#import "HomeListEntity.h"

@implementation HomeListEntity
@synthesize uid,title,icon,brief,img,phone,detail,type,language,validate,date,address,url;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeIntForKey:@"uid"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.brief = [aDecoder decodeObjectForKey:@"brief"];
        self.img = [aDecoder decodeObjectForKey:@"img"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.type = [aDecoder decodeIntForKey:@"type"];
        self.language = [aDecoder decodeIntForKey:@"language"];
        self.validate = [aDecoder decodeObjectForKey:@"validate"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.brief forKey:@"brief"];
    [aCoder encodeObject:self.img forKey:@"img"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeInt:self.type forKey:@"type"];
    [aCoder encodeInt:language forKey:@"language"];
    [aCoder encodeObject:validate forKey:@"validate"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.address forKey:@"address"];
    [aCoder encodeObject:self.url forKey:@"url"];
}


@end
