//
//  CAShapeLayerConfigure.m
//  TMKit
//
//  Created by Luther on 2020/4/3.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "CAShapeLayerConfigure.h"

@implementation CAShapeLayerConfigure

- (void)configCAShapeLayer:(CAShapeLayer *)shapeLayer {
    shapeLayer.lineWidth = self.lineWidth;
    shapeLayer.strokeColor = (self.strokeColor.CGColor ? self.strokeColor.CGColor : [UIColor whiteColor].CGColor);
    shapeLayer.fillColor = (self.fillColor.CGColor ? self.fillColor.CGColor : [UIColor blackColor].CGColor);;
}

@end
