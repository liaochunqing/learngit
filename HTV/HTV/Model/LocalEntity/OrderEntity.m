//版权所有：版权所有(C) 2012，东信移动控股有限公司
//系统名称：皇庭V酒店
//文件名称：OrderEntity
//作　　者：饶仲初
//完成日期：2012-11-12
//功能说明：客房预定
//-----------------------------------------

#import "OrderEntity.h"

@implementation OrderEntity
@synthesize remark,checkIn,hotelCode,apiAccount,channel,supplyCode,priceCode,roomCode,checkOut,name,phone,roomTotal,totalAll,rooms,amount,email;
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.remark = [aDecoder decodeObjectForKey:@"remark"];
        self.checkIn = [aDecoder decodeObjectForKey:@"checkIn"];
        self.hotelCode = [aDecoder decodeObjectForKey:@"hotelCode"];
        self.apiAccount = [aDecoder decodeObjectForKey:@"apiAccount"];
        self.channel = [aDecoder decodeObjectForKey:@"channel"];
        self.supplyCode = [aDecoder decodeObjectForKey:@"supplyCode"];
        self.priceCode = [aDecoder decodeObjectForKey:@"priceCode"];
        self.roomCode = [aDecoder decodeObjectForKey:@"roomCode"];
        self.checkOut = [aDecoder decodeObjectForKey:@"checkOut"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.roomTotal = [aDecoder decodeFloatForKey:@"roomTotal"];
        self.totalAll = [aDecoder decodeFloatForKey:@"totalAll"];
        self.rooms = [aDecoder decodeIntForKey:@"rooms"];
        self.amount = [aDecoder decodeIntForKey:@"amount"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.remark forKey:@"remark"];
    [aCoder encodeObject:self.checkIn forKey:@"checkIn"];
    [aCoder encodeObject:self.hotelCode forKey:@"hotelCode"];
    [aCoder encodeObject:self.apiAccount forKey:@"apiAccount"];
    [aCoder encodeObject:self.channel forKey:@"channel"];
    [aCoder encodeObject:self.supplyCode forKey:@"supplyCode"];
    [aCoder encodeObject:self.priceCode forKey:@"priceCode"];
    [aCoder encodeObject:self.roomCode forKey:@"roomCode"];
    [aCoder encodeObject:self.checkOut forKey:@"checkOut"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeFloat:self.roomTotal forKey:@"roomTotal"];
    [aCoder encodeFloat:self.totalAll forKey:@"totalAll"];
    [aCoder encodeInt:self.rooms forKey:@"rooms"];
    [aCoder encodeInt:self.amount forKey:@"amount"];
    [aCoder encodeObject:self.email forKey:@"email"];
}


@end
