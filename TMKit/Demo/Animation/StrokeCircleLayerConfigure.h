//
//  StrokeCircleLayerConfigure.h
//  TMKit
//
//  Created by Luther on 2020/4/3.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "CAShapeLayerConfigure.h"

NS_ASSUME_NONNULL_BEGIN

@interface StrokeCircleLayerConfigure : CAShapeLayerConfigure

/// CAShapeLayer's position.
@property (nonatomic, assign) CGPoint circleCenter;

@property (nonatomic, assign) CGFloat radius;

/// 开始角度
@property (nonatomic, assign) CGFloat startAngle;

/// 结束角度
@property (nonatomic, assign) CGFloat endAngle;

/// 顺时针
@property (nonatomic, assign) BOOL clockWise;

@end

NS_ASSUME_NONNULL_END
