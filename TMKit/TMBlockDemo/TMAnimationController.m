//
//  TMAnimationController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMAnimationController.h"

@interface TMAnimationController ()

@end

@implementation TMAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [UIView animateWithDuration:3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
