//
//  TMUser.m
//  TMKit
//
//  Created by Luther on 2020/4/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMUser.h"
#import "YYModel.h"

@implementation TMUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"n" : @"name"};
}

- (void)testObj {
    NSLog(@"消息转发到这里了...");
}

@end
