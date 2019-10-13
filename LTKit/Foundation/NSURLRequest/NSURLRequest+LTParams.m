//
//  NSURLRequest+LTParams.m
//  LTKit
//
//  Created by Luther on 2019/10/11.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSURLRequest+LTParams.h"

@implementation NSURLRequest (LTParams)

+ (NSURLRequest *)requestGETWithURL:(NSURL *)url parameters:(NSDictionary *)parameters {
    return [[self alloc] initWithURL:url parameters:parameters];
}

- (instancetype)initWithURL:(NSURL *)URL parameters:(NSDictionary *)parameters {
    if (parameters) {
        NSArray *queryStringComponents = [[self class] queryStringComponentsWithDictionaryValue:parameters];
        NSString *paramString = [queryStringComponents componentsJoinedByString:@"&"];
        if ([[URL absoluteString] rangeOfString:@"?"].location == NSNotFound) {
            URL = [NSURL URLWithString:[[URL absoluteString] stringByAppendingFormat:@"?%@",paramString]];
        } else {
            URL = [NSURL URLWithString:[[URL absoluteString] stringByAppendingFormat:@"&%@",paramString]];
        }
    }
    
    self = [self initWithURL:URL];
    if (!self) {
        return nil;
    }
    return self;
}

+ (NSArray *)queryStringComponentsFromKey:(NSString *)key value:(id)value {
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    if ([value isKindOfClass:[NSArray class]]) {
        NSAssert(value, @"必须是NSDictionary或者NSString");
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        [queryStringComponents addObjectsFromArray:[self queryStringComponentsWithDictionaryValue:value]];
    } else {
        static NSString * const kLegalURLEscapedCharacters = @"?!@#$^&%*+=,:;'\"`<>()[]{}/\\|~ ";
        NSString *valueString = [value description];
        NSString *unescapedString = [valueString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        if (unescapedString) {
            valueString = unescapedString;
        }
        NSString *escapedValue = (__bridge_transfer NSString *) CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)valueString, (CFStringRef)kLegalURLEscapedCharacters);
        NSString *component = [NSString stringWithFormat:@"%@=%@", key, escapedValue];
        [queryStringComponents addObject:component];
    }
    return queryStringComponents;
}

+ (NSArray *)queryStringComponentsWithDictionaryValue:(NSDictionary *)value {
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    [value enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull nextedKey, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray *components = [self queryStringComponentsFromKey:nextedKey value:obj];
        [queryStringComponents addObjectsFromArray:components];
    }];
    return queryStringComponents;
}

@end
