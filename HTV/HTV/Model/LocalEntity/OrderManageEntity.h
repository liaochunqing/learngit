
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：OrderManageEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：订单查询
//-------------------------------

#import <Foundation/Foundation.h>

@interface OrderManageEntity : NSObject<NSCoding>{
    
}
@property(nonatomic,strong)NSString *orderID;       //订单号
@property(nonatomic,strong)NSString *name;          //姓名
@property(nonatomic,strong)NSString *phone;         //电话号码
@property(nonatomic,strong)NSString *checkInDate;   //入住时间
@property(nonatomic,strong)NSString *checkOutDate;  //离店时间
@property(nonatomic,strong)NSString *roomType;      //房间类型
@property(nonatomic,assign)float totalPrice;        //总价格
@property(nonatomic,weak)NSString *remark;        //备注
@property(nonatomic,assign)int rooms;               //房间数量
@property(nonatomic,strong)NSString *email;         //电子邮件

@end
