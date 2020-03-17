//
//  UIImage+TMExtension.h
//  TMKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (TMExtension)

/// 压缩图片
- (UIImage *)compressImage;

/// 计算图片大小
- (void)calulateImageFileSize;

/// 获取视频第一帧
/// @param url 视频URL
+ (UIImage *)videoFirstFrameWithURL:(NSURL *)url;

/// 根据color和size获取image
/// @param color 颜色
/// @param size 尺寸大小
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/// 图片转换
/// @param image 图片
/// @param orientation 图片方向
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

@end

NS_ASSUME_NONNULL_END
