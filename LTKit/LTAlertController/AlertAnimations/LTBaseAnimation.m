//
//  LTBaseAnimation.m
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTBaseAnimation.h"

@interface LTBaseAnimation ()
@property (nonatomic, assign) BOOL isPresenting;
@end

@implementation LTBaseAnimation

- (instancetype)initWithIsPresenting:(BOOL)isPresenting
{
    self = [super init];
    if (self) {
        self.isPresenting = isPresenting;
    }
    return self;
}

+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting {
    return [[self alloc] initWithIsPresenting:isPresenting];
}

+ (instancetype)alertAnimationIsPresenting:(BOOL)isPresenting preferredStyle:(LTAlertControllerStyle)preferredStyle {
    return [[self alloc] initWithIsPresenting:isPresenting];
}

//!< override this method
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    if (_isPresenting) {
        [self presentAnimationTransition:transitionContext];
    } else {
        [self dismissAnimationTransition:transitionContext];
    }
}

- (void)presentAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)dismissAnimationTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
