//
//  TMTouchID.m
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "TMTouchID.h"

@implementation TMTouchID

+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason completion:(void(^ _Nullable)(TMTouchIDResult result))completion {
    [self showTouchIDAuthenticationWithReason:reason fallbackTitle:nil completion:completion];
}

+ (void)showTouchIDAuthenticationWithReason:(NSString * _Nonnull)reason fallbackTitle:(NSString * _Nullable)fallbackTitle completion:(void(^ _Nullable)(TMTouchIDResult result))completion {
    LAContext *context = [[LAContext alloc] init];
    
    [context setLocalizedFallbackTitle:fallbackTitle];
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:reason reply:^(BOOL success, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    completion(TMTouchIDResultSuccess);
                } else {
                    switch (error.code) {
                        case LAErrorAuthenticationFailed: //!< 验证信息出错，就是说你指纹不对
                            completion(TMTouchIDResultAuthenticationFailed);
                            break;
                        case LAErrorUserCancel: //!< 用户取消验证TouchID(点击了取消或者home键)
                            completion(TMTouchIDResultUserCancel);
                            break;
                        case LAErrorUserFallback: //!< 用户选择了输入密码
                            completion(TMTouchIDResultUserFallback);
                            break;
                        case LAErrorSystemCancel: //!< TouchID对话框被系统取消，如点击电源键
                            completion(TMTouchIDResultSystemCancel);
                            break;
                        case LAErrorAppCancel: //!< 用户不能控制情况下app被挂起
                            completion(TMTouchIDResultAppCancel);
                            break;
                        case LAErrorInvalidContext: //!< LAContext传递给这个调用之前已经失效
                            completion(TMTouchIDResultInvalidContext);
                            break;
                        case LAErrorPasscodeNotSet: //!< 设备系统未设置密码
                            completion(TMTouchIDResultPasscodeNotSet);
                            break;
                        case LAErrorTouchIDNotAvailable: //!< 设备未设置TouchID
                            completion(TMTouchIDResultTouchIDNotAvailable);
                            break;
                        case LAErrorTouchIDNotEnrolled: //!< 用户未录入指纹
                            completion(TMTouchIDResultTouchIDNotEnrolled);
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
