//
//  TMTranslationMainViewController.m
//  TMKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMTranslationMainViewController.h"
#import "TMTranslationModalViewController.h"
#import "TMBouncePresentAnimation.h"
#import "TMNormalDismissAnimation.h"
#import "TMSwipeUpInteractiveTransition.h"

@interface TMTranslationMainViewController () <UIViewControllerTransitioningDelegate,TMTranslationModalViewControllerDelegate>
@property (nonatomic, strong) TMBouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) TMNormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) TMSwipeUpInteractiveTransition *transitionController;
@end

@implementation TMTranslationMainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _presentAnimation = [TMBouncePresentAnimation new];
        _dismissAnimation = [TMNormalDismissAnimation new];
        _transitionController = [TMSwipeUpInteractiveTransition new];
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
    TMTranslationModalViewController *modalVC = [[TMTranslationModalViewController alloc] init];
    modalVC.transitioningDelegate = self;
    modalVC.delegate = self;
    [self.transitionController wireToViewController:modalVC];
    [self presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark  TMTranslationModalViewControllerDelegate
- (void)modalViewControllerDidClickedDismissButton:(TMTranslationModalViewController *)viewController {
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
