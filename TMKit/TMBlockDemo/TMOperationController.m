//
//  TMOperationController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMOperationController.h"

@interface TMOperationController ()
@property (nonatomic, strong) NSString *someProperty;
@end

@implementation TMOperationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.someProperty = @"xyz";
    }];
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
