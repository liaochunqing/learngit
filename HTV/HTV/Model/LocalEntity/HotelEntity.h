
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HotelEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：酒店预定
//-------------------------------

#import <Foundation/Foundation.h>

@interface HotelEntity : NSObject<NSCoding>{

}
@property(nonatomic,assign)int uid;                        //主键
@property(nonatomic,strong)NSString *hotelCode;            //酒店编码
@property(nonatomic,strong)NSString *apiAccount;           //API帐号
@property(nonatomic,strong)NSString *channel;              //渠道编码
@property(nonatomic,strong)NSString *supplyCode;           //酒店供应商编码
@property(nonatomic,strong)NSString *roomCode;             //房型编码
@property(nonatomic,strong)NSString *title;                //标题
@property(nonatomic,assign)int amounts;                    //最大入住人数
@property(nonatomic,assign)int beds;                       //床数
@property(nonatomic,assign)int area;                       //房间面积
@property(nonatomic,strong)NSString *yhPrice;              //优惠名称＋价格＋价格计划编码＋房总价＋净房价总价（逗号隔开））
@property(nonatomic,strong)NSString *msPrice;              //门市名称＋价格＋价格计划编码＋房总价＋净房价总价（逗号隔开）
@property(nonatomic,strong)NSString *skPrice;              //散客名称＋价格＋价格计划编码＋房总价＋净房价总价（逗号隔开）
@property(nonatomic,strong)NSString *phone;                //电话预定
@property(nonatomic,strong)NSString *imgs;                 //详情图（逗号隔开）
@property(nonatomic,strong)NSString *broadband;            //宽带类型
@property(nonatomic,strong)NSString *roomType;             //无烟房类型
@property(nonatomic,strong)NSString *icon;                //缩略图(逗号隔开)
@property(nonatomic,strong)NSString *detail;              //详情
@property(nonatomic,assign)int language;                  //1.中文，2.英文
@property(nonatomic,strong)NSString *checkInTime;        // 入住时间
@property(nonatomic,strong)NSString *checkEndTime;       // 离店时间
@property(nonatomic)int roomNum;                          // 房间数量

@end
