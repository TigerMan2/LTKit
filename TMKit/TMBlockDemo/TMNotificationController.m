//
//  TMNotificationController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMNotificationController.h"

@interface TMNotificationController ()
@property (nonatomic, strong) NSString *someProperty;
@end

@implementation TMNotificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"someProperty" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        self.someProperty = @"xyz";
    }];
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
