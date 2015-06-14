
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：CityNavEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：城市导航
//-------------------------------

#import <Foundation/Foundation.h>

@interface CityNavEntity : NSObject<NSCoding>{

}
@property(nonatomic,assign)int uid;             //主键
@property(nonatomic,strong)NSString *title;     //标题
@property(nonatomic,strong)NSString *icon;      //缩略图
@property(nonatomic,strong)NSString *img;       //焦点图(逗号隔开)
@property(nonatomic,strong)NSString *detail;    //详情
@property(nonatomic,assign)int type;      //1.城市风光，2.休闲娱乐，3.餐饮美食
@property(nonatomic,assign)int language;        //1.中文，2.英文

@end
