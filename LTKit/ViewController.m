//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "LTDefines.h"
#import "DemoViewController.h"
#import "UIAlertController+Blocks.h"
#import "LTView.h"
#import "UIView+LTExtension.h"
#import "UIView+LTGradient.h"
#import "UIView+LTTouch.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, assign) BOOL isTrans;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.myView.frame = CGRectMake(0, 0, 300, 300);
    [self.view addSubview:self.myView];
    [self.myView lt_setTouchAction:^(UIView * _Nonnull view) {
        self.isTrans = !self.isTrans;
        if (self.isTrans) {
            [view.layer setAffineTransform:CGAffineTransformMakeScale(0.5, 0.5)];
        } else {
            [view.layer setAffineTransform:CGAffineTransformIdentity];
        }
        
    }];
    
}

- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] init];
        [_myView lt_setGradientBackgroundWithColors:@[
                                                   (id)[UIColor colorWithRed:8.0f/255.0f green:9.0f/255.0f blue:18.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:17.0f/255.0f green:20.0f/255.0f blue:32.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:26.0f/255.0f green:31.0f/255.0f blue:45.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:8.0f/255.0f green:9.0f/255.0f blue:18.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:17.0f/255.0f green:20.0f/255.0f blue:32.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:26.0f/255.0f green:31.0f/255.0f blue:45.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:17.0f/255.0f green:20.0f/255.0f blue:32.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:8.0f/255.0f green:9.0f/255.0f blue:18.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:26.0f/255.0f green:31.0f/255.0f blue:45.0f/255.0f alpha:1.0f],
                                                   (id)[UIColor colorWithRed:8.0f/255.0f green:9.0f/255.0f blue:18.0f/255.0f alpha:1.0f]]
                                       loactions:@[@(0.0), @(0.11), @(0.18), @(0.29), @(0.42), @(0.55), @(0.63), @(0.75), @(0.89), @(1.0)]
                                      startPoint:CGPointMake(1, 1)
                                        endPoint:CGPointMake(0, 0)];
        _myView.center = self.view.center;
    }
    return _myView;
}

@end
