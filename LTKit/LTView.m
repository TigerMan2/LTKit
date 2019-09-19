//
//  LTView.m
//  LTKit
//
//  Created by Luther on 2019/6/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self clipCorner];
    }
    return self;
}

- (void)setupUI {
    
}

- (void)clipCorner {
    
    UIBezierPath *maskPath;
    CGSize cornerSize = CGSizeMake(10, 10);
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:cornerSize];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = maskPath.CGPath;
    shapeLayer.lineWidth = 5;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


@end
