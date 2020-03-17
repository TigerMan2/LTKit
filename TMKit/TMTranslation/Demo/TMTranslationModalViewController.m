//
//  TMTranslationModalViewController.m
//  TMKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMTranslationModalViewController.h"

@interface TMTranslationModalViewController ()

@end

@implementation TMTranslationModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupSubviews];
}

- (void)setupSubviews {
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.frame = CGRectMake(0, 0, 160, 40);
    clickButton.center = self.view.center;
    [clickButton setTitle:@"dismiss me" forState:UIControlStateNormal];
    [clickButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickButton];
}

- (void)buttonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
}

@end
