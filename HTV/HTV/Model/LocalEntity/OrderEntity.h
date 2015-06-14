//版权所有：版权所有(C) 2012，东信移动控股有限公司
//系统名称：皇庭V酒店
//文件名称：OrderEntity
//作　　者：饶仲初
//完成日期：2012-11-12
//功能说明：客房预定
//-----------------------------------------

#import <Foundation/Foundation.h>

@interface OrderEntity : NSObject<NSCoding>{

}
@property(nonatomic,strong)NSString *remark;               //备注
@property(nonatomic,strong)NSString *checkIn;              //入住日期
@property(nonatomic,strong)NSString *hotelCode;            //酒店编码
@property(nonatomic,strong)NSString *apiAccount;           //API帐号
@property(nonatomic,strong)NSString *channel;              //渠道编码
@property(nonatomic,strong)NSString *supplyCode;           //酒店供应商编码
@property(nonatomic,strong)NSString *priceCode;            //价格计划编码
@property(nonatomic,strong)NSString *roomCode;             //房型编码
@property(nonatomic,strong)NSString *checkOut;             //离店日期
@property(nonatomic,strong)NSString *name;                 //顾客姓名
@property(nonatomic,strong)NSString *phone;                //顾客电话
@property(nonatomic,assign)float roomTotal;                //房总价
@property(nonatomic,assign)float totalAll;                 //净房价总价
@property(nonatomic,assign)int rooms;                      //房间数
@property(nonatomic,assign)int amount;                     //入住人数
@property(nonatomic,strong)NSString *email;                //电子邮件

@end
