//
//  NSURLRequest+LTParams.h
//  LTKit
//
//  Created by Luther on 2019/10/11.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (LTParams)

+ (NSURLRequest *)requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)parameters;
- (instancetype)initWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters;
+ (NSArray *)queryStringComponentsFromKey:(NSString *)key value:(id)value;
+ (NSArray *)queryStringComponentsWithDictionaryValue:(NSDictionary *)value;

@end

NS_ASSUME_NONNULL_END
