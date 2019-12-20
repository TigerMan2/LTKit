//
//  NSUserDefaults+LTiCloudSync.m
//  LTKit
//
//  Created by Luther on 2019/10/13.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSUserDefaults+LTiCloudSync.h"

@implementation NSUserDefaults (LTiCloudSync)

#pragma mark    -   value
- (void)setValue:(id)value forKey:(NSString *)key isCloudSycn:(BOOL)sycn {
    if (sycn) {
        [[NSUbiquitousKeyValueStore defaultStore] setValue:value forKey:key];
    }
    [self setValue:value forKey:key];
}

- (id)valueForKey:(NSString *)key isCloudSycn:(BOOL)sycn {
    if (sycn) {
        id value = [[NSUbiquitousKeyValueStore defaultStore] valueForKey:key];
        [self setValue:value forKey:key];
        [self synchronize];
        return value;
    }
    return [self valueForKey:key];
}

- (void)removeValueForKey:(NSString *)key isCloudSycn:(BOOL)sycn {
    [self removeValueForKey:key isCloudSycn:sycn];
}

#pragma mark    -   object
- (void)setObject:(id)value forKey:(NSString *)defaultName isCloudSycn:(BOOL)sycn {
    if (sycn) {
        [[NSUbiquitousKeyValueStore defaultStore] setObject:value forKey:defaultName];
    }
    [self setObject:value forKey:defaultName];
}

-(id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync{
    if (sync){
        id value = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];
        [self setObject:value forKey:key];
        [self synchronize];
        return value;
    }
    
    return [self objectForKey:key];
}

- (void)removeObjectForKey:(NSString *)defaultName isCloudSycn:(BOOL)sycn {
    if (sycn) {
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:defaultName];
    }
    [self removeObjectForKey:defaultName];
}

- (BOOL)synchronizeAlsoiCloudSync:(BOOL)sync{
    BOOL res = true;
    if (sync)
        res &= [self synchronize];
    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    return res;
}

@end
