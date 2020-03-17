//
//  NSObject+TMExtension.m
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSObject+TMExtension.h"

@implementation NSObject (TMExtension)

- (UIViewController *)currentViewController {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for (UIWindow *tempWin in windows) {
            if (tempWin.windowLevel == UIWindowLevelNormal) {
                window = tempWin;
                break;
            }
        }
    }
    
    //从根控制器开始查找
    UIViewController *rootVC = window.rootViewController;
    UIViewController *activityVC = nil;
    
    while (true) {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            activityVC = [(UINavigationController *)rootVC visibleViewController];
        } else if ([rootVC isKindOfClass:[UITabBarController class]]) {
            activityVC = [(UITabBarController *)rootVC selectedViewController];
        } else if (rootVC.presentedViewController) {
            activityVC = rootVC.presentedViewController;
        }else {
            break;
        }
        
        rootVC = activityVC;
    }
    
    return activityVC;
}

@end
