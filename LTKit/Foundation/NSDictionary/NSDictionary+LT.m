//
//  NSDictionary+safe.m
//  LTKit
//
//  Created by Luther on 2019/11/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSDictionary+LT.h"

@implementation NSDictionary (Safe)

- (NSString *)safeStringForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString *)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value stringValue];
    }
    return nil;
}

- (NSNumber *)safeNumberForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString *)value];
    }
    return nil;
}

- (NSArray *)safeArrayForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}

- (NSDictionary *)safeDictionaryForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

@end

@implementation NSMutableDictionary (Safe)

- (void)safeSetObject:(id)i forKey:(NSString *)Key {
    if (i == nil || Key == nil) {
        return;
    }
    [self setObject:i forKey:Key];
}

- (void)safeSetBool:(BOOL)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetInt:(int)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetInteger:(NSInteger)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetUnsignedInteger:(NSUInteger)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetChar:(char)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetFloat:(float)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetDouble:(double)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

- (void)safeSetLongLong:(long long)i forKey:(NSString *)key {
    [self safeSetObject:@(i) forKey:key];
}

@end

@implementation NSDictionary (URL)

+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:query];
    //回调遍历所有参数，添加入字典
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dict setObject:obj.value forKey:obj.name];
    }];
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (NSString *)URLQueryString {
    NSMutableArray *params = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [params addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];
    }];
    return [params componentsJoinedByString:@"&"];
}

@end
