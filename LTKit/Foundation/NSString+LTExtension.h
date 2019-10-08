//
//  NSString+LTExtension.h
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LTExtension)

/**
 计算字符串的大小

 @param font 字体大小
 @param size 字符串期望大小
 @param lineBreakMode 文字换行方式
 @return 计算出的文字大小
 */
- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 计算文字的宽度

 @param font 字体大小
 @return 计算出的文字宽度
 */
- (CGFloat)widthWithFont:(UIFont *)font;

/**
 计算文字的高度

 @param font 字体大小
 @return 计算出的文字高度
 */
- (CGFloat)heightWithFont:(UIFont *)font;

/**
 获取UUID

 @return UUID字符串
 */
+ (NSString *)stringWithUUID;

/**
 字符串转换为NSData

 @return data
 */
- (NSData *)dataValue;

/**
 去掉字符串前后空格

 @return 去掉前后空格之后的字符串
 */
- (NSString *)trim;

@end

NS_ASSUME_NONNULL_END
