//
//  LTAlertView.m
//  LTKit
//
//  Created by Luther on 2019/12/15.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTAlertView.h"

@interface LTAlertView ()
@property (nonatomic, copy) LTShowAnimationCompletionBlock showAnimationCompletionBlock;
@end

@implementation LTAlertView

#pragma mark  Show Animation
- (void)fadeIn {
    
    self.alpha = 0.0f;
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                        self.alpha = 1.0f;
                     }
                     completion:^(BOOL finished) {
                        if (self.showAnimationCompletionBlock) {
                            self.showAnimationCompletionBlock();
                        }
                     }];
}

- (void)slideInFormTop {
    
}

#pragma mark  Dissmiss Animation

@end
