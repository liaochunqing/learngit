
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HomeListEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页列表
//-------------------------------

#import <Foundation/Foundation.h>

@interface HomeListEntity : NSObject<NSCoding>{

}
@property(nonatomic,assign)int uid;                //主键
@property(nonatomic,strong)NSString *title;        //标题
@property(nonatomic,strong)NSString *icon;         //缩略图
@property(nonatomic,strong)NSString *brief;        //简介
@property(nonatomic,strong)NSString *img;          //焦点图
@property(nonatomic,strong)NSString *phone;        //电话
@property(nonatomic,strong)NSString *detail;       //详情
@property(nonatomic,assign)int type;               //1.餐饮展示，2.会议及宴会，3. 休闲娱乐，4.V优惠，5.V快讯
@property(nonatomic,assign)int language;           //1.中文，2.英文
@property(nonatomic,strong)NSString *validate;     //有效期
@property(nonatomic,strong)NSString *date;         //时间
@property(nonatomic,strong)NSString *address;      //地点
@property(nonatomic,strong)NSString *url;          //网页地址

@end
