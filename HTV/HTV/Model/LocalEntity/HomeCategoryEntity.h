
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：HomeCategoryEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：首页分类
//-------------------------------

#import <Foundation/Foundation.h>

@interface HomeCategoryEntity : NSObject<NSCoding>{
    
}
@property(nonatomic,assign)int uid;              //分类ID
@property(nonatomic,strong)NSString *title;      //副标题
@property(nonatomic,assign)int language;         //1.中文，2.英文

@end
