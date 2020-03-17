//
//  UIView+TMGradient.h
//  TMKit
//
//  Created by Luther on 2019/9/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TMGradient)

/**
 生成渐变色的view

 @param colors 颜色数组
 @param locations 坐标数组
 @param startPoint 开始位置
 @param endPoint 结束位置
 @return 渐变色的view
 */
+ (UIView *)TM_gradientViewWithColors:(NSArray <UIColor *> * _Nullable)colors
                            locations:(NSArray <NSNumber *> * _Nullable)locations
                           startPoint:(CGPoint)startPoint
                             endPoint:(CGPoint)endPoint;

/**
 给view添加渐变色

 @param colors 颜色数组
 @param locations 坐标数组
 @param startPoint 开始位置
 @param endPoint 结束位置
 */
- (void)TM_setGradientBackgroundWithColors:(NSArray <UIColor *> * _Nullable)colors
                                 loactions:(NSArray <NSNumber *> * _Nullable)locations
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
