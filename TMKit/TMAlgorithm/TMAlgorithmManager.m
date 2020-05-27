//
//  TMAlgorithmManager.m
//  TMKit
//
//  Created by Luther on 2020/5/25.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMAlgorithmManager.h"

@implementation TMAlgorithmManager

+ (void)bubbleSort {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@3,@44,@38,@5,@47,@15,@36,@26,@27,@2,@46,@4,@19,@50,@49]];
    BOOL swapped = NO;
    do {
        swapped = NO;
        for (int i = 1; i < array.count; i++) {
            NSInteger num1 = [array[i-1] integerValue];
            NSInteger num2 = [array[i] integerValue];
            if (num1 >num2) {
                [array replaceObjectAtIndex:i-1 withObject:[NSNumber numberWithInteger:num2]];
                [array replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:num1]];
                swapped = YES;
            }
        }
    } while (swapped);
    NSLog(@"冒的排序:%@",array);
}

@end
