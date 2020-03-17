//
//  UIViewController+TM.m
//  TMKit
//
//  Created by Luther on 2019/6/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIViewController+TM.h"

@implementation UIViewController (TM)

- (BOOL)hasChildViewController {
    return self.childViewControllers.count > 0;
}

@end
