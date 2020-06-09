//
//  TMRuntimeManager.m
//  TMKit
//
//  Created by Luther on 2020/4/22.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMRuntimeManager.h"
#import <objc/runtime.h>
#import "TMFather.h"
#import "TMSon.h"

@implementation TMRuntimeManager

+ (instancetype)shareManager {
    static TMRuntimeManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TMRuntimeManager alloc] init];
    });
    return _manager;
}

- (void)testRuntime {
    // 1.获取类名
    const char *clsName = class_getName([TMSon class]);
    NSLog(@"class_getName:%s",clsName);
    
    // 2.获取父类
    {
        //TMFather -> NSObject
        Class superCls = class_getSuperclass([TMFather class]);
        NSLog(@"TMFather superClass:%@",superCls);
    }
    {
        //TMSon -> TMFather
        Class superCls = class_getSuperclass([TMSon class]);
        NSLog(@"TMSon superClass:%@",superCls);
    }
    
    // 3.是否是元类
    {
        BOOL isMetaCls = class_isMetaClass([NSObject class]);
        NSLog(@"NSObject isMetaClass:%d",isMetaCls);
    }
    {
        BOOL isMetaCls = class_isMetaClass([TMFather class]);
        NSLog(@"TMFather isMetaClass:%d",isMetaCls);
    }
    {
        BOOL isMetaCls = class_isMetaClass([TMSon class]);
        NSLog(@"TMSon isMetaClass:%d",isMetaCls);
    }
    
    // 4.类实例大小
    size_t clsSize = class_getInstanceSize([TMSon class]);
    NSLog(@"class_getInstanceSize:%zu",clsSize);
    
    // 5.获取指定类的指定实例成员变量的Ivar
    Ivar ivar1 = class_getInstanceVariable([TMSon class], "_name");
    const char *ivarName1 = ivar_getName(ivar1);
    NSLog(@"ivarName1:%s",ivarName1);
    
    // 6.获取类成员变量的Ivar class_getClassVariable
    // 目前Objective-C不支持类变量
    
    // 7.获取实例变量数组
    {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([TMFather class], &count);
        if (ivars) {
            NSLog(@"TMFather ivar count:%d",count);
            free(ivars);
        }
    }
    {
        unsigned int count = 0;
        class_copyIvarList([TMSon class], &count);
        NSLog(@"TMSon ivar count:%d",count);
    }
    
    // 8.ivar的布局描述
    // class_getIvarLayout获取到的是用strong修饰的变量
    {
        const uint8_t *ivarLayout = class_getIvarLayout([TMFather class]);
        NSLog(@"ivarLayout:%s",ivarLayout);
    }
    {
        const uint8_t *ivarLayout = class_getIvarLayout([TMSon class]);
        NSLog(@"ivarLayout:%s",ivarLayout);
    }
    
    // 9.弱ivar的布局描述
    // class_getWeakIvarLayout获取到的是用weak修饰的变量
    {
        const uint8_t *ivarLayout = class_getWeakIvarLayout([TMFather class]);
        NSLog(@"ivarLayout:%s",ivarLayout);
    }
    {
        const uint8_t *ivarLayout = class_getWeakIvarLayout([TMSon class]);
        NSLog(@"ivarLayout:%s",ivarLayout);
    }
    
    // 10.获取property声明的属性
    {
        objc_property_t property = class_getProperty([TMSon class], "name");
        if (property) {
            const char *name = property_getName(property);
            NSLog(@"property name:%s",name);
        }
    }
    
    // 11.获取所有property声明的属性
    {
        unsigned int count = 0;
        objc_property_t *propertys = class_copyPropertyList([TMSon class], &count);
        if (propertys) {
            NSLog(@"TMSon property count:%d",count);
            free(propertys);
        }
    }
    
    // 12.给类添加方法
    {
        SEL sel = @selector(test);
        BOOL addMethod = class_addMethod([TMRuntimeManager class], sel, class_getMethodImplementation([TMRuntimeManager class], sel), "v@:");
        NSLog(@"TMSon addMethod:%d",addMethod);
        
        [TMRuntimeManager performSelector:sel];
    }
    
    // 13.获取实例方法
    {
        Method method = class_getInstanceMethod([TMRuntimeManager class], @selector(setup));
        NSLog(@"method name:%@",NSStringFromSelector(method_getName(method)));
    }
    {
        // 用class_getInstanceMethod获取类方法，则返回null
        Method method = class_getInstanceMethod([TMRuntimeManager class], @selector(initValue));
        NSLog(@"method name:%@",NSStringFromSelector(method_getName(method)));
    }
    
    // 14.获取类方法
    {
        Method method = class_getClassMethod([TMRuntimeManager class], @selector(initValue));
        NSLog(@"method name:%@",NSStringFromSelector(method_getName(method)));
    }
    {
        // 用class_getClassMethod获取实例方法，则返回null
        Method method = class_getClassMethod([TMRuntimeManager class], @selector(setup));
        NSLog(@"method name:%@",NSStringFromSelector(method_getName(method)));
    }
    
    // 15.获取所有方法
    {
        unsigned int count = 0;
        Method *methods = class_copyMethodList([TMRuntimeManager class], &count);
        NSLog(@"TMRuntimeManager method count:%d",count);
        if (methods) {
            for (unsigned int i = 0; i < count; i ++) {
                Method method = methods[i];
                NSLog(@"method name:%@",NSStringFromSelector(method_getName(method)));
            }
            free(methods);
        }
    }

}

+ (void)test {
    NSLog(@"test 方法！！！");
}

- (void)setup {
    NSLog(@"实例方法!!!");
}

+ (void)initValue {
    NSLog(@"类方法!!!");
}

@end
