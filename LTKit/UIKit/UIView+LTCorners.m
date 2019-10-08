//
//  UIView+LTCorners.m
//  LTKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+LTCorners.h"

@implementation UIView (LTCorners)

#pragma mark    -   public method
- (void)lt_useBezierPathClipCornerWithLTLayoutCornerRadiusType:(LTLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius {
    [self lt_makeCornerWithMaskPath:[self lt_bezierPathWithLTLayoutCornerRadiusType:type cornerRadius:cornerRadius]];
}

- (void)lt_userBezierPathClipCornerWithLTLayoutCornerRadiusType:(LTLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius color:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = borderWidth;
    shapeLayer.path = [self lt_bezierPathWithLTLayoutCornerRadiusType:type cornerRadius:cornerRadius].CGPath;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    [self lt_useBezierPathClipCornerWithLTLayoutCornerRadiusType:type cornerRadius:cornerRadius];
}

#pragma mark    -    private method
//!< 添加边框
- (void)lt_userCALayerMakeBorderLineWithColor:(UIColor *)color borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
}
//!< 根据不同类型获取UIBezierPath
- (UIBezierPath *)lt_bezierPathWithLTLayoutCornerRadiusType:(LTLayoutCornerRadiusType)type cornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath *maskPath;
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    
    switch (type) {
        case LTLayoutCornerRadiusAll:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusExceptTopLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusExceptTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusExceptBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusExceptBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusTop:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusBottom:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusTopLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusTopLeftToBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
        }
            break;
        case LTLayoutCornerRadiusTopRightToBottomLeft:
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

- (void)lt_makeCornerWithMaskPath:(UIBezierPath *)maskPath {
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
