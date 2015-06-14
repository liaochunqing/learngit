
//版权所有：版权所有(C) 2014 深圳宜达互联科技有限公司
//系统名称：HTV
//文件名称：ServiceConstants
//作　　者：钱阵雷
//完成日期：2014-2-23
//功能说明：接口变量
//-------------------------------

typedef enum {
    Focus = 0,         //首页焦点图
    HomeCategory,      //首页分类
    HomeList,          //首页列表
    QueryDish,         //查看菜品
    Hotel,             //酒店预定
    Order,             //客房预定
    CityNav,           //城市导航
    OrderManage,       //订单查询
    Suggest,           //意见反馈
    About,             //关于我们
    Help,              //帮助
    NewHotel,          //新酒店预定
} ResponseClass;

typedef enum {
    TimeOut = 0,      //请求超时
    NoNetWork,        //没有网络
    RequestException, //请求异常
    RequestSuccess,   //请求成功
} ExceptionType;


#define FocusURL          @"http://59.188.86.204:8000/API/focus"             //首页焦点图
#define HomeCategoryURL   @"http://59.188.86.204:8000/API/homecategory"      //首页分类
#define HomeListURL       @"http://59.188.86.204:8000/API/homeList"          //首页列表
#define QueryDishURL      @"http://59.188.86.204:8000/API/queryDish"         //查看菜品
#define HotelURL          @"http://59.188.86.204:8000/API/hotel"             //酒店预定
#define OrderURL          @"http://59.188.86.204:8000/API/order"             //客房预定
#define CityNavURL        @"http://59.188.86.204:8000/API/city"              //城市导航
#define OrderManageURL    @"http://59.188.86.204:8000/API/orderQuery"        //订单查询
#define SuggestURL        @"http://59.188.86.204:8000/API/suggest"           //意见反馈
#define AboutURL          @"http://59.188.86.204:8000/API/about"             //关于我们
#define HelpURL           @"http://59.188.86.204:8000/API/help"              //帮助
#define NewHotelURL       @"http://59.188.86.204:8000/API/newhotel"          //新酒店预定