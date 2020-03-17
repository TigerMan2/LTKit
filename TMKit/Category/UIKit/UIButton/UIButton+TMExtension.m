//
//  UIButton+TMExtension.m
//  TMKit
//
//  Created by Luther on 2019/9/23.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIButton+TMExtension.h"

@interface TMButtonPositionCacheManager : NSObject
@property (nonatomic, strong) NSCache *cache;
@end

@implementation TMButtonPositionCacheManager

+ (instancetype)shareInstance {
    static TMButtonPositionCacheManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TMButtonPositionCacheManager alloc] init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cache = [[NSCache alloc] init];
    }
    return self;
}

@end

/// 缓存用数据结构
@interface TMButtonPositionCacheModel : NSObject
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;
@end

@implementation TMButtonPositionCacheModel
@end

@implementation UIButton (TMExtension)

- (void)setImagePosition:(TMImagePosition)imagePosition spacing:(CGFloat)spacing {
    NSCache *cache = [TMButtonPositionCacheManager shareInstance].cache;
    NSString *cacheKey = [NSString stringWithFormat:@"%@_%@_%@",self.currentTitle,@(self.titleLabel.font.hash),@(imagePosition)];
    TMButtonPositionCacheModel *saveModel = [cache objectForKey:cacheKey];
    if (saveModel != nil) {
        self.imageEdgeInsets = saveModel.imageEdgeInsets;
        self.titleEdgeInsets = saveModel.titleEdgeInsets;
        self.contentEdgeInsets = saveModel.contentEdgeInsets;
        return;
    }
    
    CGFloat imageWidth = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font];
    CGFloat labelWidth = size.width;
    CGFloat labelHeight = size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) * 0.5 - imageWidth * 0.5; //image中心移动的x距离
    CGFloat imageOffsetY = imageHeight * 0.5 + spacing * 0.5; //image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth * 0.5) - (imageWidth + labelWidth) * 0.5; //label中心移动的x距离
    CGFloat labelOffsetY = labelHeight * 0.5 + spacing * 0.5; //label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (imagePosition) {
        case TMImagePositionLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
        }
            break;
        case TMImagePositionRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, - (labelWidth + spacing/2));
            titleEdgeInsets = UIEdgeInsetsMake(0, - (imageWidth + spacing/2), 0, imageWidth + spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
        }
        break;
        case TMImagePositionTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
        }
        break;
        case TMImagePositionBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
        }
        break;
            
        default:
            break;
    }
    
    TMButtonPositionCacheModel *model = [[TMButtonPositionCacheModel alloc] init];
    model.titleEdgeInsets = titleEdgeInsets;
    model.imageEdgeInsets = imageEdgeInsets;
    model.contentEdgeInsets = contentEdgeInsets;
    [cache setObject:model forKey:cacheKey];
    
    self.titleEdgeInsets = titleEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
    
}

@end
