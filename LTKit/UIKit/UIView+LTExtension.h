//
//  UIView+LT.h
//  LTKit
//
//  Created by Luther on 2019/6/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LTExtension)

@end

@interface UIView (LTCorners)

typedef NS_ENUM(NSUInteger, LTLayoutCornerRadiusType) {
    //切全部
    LTLayoutCornerRadiusAll                             = 0, //!< 上下左右
    
    // 切三个角
    LTLayoutCornerRadiusExceptTopLeft                   = 1, //!< 除(左+上)
    LTLayoutCornerRadiusExceptTopRight                  = 2, //!< 除(右+上)
    LTLayoutCornerRadiusExceptBottomLeft                = 3, //!< 除(左+下)
    LTLayoutCornerRadiusExceptBottomRight               = 4, //!< 除(右+下)
    
    //切两个角(同一边)
    LTLayoutCornerRadiusTop                             = 5, //!< 上
    LTLayoutCornerRadiusLeft                            = 6, //!< 左
    LTLayoutCornerRadiusRight                           = 7, //!< 右
    LTLayoutCornerRadiusBottom                          = 8, //!< 下
    
    //切一个角
    LTLayoutCornerRadiusTopLeft                         = 9, //!< 左+上
    LTLayoutCornerRadiusTopRight                        = 10, //!< 右+上
    LTLayoutCornerRadiusBottomLeft                      = 11, //!< 左+下
    LTLayoutCornerRadiusBottomRight                     = 12, //!< 右+下
    
    //对角线
    LTLayoutCornerRadiusTopLeftToBottomRight            = 13, //!< 上左+下右
    LTLayoutCornerRadiusTopRightToBottomLeft            = 14, //!< 上右+下左
};

/**
 切割圆角

 @param type 圆角类型
 @param cornerRadius 圆角弧度
 */
- (void)lt_useBezierPathClipCornerWithLTLayoutCornerRadiusType:(LTLayoutCornerRadiusType)type
                                                  cornerRadius:(CGFloat)cornerRadius;

/**
 切割圆角和添加边框

 @param type 圆角类型
 @param cornerRadius 圆角弧度
 @param color 边框颜色
 @param borderWidth 边框宽度
 */
- (void)lt_userBezierPathClipCornerWithLTLayoutCornerRadiusType:(LTLayoutCornerRadiusType)type
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

@interface UIView (LTFrame)

@property (nonatomic) CGFloat lt_x;
@property (nonatomic) CGFloat lt_y;

@property (nonatomic) CGFloat lt_centerX;
@property (nonatomic) CGFloat lt_centerY;

@property (nonatomic) CGFloat lt_maxX;
@property (nonatomic) CGFloat lt_maxY;

@property (nonatomic) CGFloat lt_width;
@property (nonatomic) CGFloat lt_height;

@property (nonatomic) CGSize lt_size;
@property (nonatomic) CGPoint lt_origin;

@property (nonatomic) CGFloat lt_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat lt_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat lt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat lt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height

@end

NS_ASSUME_NONNULL_END
