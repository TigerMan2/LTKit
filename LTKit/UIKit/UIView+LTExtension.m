//
//  UIView+LT.m
//  LTKit
//
//  Created by Luther on 2019/6/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+LTExtension.h"

@implementation UIView (LTExtension)

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
