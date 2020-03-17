//
//  NSDictionary+safe.h
//  TMKit
//
//  Created by Luther on 2019/11/22.
//  Copyright © 2019 mrstock. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Safe)

- (NSString *)safeStringForKey:(id)key;

- (NSNumber *)safeNumberForKey:(id)key;

- (NSArray *)safeArrayForKey:(id)key;

- (NSDictionary *)safeDictionaryForKey:(id)key;

@end

/// 字典安全添加数据
@interface NSMutableDictionary (Safe)

- (void)safeSetObject:(id)i forKey:(NSString *)Key;

- (void)safeSetBool:(BOOL)i forKey:(NSString *)key;

- (void)safeSetInt:(int)i forKey:(NSString *)key;

- (void)safeSetInteger:(NSInteger)i forKey:(NSString *)key;

- (void)safeSetUnsignedInteger:(NSUInteger)i forKey:(NSString *)key;

- (void)safeSetChar:(char)i forKey:(NSString *)key;

- (void)safeSetFloat:(float)i forKey:(NSString *)key;

- (void)safeSetDouble:(double)i forKey:(NSString *)key;

- (void)safeSetLongLong:(long long)i forKey:(NSString *)key;

@end

@interface NSDictionary (URL)

/// 将url参数转换成NSDictionary
+ (NSDictionary *)dictionaryWithURLQuery:(NSString *)query;
/// 将NSDictionary转换成url参数
- (NSString *)URLQueryString;

@end

NS_ASSUME_NONNULL_END
