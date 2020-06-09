//
//  TMNotificationIvarController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMNotificationIvarController.h"

@interface TMNotificationIvarController ()
@property (nonatomic, strong) NSNotificationCenter *observer;
@property (nonatomic, strong) NSString *testKey;
@end

@implementation TMNotificationIvarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _observer = [[NSNotificationCenter defaultCenter] addObserverForName:self.testKey object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.testKey = @"123";
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
