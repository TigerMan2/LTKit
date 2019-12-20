//
//  UIImage+LTExtension.m
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIImage+LTExtension.h"
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVTime.h>

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

+ (UIImage *)videoFirstFrameWithURL:(NSURL *)url {
    if (!url) return nil;
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = (CGRect){CGPointZero,size};
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation {
    
    long double rorate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
        {
            rorate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = - rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
        }
            break;
        case UIImageOrientationRight:
        {
            rorate = 3*M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = - rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
        }
            break;
        case UIImageOrientationDown:
        {
            rorate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = - rect.size.width;
            translateY = - rect.size.height;
        }
            break;
            
        default:
        {
            rorate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
        }
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rorate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}

@end
