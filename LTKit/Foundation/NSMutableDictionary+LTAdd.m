//
//  NSMutableDictionary+LTAdd.m
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSMutableDictionary+LTAdd.h"

@implementation NSMutableDictionary (LTAdd)

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject == nil || aKey == nil) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end
