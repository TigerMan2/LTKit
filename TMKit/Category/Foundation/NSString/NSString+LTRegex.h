//
//  NSString+TMRegex.h
//  TMKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TMRegex)

/**
 根据正则验证字符串

 @param regex 正则表达式
 @return 验证结果
 */
- (BOOL)isValidWithRegex:(NSString *)regex;

/**
 邮箱验证

 @return 验证结果
 */
- (BOOL)isValidEmail;

/**
 手机号验证
 
 @return 验证结果
 */
- (BOOL)isValidPhoneNum;

/**
 车牌号验证
 
 @return 验证结果
 */
- (BOOL)isValidCarNo;

/**
 网址验证
 
 @return 验证结果
 */
- (BOOL)isValidUrl;

/**
 邮编验证
 
 @return 验证结果
 */
- (BOOL)isValidPostalCode;

/**
 汉字验证
 
 @return 验证结果
 */
- (BOOL)isValidChinese;

/**
 IP验证
 
 @return 验证结果
 */
- (BOOL)isValidIP;

@end

NS_ASSUME_NONNULL_END
