//
//  StrokeCircleLayerConfigure.m
//  TMKit
//
//  Created by Luther on 2020/4/3.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "StrokeCircleLayerConfigure.h"

@implementation StrokeCircleLayerConfigure

- (void)configCAShapeLayer:(CAShapeLayer *)shapeLayer {
    
    self.fillColor = [UIColor clearColor];
    
    [super configCAShapeLayer:shapeLayer];
    
    shapeLayer.bounds = CGRectMake(0, 0, (self.lineWidth + self.radius) * 2, (self.lineWidth + self.radius) * 2);
    shapeLayer.position = self.circleCenter;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.lineWidth + self.radius, self.lineWidth + self.radius)
                                                              radius:self.radius + self.lineWidth/2
                                                          startAngle:self.startAngle
                                                            endAngle:self.endAngle
                                                           clockwise:self.clockWise];
    shapeLayer.path = bezierPath.CGPath;
}

@end
