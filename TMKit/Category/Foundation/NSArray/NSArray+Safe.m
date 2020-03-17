//
//  NSMutableArray+TMAdd.m
//  TMKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSMutableArray (Safe)

- (void)safeAddObject:(id)anObject {
    if (anObject == nil) {
        return;
    }
    [self addObject:anObject];
}

- (void)safeAddObjectsFromArray:(NSArray *)otherArray {
    if (otherArray == nil || otherArray.count <= 0) {
        return;
    }
    [self addObjectsFromArray:otherArray];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        return;
    }
    
    if (index > self.count) {
        [self safeAddObject:anObject];
        return;
    }
    [self insertObject:anObject atIndex:index];
}

@end
