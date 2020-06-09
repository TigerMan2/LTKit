//
//  TMCopyManager.m
//  TMKit
//
//  Created by Luther on 2020/6/9.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMCopyManager.h"

@implementation TMCopyManager

+ (void)testCopy {
    //非集合类 NSString NSNumber
    //测试copy
    NSString *originStr = @"origin";
    NSString *originStrCopy = [originStr copy];//copy
    NSMutableString *originStrMutableCopy = [originStr mutableCopy];//mutableCopy
    
    //测试mutableCopy
    NSMutableString *mutableOriginStr = [NSMutableString stringWithString:@"mutableOrigin"];
    NSMutableString *mutableOriginStrCopy = [mutableOriginStr copy];//copy
    NSMutableString *mutableOriginStrMutableCopy = [mutableOriginStr mutableCopy];//mutableCopy
    
    /**
     非集合类总结：
        对不可变对象复制：copy是指针复制(浅拷贝)，mutableCopy是内容复制(深拷贝)。
        对可变对象复制：copy和mutableCopy都是内容复制(深拷贝)，但是copy返回的是不可变对象。
     */
    
    //集合类
    //测试copy
    NSArray *originArray = @[[NSMutableString stringWithString:@"a"],@"b",@"c"];
    NSArray *originArrayCopy = [originArray copy];//copy
    NSMutableArray *originArrayMutableCopy = [originArray mutableCopy];//mutableCopy
    
    //添加一个元素
//    [originArrayMutableCopy addObject:@"d"];
    
    //删除一个元素
//    [originArrayMutableCopy removeLastObject];
    
    //修改一个元素值
    NSMutableString *testString = [originArrayMutableCopy firstObject];
//    testString = @"a changeValue";
    [testString appendString:@" changeValue"];
    
    //测试mutableCopy
    NSMutableArray *mutableOriginArray = [[NSMutableArray alloc] initWithArray:@[@"a",@"b",@"c"] copyItems:YES];
    NSArray *mutableOriginArrayCopy = [mutableOriginArray copy];
    NSMutableArray *mutableOriginArrayMutableCopy = [mutableOriginArray mutableCopy];
    
    /**
     集合类总结：
       对不可变对象复制：copy是指针复制(浅拷贝)，mutableCopy是内容复制(深拷贝)。
       对可变对象复制：copy和mutableCopy都是内容复制(深拷贝)，但是copy返回的是不可变对象。
       与非集合类不同的是，集合内的对象都是指针复制！！！，即所谓的集合的单层深复制(one-level-deep copy)。
    */
    
    //想要实现真正意义上的深复制(即集合对象和集合内的对象都进行内容复制)，可以用下面的方法：
    //集合的深复制
    NSMutableArray *trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:mutableOriginArray]];
    
}

@end
