//
//  TMUser.h
//  TMKit
//
//  Created by Luther on 2020/4/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

__attribute__((objc_subclassing_restricted)) // 不可被继承的标志
@interface TMUser : NSObject

@property (nonatomic, assign) UInt64 uid;
@property (nonatomic, strong) NSString *n;
@property (nonatomic, strong) NSDate *created;

- (void)testObj;

@end

NS_ASSUME_NONNULL_END
