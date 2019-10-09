//
//  NSMutableArray+LTAdd.h
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 数组安全添加数据
@interface NSMutableArray (LTAdd)

- (void)safeAddObject:(id)anObject;

- (void)safeAddObjectsFromArray:(NSArray *)otherArray;

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
