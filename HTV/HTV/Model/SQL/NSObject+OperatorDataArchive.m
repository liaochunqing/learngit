
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：NSObject+OperatorDataArchive
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：读取归档，保存归档
//-------------------------------

#import "NSObject+OperatorDataArchive.h"

@implementation NSObject (OperatorDataArchive)

/**
 @method 读取归档数据
 @param responseClass 接口分类
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食 － 城市导航
 @param uid 餐饮展示唯一标识UID － 查看菜品
 @param hotelType 1.房客，2.公寓 － 酒店预定
 @result 归档数据
 */
-(id)readArchiverArrayData:(ResponseClass)responseClass
                  withType:(int)type
                   withUID:(int)uid
             withHotelType:(int)hotelType
{
    NSMutableArray *arr;
    int language = GetCurrentLanguage;
    switch (responseClass)
    {
        case Focus:
        {
            arr = [self readFocusData:language];
            break;
        }
        case HomeCategory:
        {
            arr = [self readHomeCategoryData:language];
            break;
        }
        case HomeList:
        {
            arr = [self readHomeListData:language];
            break;
        }
        case QueryDish:
        {
            arr = [self readQueryDishData:language withUID:uid];
            break;
        }
        case Hotel:
        {
            arr = [self readHotelData:language];
            break;
        }
        case CityNav:
        {
            arr = [self readCityNavData:language withType:type];
            break;
        }
        case About:
        {
            arr = [self readAboutData:language];
            break;
        }
        case Help:
        {
            arr = [self readHelpData:language];
            break;
        }
        default:
            break;
    }
    return arr;
}

/**
 @method 保存归档数据
 @param responseClass 接口分类
 @param data 实体数组
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食 － 用于 城市导航 模块，其它模块设置为0即可
 @param uid 餐饮展示唯一标识UID － 用于 查看菜品 模块，其它模块设置为0即可
 @param hotelType 1.房客，2.公寓 － 用于 酒店预定 模块，其它模块设置为0即可
 */
-(void)saveArchiverArrayData:(ResponseClass)responseClass
                    withData:(NSMutableArray *)data
                    withType:(int)type
                     withUID:(int)uid
               withHotelType:(int)hotelType
{
    int language = GetCurrentLanguage;//获取当前语言
    switch (responseClass)
    {
        case Focus:
        {
            [self saveFocusData:data withLanguage:language];
            break;
        }
        case HomeCategory:
        {
            [self saveHomeCategoryData:data withLanguage:language];
            break;
        }
        case HomeList:
        {
            [self saveHomeListData:data withLanguage:language];
            break;
        }
        case QueryDish:
        {
            [self saveQueryDishData:data withLanguage:language withUID:uid];
            break;
        }
        case Hotel:
        {
            [self saveHotelData:data withLanguage:language];
            break;
        }
        case CityNav:
        {
            [self saveCityNavData:data withLanguage:language withType:type];
            break;
        }
        case About:
        {
            [self saveAboutData:data withLanguage:language];
            break;
        }
        case Help:
        {
            [self saveHelpData:data withLanguage:language];
            break;
        }
        default:
            break;
    }
}

#pragma mark - 获取文档目录
/**
 @method 读取归档路径
 @param fileName 归档数据文件名@"collect.archiver" 
 */
-(NSString *)getDocumentdirectory:(NSString *)fileName
{
    //目录
    NSString *document = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    //子目录
    NSString *documentDirectory = [document stringByAppendingPathComponent:@"donson"];
    
    //判断文件夹是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentDirectory])
    {
        NSError *err;
        [[NSFileManager defaultManager] createDirectoryAtPath:documentDirectory
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&err];
    }
    
    //文件路径
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    return filePath;
}

#pragma mark - 读取本地归档方法
/**
 @method 读取首页焦点图
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readFocusData:(int)language
{
    NSString *path = [self getDocumentdirectory:@"focus.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(FocusEntity *focusEntity in arr)
    {
        if (focusEntity.language == language)
        {
            [newArray addObject:focusEntity];
        }
    }
    return newArray;
}

/**
 @method 读取首页分类
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readHomeCategoryData:(int)language
{
    NSString *path = [self getDocumentdirectory:@"homecategory.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HomeCategoryEntity *homecategory in arr)
    {
        if (homecategory.language == language)
        {
            [newArray addObject:homecategory];
        }
    }
    return newArray;
}

/**
 @method 读取首页列表
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readHomeListData:(int)language
{
    NSString *path = [self getDocumentdirectory:@"homeList.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HomeListEntity *home in arr)
    {
        if (home.language == language)
        {
            [newArray addObject:home];
        }
    }
    return newArray;
}

/**
 @method 读取查看菜品
 @param language 1.中文，2.英文
 @param uid 餐饮展示唯一标识UID
 */
-(NSMutableArray *)readQueryDishData:(int)language withUID:(int)uid
{
    NSString *path = [self getDocumentdirectory:@"queryDish.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(QueryDishEntity *dish in arr)
    {
        if (dish.language == language && dish.uid ==uid)
        {
            [newArray addObject:dish];
        }
    }
    return newArray;
}

/**
 @method 读取酒店预定
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readHotelData:(int)language{
    NSString *path = [self getDocumentdirectory:@"hotel.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HotelEntity *hotel in arr)
    {
        if (hotel.language == language)
        {
            [newArray addObject:hotel];
        }
    }
    return newArray;
}

/**
 @method 读取城市导航
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readCityNavData:(int)language withType:(int)type
{
    NSString *path = [self getDocumentdirectory:@"cityNav.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(CityNavEntity *nav in arr)
    {
        if (nav.language == language && nav.type == type)
        {
            [newArray addObject:nav];
        }
    }
    return newArray;
}

/**
 @method 读取帮助
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readHelpData:(int)language
{
    NSString *path = [self getDocumentdirectory:@"help.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HelpEntity *help in arr)
    {
        if (help.language == language)
        {
            [newArray addObject:help];
        }
    }
    return newArray;
}

/**
 @method 读取关于我们
 @param language 1.中文，2.英文
 */
-(NSMutableArray *)readAboutData:(int)language
{
    NSString *path = [self getDocumentdirectory:@"about.archive"];
    NSMutableArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(AboutEntity *about in arr)
    {
        if (about.language == language)
        {
            [newArray addObject:about];
        }
    }
    return newArray;
}

#pragma mark - 保存本地归档方法
/**
 @method 保存首页焦点图
 @param data 实体数组
 @param language 1.中文，2.英文
 */
-(void)saveFocusData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"focus.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(int i=0;i<[arr count];i++)
    {
        FocusEntity *focusEntity = [arr objectAtIndex:i];
        if (focusEntity.language != language)
        {
            [newArray addObject:focusEntity];
        }
    }
    
    //添加新的数据
    for(FocusEntity *focusEntity in data)
    {
        [newArray addObject:focusEntity];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存首页分类
 @param data 实体数组
 @param language 1.中文，2.英文
 */
-(void)saveHomeCategoryData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"homecategory.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(int i=0;i<[arr count];i++)
    {
        HomeCategoryEntity *homecategory = [arr objectAtIndex:i];
        if (homecategory.language != language)
        {
            [newArray addObject:homecategory];
        }
    }
    
    //添加新的数据
    for(HomeCategoryEntity *homecategory in data)
    {
        [newArray addObject:homecategory];
    }
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存首页列表
 @param data 数组实体数组
 @param language 1.中文，2.英文
 */
-(void)saveHomeListData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"homeList.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HomeListEntity *homeListEntity in arr)
    {
        if (homeListEntity.language != language)
        {
            [newArray addObject:homeListEntity];
        }
    }
    
    //添加新的数据
    for(HomeListEntity *homeListEntity in data)
    {
        [newArray addObject:homeListEntity];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存酒店预定
 @param data 数组实体数组
 @param language 1.中文，2.英文
 */
-(void)saveHotelData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"hotel.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HotelEntity *hotel in arr)
    {
        if (hotel.language != language)
        {
            [newArray addObject:hotel];
        }
    }
    
    //添加新的数据
    for(HotelEntity *hotel in data)
    {
        [newArray addObject:hotel];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存查看菜品
 @param data 数组实体数组
 @param language 1.中文，2.英文
 @param uid 餐饮展示唯一标识UID
 */
-(void)saveQueryDishData:(NSMutableArray *)data withLanguage:(int)language withUID:(int)uid
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"queryDish.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(QueryDishEntity *dish in arr)
    {
        if (dish.language != language && dish.uid != uid)
        {
            [newArray addObject:dish];
        }
    }
    
    //添加新的数据
    for(QueryDishEntity *dish in data)
    {
        [newArray addObject:dish];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存城市导航
 @param data 数组实体数组
 @param language 1.中文，2.英文
 @param type 1.城市风光，2.休闲娱乐，3.餐饮美食
 */
-(void)saveCityNavData:(NSMutableArray *)data withLanguage:(int)language withType:(int)type
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"cityNav.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(CityNavEntity *nav in arr)
    {
        if (nav.language != language && nav.type != type)
        {
            [newArray addObject:nav];
        }
    }
    
    //添加新的数据
    for(CityNavEntity *nav in data)
    {
        [newArray addObject:nav];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

/**
 @method 保存帮助
 @param data 数组实体数组
 @param language 1.中文，2.英文
 */
-(void)saveHelpData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"help.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(HelpEntity *help in arr)
    {
        if (help.language != language)
        {
            [newArray addObject:help];
        }
    }
    
    //添加新的数据
    for(HelpEntity *help in data)
    {
        [newArray addObject:help];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}


/**
 @method 保存关于我们
 @param data 数组实体数组
 @param language 1.中文，2.英文
 */
-(void)saveAboutData:(NSMutableArray *)data withLanguage:(int)language
{
    //读取归档
    NSString *path = [self getDocumentdirectory:@"about.archive"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:path]];
    if (!arr)
    {
        arr = [[NSMutableArray alloc] init];
    }
    
    //过滤同一种语言下的实体对象，只保留不同语言下的实体对象
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    for(AboutEntity *about in arr)
    {
        if (about.language != language)
        {
            [newArray addObject:about];
        }
    }
    
    //添加新的数据
    for(AboutEntity *about in data)
    {
        [newArray addObject:about];
    }
    
    //保存归档
    [NSKeyedArchiver archiveRootObject:newArray toFile:path];
}

@end
