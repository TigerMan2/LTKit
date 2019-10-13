//
//  NSString+LTEncrypt.m
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSString+LTEncrypt.h"
#import "NSData+LTEncrypt.h"

@implementation NSString (LTEncrypt)

- (NSString *)md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md2String];
}

- (NSString *)md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md4String];
}

- (NSString *)md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

- (NSString *)sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1String];
}

- (NSString *)sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha224String];
}

- (NSString *)sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha256String];
}

- (NSString *)sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha384String];
}

- (NSString *)sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha512String];
}

@end
