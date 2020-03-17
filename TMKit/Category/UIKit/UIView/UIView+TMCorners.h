//
//  UIView+TMCorners.h
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TMCorners)

typedef NS_ENUM(NSUInteger, TMLayoutCornerRadiusType) {
    //切全部
    TMLayoutCornerRadiusAll                             = 0, //!< 上下左右
    
    // 切三个角
    TMLayoutCornerRadiusExceptTopLeft                   = 1, //!< 除(左+上)
    TMLayoutCornerRadiusExceptTopRight                  = 2, //!< 除(右+上)
    TMLayoutCornerRadiusExceptBottomLeft                = 3, //!< 除(左+下)
    TMLayoutCornerRadiusExceptBottomRight               = 4, //!< 除(右+下)
    
    //切两个角(同一边)
    TMLayoutCornerRadiusTop                             = 5, //!< 上
    TMLayoutCornerRadiusLeft                            = 6, //!< 左
    TMLayoutCornerRadiusRight                           = 7, //!< 右
    TMLayoutCornerRadiusBottom                          = 8, //!< 下
    
    //切一个角
    TMLayoutCornerRadiusTopLeft                         = 9, //!< 左+上
    TMLayoutCornerRadiusTopRight                        = 10, //!< 右+上
    TMLayoutCornerRadiusBottomLeft                      = 11, //!< 左+下
    TMLayoutCornerRadiusBottomRight                     = 12, //!< 右+下
    
    //对角线
    TMLayoutCornerRadiusTopLeftToBottomRight            = 13, //!< 上左+下右
    TMLayoutCornerRadiusTopRightToBottomLeft            = 14, //!< 上右+下左
};

/**
 切割圆角
 
 @param type 圆角类型
 @param cornerRadius 圆角弧度
 */
- (void)lt_useBezierPathClipCornerWithTMLayoutCornerRadiusType:(TMLayoutCornerRadiusType)type
                                                  cornerRadius:(CGFloat)cornerRadius;

/**
 切割圆角和添加边框
 
 @param type 圆角类型
 @param cornerRadius 圆角弧度
 @param color 边框颜色
 @param borderWidth 边框宽度
 */
- (void)lt_userBezierPathClipCornerWithTMLayoutCornerRadiusType:(TMLayoutCornerRadiusType)type
                                                   cornerRadius:(CGFloat)cornerRadius
                                                          color:(UIColor *)color
                                                    borderWidth:(CGFloat)borderWidth;

/**
 添加边框
 
 @param color 边框颜色
 @param borderWidth 边框宽度
 */
- (void)lt_userCALayerMakeBorderLineWithColor:(UIColor *)color
                                  borderWidth:(CGFloat)borderWidth;

@end

NS_ASSUME_NONNULL_END
