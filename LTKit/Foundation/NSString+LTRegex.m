//
//  NSString+LTRegex.m
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSString+LTRegex.h"

@implementation NSString (LTRegex)

- (BOOL)isValidWithRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isValidEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidPhoneNum {
    NSString *regex = @"^(13[0-9]|14[5-9]|15[012356789]|166|17[0-8]|18[0-9]|19[0-9])[0-9]{8}$";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidCarNo {
    NSString *regex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidUrl {
    NSString *regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidPostalCode {
    NSString *regex = @"^[0-8]\\d{5}(?!\\d)$";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidChinese {
    NSString *regex = @"^[\u4e00-\u9fa5]+$";
    return [self isValidWithRegex:regex];
}

- (BOOL)isValidIP {
    NSString *regex = @"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$";
    BOOL rc = [self isValidWithRegex:regex];
    if (rc) {
        NSArray *componds = [self componentsSeparatedByString:@","];
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        return v;
    }
    return NO;
}


@end
