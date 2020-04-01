//
//  TMButtonPressViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/31.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMButtonPressViewController.h"
#import "TMPressScaleButton.h"

@interface TMButtonPressViewController ()

@end

@implementation TMButtonPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    TMPressScaleButton *button = [[TMPressScaleButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.target  = self;
    button.selector = @selector(clickEvent);
    button.center = self.view.center;
    [self.view addSubview:button];
    
}

- (void)clickEvent {
    NSLog(@"点击按钮了...");
}

@end
