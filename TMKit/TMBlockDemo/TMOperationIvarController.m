//
//  TMOperationIvarController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMOperationIvarController.h"

@interface TMOperationIvarController ()
@property (nonatomic, strong) NSOperationQueue *mainQueue;
@end

@implementation TMOperationIvarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
