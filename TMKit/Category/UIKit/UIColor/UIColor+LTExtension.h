//
//  UIColor+TMExtension.h
//  TMKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TMExtension)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
