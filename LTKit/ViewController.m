//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
#import "UIViewController+LNPopupSupport.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    DemoViewController* demoVC = [DemoViewController new];
    demoVC.view.backgroundColor = [UIColor redColor];
    [self presentPopupBarWithContentViewController:demoVC animated:YES completion:nil];
}

@end
