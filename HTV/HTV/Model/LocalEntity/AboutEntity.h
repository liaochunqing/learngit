
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：AboutEntity
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：关于我们
//-------------------------------

#import <Foundation/Foundation.h>

@interface AboutEntity : NSObject<NSCoding>{
    
}
@property(nonatomic,assign)int uid;              //主键
@property(nonatomic,strong)NSString *phone;      //电话
@property(nonatomic,strong)NSString *logoImg;    //logo图
@property(nonatomic,strong)NSString *img;        //皇庭V图
@property(nonatomic,strong)NSString *detail;     //详情
@property(nonatomic,assign)int language;         //1.中文，2.英文

@end
