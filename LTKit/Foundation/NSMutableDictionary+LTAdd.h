//
//  NSMutableDictionary+LTAdd.h
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 字典安全添加数据
@interface NSMutableDictionary (LTAdd)

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end

NS_ASSUME_NONNULL_END
