//
//  TMRunLoopManager.m
//  TMKit
//
//  Created by Luther on 2020/4/23.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMRunLoopManager.h"

@implementation TMRunLoopManager

+ (instancetype)shareManager {
    static TMRunLoopManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TMRunLoopManager alloc] init];
    });
    return _manager;
}

- (void)testRunLoop {
    {
        NSThread *thread = [NSThread currentThread];
        NSLog(@"currentThread:%@",thread);
    }
    {
        NSThread *thread = [NSThread mainThread];
        NSLog(@"mainThread:%@",thread);
    }
    
    {
        CFRunLoopRef runloop = CFRunLoopGetMain();
        NSLog(@"CFRunLoopGetMain:%@",runloop);
    }
    
    {
        CFRunLoopRef runloop = CFRunLoopGetCurrent();
        NSLog(@"CFRunLoopGetCurrent:%@",runloop);
    }
}

@end
