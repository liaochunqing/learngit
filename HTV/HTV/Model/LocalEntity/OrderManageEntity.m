
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：OrderManageEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：订单查询
//-------------------------------

#import "OrderManageEntity.h"

@implementation OrderManageEntity
@synthesize orderID,name,phone,checkInDate,checkOutDate,roomType,totalPrice,remark,rooms,email;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.orderID = [aDecoder decodeObjectForKey:@"orderID"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.checkInDate = [aDecoder decodeObjectForKey:@"checkInDate"];
        self.checkOutDate = [aDecoder decodeObjectForKey:@"checkOutDate"];
        self.roomType = [aDecoder decodeObjectForKey:@"roomType"];
        self.totalPrice = [aDecoder decodeFloatForKey:@"totalPrice"];
        self.remark = [aDecoder decodeObjectForKey:@"remark"];
        self.rooms = [aDecoder decodeIntForKey:@"rooms"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.orderID forKey:@"orderID"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.checkInDate forKey:@"checkInDate"];
    [aCoder encodeObject:self.checkOutDate forKey:@"checkOutDate"];
    [aCoder encodeObject:self.roomType forKey:@"roomType"];
    [aCoder encodeFloat:self.totalPrice forKey:@"totalPrice"];
    [aCoder encodeObject:self.remark forKey:@"remark"];
    [aCoder encodeInt:self.rooms forKey:@"rooms"];
    [aCoder encodeObject:self.email forKey:@"email"];
}

@end
