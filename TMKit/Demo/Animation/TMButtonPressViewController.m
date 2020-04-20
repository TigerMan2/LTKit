//
//  TMButtonPressViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/31.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMButtonPressViewController.h"
#import "TMPressScaleButton.h"
#import "StrokeCircleLayerConfigure.h"

@interface TMButtonPressViewController () <TMPOPScaleControlDelegate>

@property (nonatomic, strong) CAShapeLayer *shapeLayer1;
@property (nonatomic, strong) CAShapeLayer *shapeLayer2;

@end

@implementation TMButtonPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    TMPressScaleButton *button = [[TMPressScaleButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.target  = self;
    button.delegate = self;
    button.center = self.view.center;
    button.selector = @selector(clickEvent);
    [self.view addSubview:button];
    
    {
        self.shapeLayer1 = [CAShapeLayer layer];
        self.shapeLayer1.strokeEnd = 0.f;
        StrokeCircleLayerConfigure *configure = [StrokeCircleLayerConfigure new];
        configure.lineWidth = 0.5;
        configure.startAngle = 0.f;
        configure.endAngle = M_PI * 2;
        configure.radius = 60;
        configure.circleCenter = self.view.center;
        [configure configCAShapeLayer:self.shapeLayer1];
        [self.view.layer addSublayer:self.shapeLayer1];
    }
    {
        self.shapeLayer2 = [CAShapeLayer layer];
        self.shapeLayer2.strokeEnd = 0.f;
        StrokeCircleLayerConfigure *configure = [StrokeCircleLayerConfigure new];
        configure.lineWidth = 0.5;
        configure.startAngle = 0.f;
        configure.endAngle = M_PI * 2;
        configure.radius = 62;
        configure.clockWise = YES;
        configure.circleCenter = self.view.center;
        [configure configCAShapeLayer:self.shapeLayer2];
        [self.view.layer addSublayer:self.shapeLayer2];
    }
    
}

- (void)POPControl:(TMPOPScaleControl *)control currentPrecent:(CGFloat)precent {
    [CATransaction setDisableActions:YES];
    self.shapeLayer1.strokeEnd = precent;
    self.shapeLayer2.strokeEnd = precent;
    [CATransaction setDisableActions:NO];
}

- (void)clickEvent {
    NSLog(@"点击按钮了...");
}

@end
