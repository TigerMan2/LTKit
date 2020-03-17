//
//  UIView+TMCorners.m
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+TMCorners.h"

@implementation UIView (TMCorners)

#pragma mark    -   public method
- (void)tm_useBezierPathClipCornerWithTMLayoutCornerRadiusType:(TMLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius {
    [self tm_makeCornerWithMaskPath:[self tm_bezierPathWithTMLayoutCornerRadiusType:type cornerRadius:cornerRadius]];
}

- (void)tm_userBezierPathClipCornerWithTMLayoutCornerRadiusType:(TMLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = borderWidth;
    shapeLayer.path = [self tm_bezierPathWithTMLayoutCornerRadiusType:type cornerRadius:cornerRadius].CGPath;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    [self tm_useBezierPathClipCornerWithTMLayoutCornerRadiusType:type cornerRadius:cornerRadius];
}

#pragma mark    -    private method
//!< 添加边框
- (void)tm_userCALayerMakeBorderLineWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}
//!< 根据不同类型获取UIBezierPath
- (UIBezierPath *)tm_bezierPathWithTMLayoutCornerRadiusType:(TMLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath *maskPath;
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    
    switch (type) {
        case TMLayoutCornerRadiusAll:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusExceptTopLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusExceptTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusExceptBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusExceptBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusTop:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusBottom:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusTopLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusTopLeftToBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case TMLayoutCornerRadiusTopRightToBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
            
        default:
            break;
    }
    
    return maskPath;
}

- (void)tm_makeCornerWithMaskPath:(UIBezierPath *)maskPath {
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
