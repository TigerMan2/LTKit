//
//  CAShapeLayerConfigure.h
//  TMKit
//
//  Created by Luther on 2020/4/3.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayerConfigure : NSObject

/// Stroke width
@property (nonatomic, assign) CGFloat lineWidth;

/// Stroke color
@property (nonatomic, strong) UIColor *strokeColor;

/// Fill color
@property (nonatomic, strong) UIColor *fillColor;

- (void)configCAShapeLayer:(CAShapeLayer *)shapeLayer;

@end

NS_ASSUME_NONNULL_END
