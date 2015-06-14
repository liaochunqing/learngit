//版权所有：版权所有(C) 2012，东信移动控股有限公司
//系统名称：皇庭V酒店
//文件名称：SuggestEntity
//作　　者：饶仲初
//完成日期：2012-11-12
//功能说明：意见反馈
//-----------------------------------------

#import <Foundation/Foundation.h>

@interface SuggestEntity : NSObject<NSCoding>{
    
}
@property(nonatomic,strong)NSString *name;        //姓名
@property(nonatomic,strong)NSString *phone;       //手机号码
@property(nonatomic,strong)NSString *detail;      //详细内容
@property(nonatomic,assign)int language;          //1.中文，2.英文

@end
