//
//  UIImage+LTExtension.h
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LTExtension)

/// 压缩图片
- (UIImage *)compressImage;
/// 计算图片大小
- (void)calulateImageFileSize;

@end

NS_ASSUME_NONNULL_END
