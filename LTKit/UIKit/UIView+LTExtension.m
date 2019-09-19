//
//  UIView+LT.m
//  LTKit
//
//  Created by Luther on 2019/6/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+LTExtension.h"

@implementation UIView (LTExtension)

@end

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

@implementation UIView (LTFrame)

- (void)setLt_x:(CGFloat)lt_x {
    CGRect frame = self.frame;
    frame.origin.x = lt_x;
    self.frame = frame;
}

- (CGFloat)lt_x {
    return self.frame.origin.x;
}

- (void)setLt_y:(CGFloat)lt_y {
    CGRect frame = self.frame;
    frame.origin.y = lt_y;
    self.frame = frame;
}

- (CGFloat)lt_y {
    return self.frame.origin.y;
}

- (void)setLt_centerX:(CGFloat)lt_centerX {
    CGPoint center = self.center;
    center.x = lt_centerX;
    self.center = center;
}

- (CGFloat)lt_centerX {
    return self.center.x;
}

- (void)setLt_centerY:(CGFloat)lt_centerY {
    CGPoint center = self.center;
    center.y = lt_centerY;
    self.center = center;
}

- (CGFloat)lt_centerY {
    return self.center.y;
}

- (void)setLt_maxX:(CGFloat)lt_maxX {
    CGRect frame = self.frame;
    frame.origin.x = lt_maxX - frame.size.width;
    self.frame = frame;
}

- (CGFloat)lt_maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)setLt_maxY:(CGFloat)lt_maxY {
    CGRect frame = self.frame;
    frame.origin.y = lt_maxY - frame.size.height;
    self.frame = frame;
}

- (CGFloat)lt_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setLt_width:(CGFloat)lt_width {
    CGRect frame = self.frame;
    frame.size.width = lt_width;
    self.frame = frame;
}

- (CGFloat)lt_width {
    return self.frame.size.width;
}

- (void)setLt_height:(CGFloat)lt_height {
    CGRect frame = self.frame;
    frame.size.height = lt_height;
    self.frame = frame;
}

- (CGFloat)lt_height {
    return self.frame.size.height;
}

- (void)setLt_size:(CGSize)lt_size {
    CGRect frame = self.frame;
    frame.size = lt_size;
    self.frame = frame;
}

- (CGSize)lt_size {
    return self.frame.size;
}

- (void)setLt_origin:(CGPoint)lt_origin {
    CGRect frame = self.frame;
    frame.origin = lt_origin;
    self.frame = frame;
}

- (CGPoint)lt_origin {
    return self.frame.origin;
}

- (CGFloat)lt_left {
    return self.frame.origin.x;
}

- (void)setLt_left:(CGFloat)lt_left {
    CGRect frame = self.frame;
    frame.origin.x = lt_left;
    self.frame = frame;
}

- (CGFloat)lt_top {
    return self.frame.origin.y;
}

- (void)setLt_top:(CGFloat)lt_top {
    CGRect frame = self.frame;
    frame.origin.y = lt_top;
    self.frame = frame;
}

- (CGFloat)lt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLt_right:(CGFloat)lt_right {
    CGRect frame = self.frame;
    frame.origin.x = lt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)lt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLt_bottom:(CGFloat)lt_bottom {
    CGRect frame = self.frame;
    frame.origin.y = lt_bottom - frame.size.height;
    self.frame = frame;
}

@end
