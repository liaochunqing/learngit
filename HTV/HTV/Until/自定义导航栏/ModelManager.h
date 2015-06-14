//
//  ModelManager.h
//  MigainoDemo
//
//  Created by tracetion on 12-7-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//用户管理控制器队列
@class ModelManager;
@protocol ModelManagerDelegate;
ModelManager*g_modelManager;
@interface ModelManager : NSObject{
    NSMutableArray* subcontrollers;//子控制器数组
    UIViewController* rootviewcontroller;//父控制器
    
    NSString* transitionType;
    NSString* TransitionSubType;
}
@property (strong, nonatomic) NSString* transitionType;//动画类型，动画前设置
@property (strong, nonatomic) NSString* TransitionSubType;//动画子类型，动画前设置
//about create
+ (id)shareManager;
+ (void)releaseManager;//程序退出后由主界面调用，慎用
- (void)setRootControllerWith:(UIViewController*)controller;//在主界面初始之后设置rootviewcontroller，只允许设置一次rootcontroller，不然会乱

//about add or remove
- (void)pushController:(UIViewController*)controller WithDelegate:(id<ModelManagerDelegate>)obj;//调用该方法后，不能直接用removefromsuperview删除界面
- (void)popController:(UIViewController*)controller WithDelegate:(id<ModelManagerDelegate>)obj;
- (void)popToRootControllerWithDelegate:(id<ModelManagerDelegate>)obj;

//about animation
- (void)setTransitionTypeWithType:(NSString*)type;//设置动画类型，当次动画有效，动画完毕后将会恢复默认值
- (void)setTransitionSubTypeWithType:(NSString*)type;//设置动画方向，当次动画有效，动画完毕后将会恢复默认值

@end

@protocol ModelManagerDelegate <NSObject>//只对当前要添加或者要去掉的界面有效，多级界面的时候，底下的界面无效
@optional
- (void)viewWillShow;
- (void)viewWillRemove;
@end
