//
//  main.m
//  TMKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"main");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

__attribute__((constructor)) static void beforeFunction()
{
    NSLog(@"beforeFunction");
}
