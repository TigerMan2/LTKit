//
//  UIButton+LTCountDown.m
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIButton+LTCountDown.h"

@implementation UIButton (LTCountDown)

- (void)startCountDownWithDefaultTitle:(NSString *)defaultTitle totalTime:(NSInteger)totalTime timeUnit:(NSString *)unit {
    self.userInteractionEnabled = NO;
    
    __block NSInteger totalTimeOut = totalTime - 1;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (totalTimeOut <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:defaultTitle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            int seconds = totalTimeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d",seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,unit] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            totalTimeOut --;
        }
    });
    dispatch_resume(timer);
}

@end
