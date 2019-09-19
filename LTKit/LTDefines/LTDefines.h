//
//  LTDefines.h
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#ifndef LTDefines_h
#define LTDefines_h

/** 设备信息 */
#define UIDEVICE_NAME               [[UIDevice currentDevice] name]
#define UIDEVICE_SYSTEMNAME         [[UIDevice currentDevice] systemName]
#define UIDEVICE_VERSION            [[[UIDevice currentDevice] systemVersion] floatValue]
#define UIDEVICE_ISIPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** APP信息 */
#define APP_DELEGATE                ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define APP_VERSION                 [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD                   [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_NAME                    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/** 系统控件默认高度 */
#define STATUSBAR_HEIGHT            [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVIGATIONBAR_HEIGHT        (44.f)
#define TOPNAVHEIGHT                (STATUSBAR_HEIGHT + NAVIGATIONBAR_HEIGHT)
#define TABBAR_HEIGHT               (STATUSBAR_HEIGHT>20? 83.f:49.f)

/** 设备宽度和高度 */
#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height

/** 简写rgb颜色 */
#define RGB(r,g,b)                  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#define RGBA(r,g,b,a)               [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/** 弱引用 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

/** 是否是空对象 */
#define ISEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/** 不同屏幕尺寸，字体适配 */
#define kScreenWidthRatio               ([[UIScreen mainScreen] bounds].size.width / 375.0)
#define kScreenHeightRatio              ([[UIScreen mainScreen] bounds].size.height / 375.0)

/** 弧度角度转换 */
//角度转换弧度
#define DegreesToRadian(x)              (M_PI * (x) / 180.0)
//弧度转换角度
#define RadianToDegrees(radian)         (radian * 180.0) / (M_PI)

/** 获取系统时间戳 **/
#define getCurentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

/** 获取图片 **/
#define UIImage_str(str) [UIImage imageNamed:str]


#endif /* LTDefines_h */
