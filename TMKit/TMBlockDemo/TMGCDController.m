//
//  TMGCDController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMGCDController.h"

@interface TMGCDController ()
@property (nonatomic, strong) dispatch_group_t operaGroup;
@property (nonatomic, strong) dispatch_queue_t serialQueue;
@end

@implementation TMGCDController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.operaGroup = dispatch_group_create();
    self.serialQueue = dispatch_queue_create(0, 0);
    dispatch_group_async(self.operaGroup, self.serialQueue, ^{
        [self test];
    });
}

- (void)test {
    NSLog(@"test...");
}

- (void)dealloc
{
    NSLog(@"dealloc - %@",self);
}

@end
