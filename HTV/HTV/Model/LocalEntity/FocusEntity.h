
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：MessageEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页焦点图
//-------------------------------

#import <Foundation/Foundation.h>

@interface FocusEntity : NSObject <NSCoding>{

}
@property(nonatomic,strong)NSString *img;       //焦点图地址(逗号隔开)
@property(nonatomic,assign)int language;            //1.中文，2.英文
@property(nonatomic,strong)NSString *describe;  //描述信息
@property(nonatomic,strong)NSString *title;    //标题

@end
