//
//  LTAlertScaleFadeAnimation.m
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTAlertScaleFadeAnimation.h"

@implementation LTAlertScaleFadeAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    LTAlertController *alertController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    alertController.backgroundView.alpha = 0.0;
    switch (alertController.preferredStyle) {
        case LTAlertControllerStyleAlert:
        {
            alertController.alertView.alpha = 0.0;
            alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        }
            break;
        case LTAlertControllerStyleActionSheet:
        {
            alertController.alertView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.alertView.frame));
        }
                break;
            
        default:
            break;
    }
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:alertController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        alertController.backgroundView.alpha = 1.0;
        switch (alertController.preferredStyle) {
            case LTAlertControllerStyleAlert:
            {
                alertController.alertView.alpha = 1.0;
                alertController.alertView.transform = CGAffineTransformIdentity;
            }
                break;
            case LTAlertControllerStyleActionSheet:
            {
                alertController.alertView.transform = CGAffineTransformIdentity;
            }
                    break;
                
            default:
                break;
        }
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
                    alertController.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
                }
                break;
            case LTAlertControllerStyleActionSheet:
                {
                    alertController.alertView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(alertController.alertView.frame));
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
