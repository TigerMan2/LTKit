//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "LTFPSLabel.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LTFPSLabel *fpsLabel = [[LTFPSLabel alloc] initWithFrame:CGRectZero];
    fpsLabel.center = self.view.center;
    [self.view addSubview:fpsLabel];
    
}


@end
