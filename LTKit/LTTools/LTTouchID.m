//
//  LTTouchID.m
//  LTKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTTouchID.h"

@implementation LTTouchID

+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason completion:(void(^ _Nullable)(LTTouchIDResult result))completion {
    [self showTouchIDAuthenticationWithReason:reason fallbackTitle:nil completion:completion];
}

+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason fallbackTitle:(NSString * _Nullable)fallbackTitle completion:(void(^ _Nullable)(LTTouchIDResult result))completion {
    LAContext *context = [[LAContext alloc] init];
    
    [context setLocalizedFallbackTitle:fallbackTitle];
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:reason reply:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    completion(LTTouchIDResultSuccess);
                } else {
                    switch (error.code) {
                        case LAErrorAuthenticationFailed: //!< 验证信息出错，就是说你指纹不对
                            completion(LTTouchIDResultAuthenticationFailed);
                            break;
                        case LAErrorUserCancel: //!< 用户取消验证TouchID(点击了取消或者home键)
                            completion(LTTouchIDResultUserCancel);
                            break;
                        case LAErrorUserFallback: //!< 用户选择了输入密码
                            completion(LTTouchIDResultUserFallback);
                            break;
                        case LAErrorSystemCancel: //!< TouchID对话框被系统取消，如点击电源键
                            completion(LTTouchIDResultSystemCancel);
                            break;
                        case LAErrorAppCancel: //!< 用户不能控制情况下app被挂起
                            completion(LTTouchIDResultAppCancel);
                            break;
                        case LAErrorInvalidContext: //!< LAContext传递给这个调用之前已经失效
                            completion(LTTouchIDResultInvalidContext);
                            break;
                        case LAErrorPasscodeNotSet: //!< 设备系统未设置密码
                            completion(LTTouchIDResultPasscodeNotSet);
                            break;
                        case LAErrorTouchIDNotAvailable: //!< 设备未设置TouchID
                            completion(LTTouchIDResultTouchIDNotAvailable);
                            break;
                        case LAErrorTouchIDNotEnrolled: //!< 用户未录入指纹
                            completion(LTTouchIDResultTouchIDNotEnrolled);
                            break;
                            
                        default:
                            break;
                    }
                }
            });
        }];
    }
}

@end
