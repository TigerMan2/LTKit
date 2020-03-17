//
//  TMTouchID.h
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TMTouchIDResult) {
    TMTouchIDResultSuccess = 0,                 //!< 验证成功
    TMTouchIDResultAuthenticationFailed,        //!< 验证信息出错，就是说你指纹不对
    TMTouchIDResultUserCancel,                  //!< 用户取消验证TouchID(点击了取消或者home键)
    TMTouchIDResultUserFallback,                //!< 用户选择了输入密码
    TMTouchIDResultSystemCancel,                //!< TouchID对话框被系统取消，如点击电源键
    TMTouchIDResultAppCancel,                   //!< 用户不能控制情况下app被挂起
    TMTouchIDResultInvalidContext,              //!< LAContext传递给这个调用之前已经失效
    TMTouchIDResultPasscodeNotSet,              //!< 设备系统未设置密码
    TMTouchIDResultTouchIDNotAvailable,         //!< 设备未设置TouchID
    TMTouchIDResultTouchIDNotEnrolled           //!< 用户未录入指纹
};

/** 设备指纹解锁密码工具类 */
@interface TMTouchID : NSObject

/**
 弹出指纹解锁

 @param reason 副标题
 @param completion 结果
 */
+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason completion:(void(^ _Nullable)(TMTouchIDResult result))completion;

/**
 弹出指纹解锁

 @param reason 副标题
 @param fallbackTitle 指纹验证错误后第二个按钮的文字
 @param completion 结果
 */
+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason fallbackTitle:(NSString * _Nullable)fallbackTitle completion:(void(^ _Nullable)(TMTouchIDResult result))completion;

@end

NS_ASSUME_NONNULL_END
