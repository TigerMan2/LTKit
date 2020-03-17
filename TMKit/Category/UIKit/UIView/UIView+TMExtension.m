//
//  UIView+TM.m
//  TMKit
//
//  Created by Luther on 2019/6/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+TMExtension.h"

@implementation UIView (TMExtension)

- (UIViewController *)viewController {
    UIResponder *nextResponder = self;
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    } while (nextResponder != nil);
    return nil;
}

@end
