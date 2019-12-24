//
//  LTBaseAnimation.h
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTAlertController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LTBaseAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, readonly) BOOL isPresenting; //!< 是否是present

+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting;

/// 只支持LTAlertControllerStyleAlert
+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting preferredStyle:(LTAlertControllerStyle)preferredStyle;


/// override transition time
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext;

/// present
- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

/// dismiss
- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext;

@end

NS_ASSUME_NONNULL_END
