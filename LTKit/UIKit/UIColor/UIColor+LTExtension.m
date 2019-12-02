//
//  UIColor+LTExtension.m
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIColor+LTExtension.h"

@implementation UIColor (LTExtension)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    return [self colorWithHexString:hexString alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    
    //!< 删除字符串中的空格
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] uppercaseString];
    
    //!< hexString should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    //!< 如果是0x开头的，则从位置2截取字符串
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    //!< 如果是#开头的，则从位置1截取字符串
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    //!< 获取r, g, b
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //!< scan r, g, b
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
