//
//  UIImage+LTExtension.m
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIImage+LTExtension.h"

@implementation UIImage (LTExtension)

/// 压缩图片
- (UIImage *)compressImage {
    
    //!< 图像尺寸的压缩
    CGSize imageSize = self.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    
    if (imageWidth > 1280 || imageHeight > 1280) {   //!< 1.宽高大于1280
        if (imageWidth > imageHeight) {
            CGFloat scale = imageHeight / imageWidth;
            imageWidth = 1280;
            imageHeight = imageWidth * scale;
        } else {
            CGFloat scale = imageWidth / imageHeight;
            imageHeight = 1280;
            imageWidth = imageHeight * scale;
        }
    } else if (imageWidth > 1280 || imageHeight < 1280) { //!< 2.宽大于1280高小于1280
        CGFloat scale = imageHeight / imageWidth;
        imageWidth = 1280;
        imageHeight = imageWidth * scale;
    } else if (imageWidth < 1280 || imageHeight > 1280) { //!< 3.宽小于1280高大于1280
        CGFloat scale = imageWidth / imageHeight;
        imageHeight = 1280;
        imageWidth = imageHeight * scale;
    } else { //!< 宽高都小于1280
        
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(imageWidth, imageHeight));
    [self drawInRect:CGRectMake(0, 0, imageWidth, imageHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //!< 图像的画面质量压缩
    NSData *imageData = UIImageJPEGRepresentation(newImage, 1.0);
    if (imageData.length > 100*1024) {
        if (imageData.length > 1024*1024) { //!< 1M以上
            imageData = UIImageJPEGRepresentation(newImage, 0.4);
        } else if (imageData.length > 512*1024) { //!< 0.5M~1M
            imageData = UIImageJPEGRepresentation(newImage, 0.5);
        } else if (imageData.length > 200*1024) { //!< 0.25M~0.5M
            imageData = UIImageJPEGRepresentation(newImage, 0.9);
        }
    }
    return [UIImage imageWithData:imageData];
}

- (void)calulateImageFileSize {
    NSData *data = UIImagePNGRepresentation(self);
    if (!data) {
        data = UIImageJPEGRepresentation(self, 1.0);//需要改成0.5才接近原图片大小，原因请看下文
    }
    double dataLength = [data length] * 1.0;
    NSArray *typeArray = @[@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB",@"ZB",@"YB"];
    NSInteger index = 0;
    while (dataLength > 1024) {
        dataLength /= 1024.0;
        index ++;
    }
    NSLog(@"image = %.3f %@",dataLength,typeArray[index]);
}

@end
