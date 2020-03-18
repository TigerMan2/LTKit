//
//  TMDragViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/17.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMDragViewController.h"
#import "TMDragView.h"

@interface TMDragViewController ()
@property (nonatomic, strong) TMDragView *dragView;
@end

@implementation TMDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dragView = [[TMDragView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    self.dragView.center = self.view.center;
    self.dragView.isKeepBounds = YES;
    self.dragView.stayAlpha = 0.4;
    self.dragView.freeRect = (CGRect){CGPointMake(5, 69),CGSizeMake(self.view.frame.size.width - 10, self.view.frame.size.height - 74)};
    [self.view addSubview:self.dragView];
}

@end
