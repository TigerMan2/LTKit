//
//  TMModelManager.m
//  TMKit
//
//  Created by Luther on 2020/4/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMModelManager.h"
#import "TMUser.h"
#import "YYModel.h"

@implementation TMModelManager
- (void)test {
    /**
     * 执行的是类方法'isKindOfClass'和'isMemberOfClass',而不是实例方法.
     * 类方法'isKindOfClass'和'isMemberOfClass'
     + (BOOL)isMemberOfClass:(Class)cls {
          return object_getClass((id)self) == cls;
        }
     + (BOOL)isKindOfClass:(Class)cls {
         for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->super_class) {
             if(tcls == cls) return YES;
         }
         return NO；
     }
     *     object_getClass()是获取'isa'指针指向的类，而类指针指向的类是该类的meta class(元类).
     */
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res3 = [(id)[TMUser class] isKindOfClass:[TMUser class]];
    BOOL res4 = [(id)[TMUser class] isMemberOfClass:[TMUser class]];
    
    NSLog(@"res1-%d,res2-%d,res3-%d,res4-%d",res1,res2,res3,res4);
}

+ (instancetype)shareManager {
    static TMModelManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TMModelManager alloc] init];
        _manager.user = [[TMUser alloc] init];
    });
    return _manager;
}

- (void)tm_jsonToModel {
    
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"demo" ofType:@"json"]];
    
    TMUser *user = [TMUser yy_modelWithJSON:JSONData];
    NSLog(@"user----%@",user);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"selName -- %@",NSStringFromSelector(sel));
//    if ([NSStringFromSelector(sel) isEqualToString:@"testObj"]) {
//        class_addMethod([self class], sel, method_getImplementation(class_getInstanceMethod([self class], @selector(exchangeTestObj))), "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"testObj1"]) {
        return [[TMUser alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([_user respondsToSelector:aSelector]) {
            signature = [_user methodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([_user respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:_user];
    }
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"无法识别%@方法",NSStringFromSelector(aSelector));
}

- (void)exchangeTestObj {
    NSLog(@"消息拦截的地方...");
}

- (void)signatureObj {
    NSLog(@"消息的签名方法...");
}

@end
