//
//  LTAlertDorpDownAnimation.m
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTAlertDorpDownAnimation.h"

@implementation LTAlertDorpDownAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.isPresenting) {
        return 0.5;
    }
    return 0.25;
}

- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    LTAlertController *alertController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    alertController.backgroundView.alpha = 0.0;
    
    switch (alertController.preferredStyle) {
        case LTAlertControllerStyleAlert:
        {
            alertController.alertView.transform = CGAffineTransformMakeTranslation(0, -CGRectGetMaxY(alertController.alertView.frame));
        }
            break;
        case LTAlertControllerStyleActionSheet:
        {
            NSLog(@"don't support ActionSheet style!");
        }
                break;
            
        default:
            break;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.65 initialSpringVelocity:0.5 options:0 animations:^{
        alertController.backgroundView.alpha = 1.0;
        alertController.alertView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    LTAlertController *alertController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 0.0;
        switch (alertController.preferredStyle) {
            case LTAlertControllerStyleAlert:
            {
                alertController.alertView.alpha = 0.0;
                alertController.alertView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            }
                break;
            case LTAlertControllerStyleActionSheet:
            {
                NSLog(@"don't support ActionSheet style!");
            }
                    break;
                
            default:
                break;
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
