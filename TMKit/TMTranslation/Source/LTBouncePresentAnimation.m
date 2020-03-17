//
//  LTBouncePresentAnimation.m
//  LTKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "LTBouncePresentAnimation.h"

@implementation LTBouncePresentAnimation

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    // 1. Get controllers form transitionContext
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finialFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finialFrame, 0, screenBounds.size.height);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 4. Do animation
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        toVC.view.frame = finialFrame;
    }
                     completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

@end
