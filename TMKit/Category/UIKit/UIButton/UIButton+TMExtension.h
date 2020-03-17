//
//  UIButton+TMExtension.h
//  TMKit
//
//  Created by Luther on 2019/9/23.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TMImagePosition) {
    TMImagePositionLeft         = 0, //!< 图片在左，文字在右，默认
    TMImagePositionRight           , //!< 图片在右，文字在左
    TMImagePositionTop             , //!< 图片在上，文字在下
    TMImagePositionBottom          , //!< 图片在下，文字在上
};

@interface UIButton (TMExtension)

/// 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
/// 注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
/// @param imagePosition 图片位置
/// @param spacing 图文间距
- (void)setImagePosition:(TMImagePosition)imagePosition spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
