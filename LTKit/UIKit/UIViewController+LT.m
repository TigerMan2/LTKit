//
//  UIViewController+LT.m
//  LTKit
//
//  Created by Luther on 2019/6/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIViewController+LT.h"

@implementation UIViewController (LT)

- (BOOL)hasChildViewController {
    return self.childViewControllers.count > 0;
}

@end
