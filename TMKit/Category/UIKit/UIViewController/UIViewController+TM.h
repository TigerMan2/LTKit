//
//  UIViewController+TM.h
//  TMKit
//
//  Created by Luther on 2019/6/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TM)

/**
 是否含有子控制器

 @return 是否含有
 */
- (BOOL)hasChildViewController;

@end

NS_ASSUME_NONNULL_END
