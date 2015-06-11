//
//  RequestConstants.h
//  YYWallet
//
//  Created by Hao Fu on 6/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#define REQUEST_TOKEN @"token=22828C"

//#define BASE_URL @"http://192.168.0.211:8080"

//#define BASE_URL @"http://192.168.0.241"

#define BASE_URL @"http://www.ijton.com"

//#define BASE_URL @"http://192.168.123.109"
//#define BASE_URL @"http://192.168.123.116"
//#define BASE_URL @"http://192.168.123.118:55686"
//#define BASE_URL @"http://192.168.0.209"
//#define BASE_URL @"http://192.168.137.3"
//#define BASE_URL @"http://www.1jton.com"
//#define BASE_URL @"http://192.168.123.114"
//#define BASE_URL @"http://192.168.0.228:8080"

#define API_URL  @"/YYService/YYService.svc/"

//#define API_URL @"/YYService.svc/"

#define SLASH @"/"
#define QUESTION_MARK @"?"
#define CONNECT_MARK  @"&"
#define SCH @"sch="
#define REQ @"req="
#define SEMICOLON @";"
////////////////TAGS///////////////////////////
//登录
#define USER_LOGON_TAG            @"userlogon"
//用户个人信息
#define CLIENT_TAG                @"client"

#define IMAGES_TAG                @"images"
//用户系统消息
#define CLIENT_NEWS_TAG           @"clientnews"
//用户收藏
#define CLIENT_COLL_TAG           @"clientcoll"
//优惠券
#define COUPON_TAG                @"coupon"
//订单列表
#define TICKETS_TAG               @"tickets"
//用户用餐地址
#define CLIENT_SHIPPING_TAG       @"clientsp"
//用户评论
#define CLIENT_REVIEW_TAG         @"clientrvw"
//用户注册
#define USER_RIGISTER_TAG         @"userreg"
// 注册设备id
#define REGIN_REVID               @"devreg"
//商家
#define SHOP_TAG                  @"shop"

// 关注商家
#define KEEP_SHOP_TAG             @"cltmidac"
// 用户得到上网密钥
#define USER_GET_KEY              @"keys"
//商家优惠活动
#define SHOP_PROMO_TAG            @"shoppromo"
//商家优惠券
#define SHOP_COUPON_TAG           @"coupons"
//商家评论
#define SHOP_REVIEW_TAG           @"shoprvw"
// 有活动的商家
#define GUANZU_SHOPHD_TAG         @"cltshop"
// 得到系统消息
#define SYSTEM_NEWS_TAG           @"clientnews"
// 得到wifi信息
#define WIFI_INFO_TAG             @"routmap"
//城市列表
#define CITY_LIST_TAG             @"city"
//商圈
#define BIZ_REGION_LIST_TAG       @"regionb"
//区域和商圈
#define GOV_BIZ_REGION_LIST_TAG   @"regions"
//按名称搜索商家
#define SHOP_LIST_BY_SEARCH_NAME_TAG  @"shopbyname"
//分类列表
#define CATEGORY_LIST_TAG         @"cate"
//菜系列表
#define STYLE_LIST_TAG            @"style"
//商家菜单
#define SHOP_MENU_TAG             @"cates"
//商家子菜单
#define SHOP_SUB_MENU_TAG         @"csubs"
//菜单项目列表
#define SALES_CODE_LIST_TAG       @"sccate"
//菜单项目和做法口味
#define SALES_CODE_TAG            @"scode"
//订单
#define ORDER_TAG                 @"orders"
//发布的优惠券
#define PUBLISHED_FRANCHISE_TAG   @"franc"
//用户资料
#define USER_INFO_TAG             @"user"
//发表反馈
#define FEEDBACK_TAG              @"fback"
//检测版本更新
#define CHECK_NEW_VERSION_TAG     @"ver"
//商家纠错
#define SHOP_CORRECT_TAG          @"shopcor"
//商家桌子设置
#define SHOP_TABLE_LIST_TAG       @"tableset"
//拼音得到salescode list
#define SALES_CODE_LIST_PINYIN_TAG @"scpinyin"
//得到优惠活动详情
#define PROMO_TAG                 @"promo"
//得到商家更多信息
#define SHOP_MORE_TAG             @"shopmore"
//提交商家评分
#define SUBMIT_SHOP_RATING_TAG    @"shoprt"
//
#define COUPON_SEARCH_TAG         @"reccp"
//区域
#define GOV_REGION_TAG            @"regiong"
// 路由器mac
#define SHOP_MAC                 @"shopmac"
// 陌广场消息
#define SQUARE_TAG               @"momts"
// wifi所有用户
#define WIFI_TAG                 @"sessclt"
// 首页商家
#define SHOP_HOME_TAG            @"shopad"
// 首页商家活动
#define SHOP_HD_TAG            @"shoppub"
// 首页用户收藏
#define USER_COLLECT_TAG            @"clientcoll"
// 首页用户足迹
#define USER_FOOTMARK_TAG            @"cltfp"
// 商家详情
#define SHOP_DETAIL_TAG            @"shopdp"
// html url
#define HELP_URL_TAG               @"stins"
// 聊天记录chats
#define CHAT_TAG                 @"chats"
// 通知路由器客户还链接着
#define NOTICE_TAG                @"noticehb"
// 获取聊过的用户
#define CHAT_PERSON_TAG          @"chatpeol"
// 删除一条聊天消息
#define CHAT_DEL_TAG             @"chatdel"
// 添加用户到群组
#define ADD_USER_GROUP            @"hxmem"
// 从群组删除用户
#define DEL_GROUP_USER             @"hxmemd"
// 修改聊天用户信息
#define UPDATE_CHAT_TAG           @"chatclt"
// 环信用户转一机通用户
#define HX_USER_INFO_TAG          @"hxcl"
//联名登录
#define LM_LOGON_TAG            @"cuserlogon"
// 回复一条广场消息
#define REPLY_TAB               @"momtrpl"
// 验证码
#define CHECK_CODER_TAG           @"smsvcode"
// 忘记密码验证码
#define WJMM_CODER_TAG           @"smsvcoder"
// 重置密码
#define RESET_PASS_TAG           @"pwdrs"
// 所有wifi商家
#define ALL_WIFI_SHOP            @"wifimp"

////////////////TAGS///////////////////////////
#define GET_CODE_TYPE_EMIAL         1
#define GET_CODE_TYPE_CELL          2
#define GET_CODE_REG_TYPE_USER      1
#define GET_CODE_REG_TYPE_SHOP_USER 2
#define GET_CODE_TYPE               2
@interface RequestConstants : NSObject

@end
