//
//  LTAlertController.m
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTAlertController.h"
#import "UIView+LTAutoLayout.h"

@interface LTAlertController ()

@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, assign) LTAlertControllerStyle preferredStyle;

@property (nonatomic, assign) LTAlertTransitionAnimation transitionAnimation;

@property (nonatomic, assign) Class transitionAnimationClass;

@property (nonatomic, weak) UITapGestureRecognizer  *singleTap;

@property (nonatomic, strong) NSLayoutConstraint *alertViewCenterYConstraint;

@property (nonatomic, assign) CGFloat alertViewCenterYOffset;

@end

@implementation LTAlertController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self configureController];
    }
    return self;
}

- (instancetype)initWithAlertView:(UIView *)alertView preferredStyle:(LTAlertControllerStyle)preferredStyle transitionAnimation:(LTAlertTransitionAnimation)transitionAnimation transitionAnimationClass:(Class)transitionAnimationClass
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _alertView = alertView;
        _preferredStyle = preferredStyle;
        _transitionAnimation = transitionAnimation;
        _transitionAnimationClass = transitionAnimationClass;
    }
    return self;
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView {
    return [[self alloc] initWithAlertView:alertView
                            preferredStyle:LTAlertControllerStyleAlert
                       transitionAnimation:LTAlertTransitionAnimationFade
                  transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LTAlertControllerStyle)preferredStyle {
    return [[self alloc] initWithAlertView:alertView
                            preferredStyle:preferredStyle
                       transitionAnimation:LTAlertTransitionAnimationFade
                  transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LTAlertControllerStyle)preferredStyle transitionAnimation:(LTAlertTransitionAnimation)transitionAnimation {
    return [[self alloc] initWithAlertView:alertView
                            preferredStyle:preferredStyle
                       transitionAnimation:transitionAnimation
                  transitionAnimationClass:nil];
}

+ (instancetype)alertControllerWithAlertView:(UIView *)alertView preferredStyle:(LTAlertControllerStyle)preferredStyle transitionAnimationClass:(Class)transitionAnimationClass {
    return [[self alloc] initWithAlertView:alertView
                            preferredStyle:preferredStyle
                       transitionAnimation:LTAlertTransitionAnimationCustom
                  transitionAnimationClass:transitionAnimationClass];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self addBackgroundView];
    
}

- (void)addBackgroundView {
    if (_backgroundView == nil) {
        UIView *backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor = _backgroundColor;
        _backgroundView = backgroundView;
    }
    _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view insertSubview:_backgroundView atIndex:0];
    [self.view addConstraintToView:_backgroundView edgeInset:UIEdgeInsetsZero];
}

#pragma mark  configure

- (void)configureController {
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
    
    _backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
    _backgroundTapDismissEnable = NO;
    _alertStyleEdging = 15;
    _actionSheetStyleEdging = 0;
}

@end
