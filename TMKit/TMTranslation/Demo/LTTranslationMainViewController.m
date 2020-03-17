//
//  LTTranslationMainViewController.m
//  LTKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "LTTranslationMainViewController.h"
#import "LTTranslationModalViewController.h"
#import "LTBouncePresentAnimation.h"
#import "LTNormalDismissAnimation.h"
#import "LTSwipeUpInteractiveTransition.h"

@interface LTTranslationMainViewController () <UIViewControllerTransitioningDelegate,LTTranslationModalViewControllerDelegate>
@property (nonatomic, strong) LTBouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) LTNormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) LTSwipeUpInteractiveTransition *transitionController;
@end

@implementation LTTranslationMainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _presentAnimation = [LTBouncePresentAnimation new];
        _dismissAnimation = [LTNormalDismissAnimation new];
        _transitionController = [LTSwipeUpInteractiveTransition new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setupSubviews];
}

- (void)setupSubviews {
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.frame = CGRectMake(0, 0, 160, 40);
    clickButton.center = self.view.center;
    [clickButton setTitle:@"click me" forState:UIControlStateNormal];
    [clickButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickButton];
}

- (void)buttonClick:(UIButton *)sender {
    LTTranslationModalViewController *modalVC = [[LTTranslationModalViewController alloc] init];
    modalVC.transitioningDelegate = self;
    modalVC.delegate = self;
    [self.transitionController wireToViewController:modalVC];
    [self presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark  LTTranslationModalViewControllerDelegate
- (void)modalViewControllerDidClickedDismissButton:(LTTranslationModalViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark  UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

@end
