
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HotelEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：酒店预定
//-------------------------------

#import "HotelEntity.h"

@implementation HotelEntity
@synthesize uid,hotelCode,apiAccount,channel,supplyCode,roomCode,title,amounts,beds,area,yhPrice,msPrice,skPrice,
phone,imgs,broadband,roomType,icon,detail,language, checkInTime, checkEndTime, roomNum;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.uid = [aDecoder decodeIntForKey:@"uid"];
        self.hotelCode = [aDecoder decodeObjectForKey:@"hotelCode"];
        self.apiAccount = [aDecoder decodeObjectForKey:@"apiAccount"];
        self.channel = [aDecoder decodeObjectForKey:@"channel"];
        self.supplyCode = [aDecoder decodeObjectForKey:@"supplyCode"];
        self.roomCode = [aDecoder decodeObjectForKey:@"roomCode"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.amounts = [aDecoder decodeIntForKey:@"amounts"];
        self.beds = [aDecoder decodeIntForKey:@"beds"];
        self.area = [aDecoder decodeIntForKey:@"area"];
        self.yhPrice = [aDecoder decodeObjectForKey:@"yhPrice"];
        self.msPrice = [aDecoder decodeObjectForKey:@"msPrice"];
        self.skPrice = [aDecoder decodeObjectForKey:@"skPrice"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.imgs = [aDecoder decodeObjectForKey:@"imgs"];
        self.broadband = [aDecoder decodeObjectForKey:@"broadband"];
        self.roomType = [aDecoder decodeObjectForKey:@"roomType"];
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.detail = [aDecoder decodeObjectForKey:@"detail"];
        self.language = [aDecoder decodeIntForKey:@"language"];
        self.checkInTime = [aDecoder decodeObjectForKey:@"checkInTime"];
        self.checkEndTime = [aDecoder decodeObjectForKey:@"checkEndTime"];
        self.roomNum = [aDecoder decodeIntForKey:@"roomNum"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.hotelCode forKey:@"hotelCode"];
    [aCoder encodeObject:self.apiAccount forKey:@"apiAccount"];
    [aCoder encodeObject:self.channel forKey:@"channel"];
    [aCoder encodeObject:self.supplyCode forKey:@"supplyCode"];
    [aCoder encodeObject:self.roomCode forKey:@"roomCode"];
    [aCoder encodeInt:self.amounts forKey:@"amounts"];
    [aCoder encodeInt:self.beds forKey:@"beds"];
    [aCoder encodeInt:self.area forKey:@"area"];
    [aCoder encodeObject:self.yhPrice forKey:@"yhPrice"];
    [aCoder encodeObject:self.msPrice forKey:@"msPrice"];
    [aCoder encodeObject:self.skPrice forKey:@"skPrice"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.imgs forKey:@"imgs"];
    [aCoder encodeObject:self.broadband forKey:@"broadband"];
    [aCoder encodeObject:self.roomType forKey:@"roomType"];
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeInt:language forKey:@"language"];
    [aCoder encodeObject:self.checkInTime forKey:@"checkInTime"];
    [aCoder encodeObject:self.checkEndTime forKey:@"checkEndTime"];
    [aCoder encodeInt:self.roomNum forKey:@"roomNum"];
}


@end
