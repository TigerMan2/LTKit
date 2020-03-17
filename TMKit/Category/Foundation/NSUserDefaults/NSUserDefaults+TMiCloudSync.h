//
//  NSUserDefaults+TMiCloudSync.h
//  TMKit
//
//  Created by Luther on 2019/10/13.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (TMiCloudSync)

#pragma mark    -   value
- (void)setValue:(id)value forKey:(NSString *)key isCloudSycn:(BOOL)sycn;
- (id)valueForKey:(NSString *)key isCloudSycn:(BOOL)sycn;
- (void)removeValueForKey:(NSString *)key isCloudSycn:(BOOL)sycn;

#pragma mark    -   object
- (void)setObject:(id)value forKey:(NSString *)defaultName isCloudSycn:(BOOL)sycn;
-(id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync;
- (void)removeObjectForKey:(NSString *)defaultName isCloudSycn:(BOOL)sycn;
- (BOOL)synchronizeAlsoiCloudSync:(BOOL)sync;
@end

NS_ASSUME_NONNULL_END
