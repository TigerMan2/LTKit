//
//  NSString+LTEncrypt.h
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LTEncrypt)

/**
 MD2加密
 
 @return MD2加密后的字符串
 */
- (NSString *)md2String;

/**
 MD4加密
 
 @return MD4加密后的字符串
 */
- (NSString *)md4String;

/**
 MD5加密
 
 @return MD5加密后的字符串
 */
- (NSString *)md5String;

/**
 SHA1加密
 
 @return SHA1加密后的字符串
 */
- (NSString *)sha1String;

/**
 SHA224加密
 
 @return SHA224加密后的字符串
 */
- (NSString *)sha224String;

/**
 SHA256加密
 
 @return SHA256加密后的字符串
 */
- (NSString *)sha256String;

/**
 SHA384加密
 
 @return SHA384加密后的字符串
 */
- (NSString *)sha384String;

/**
 SHA512加密
 
 @return SHA512加密后的字符串
 */
- (NSString *)sha512String;

@end

NS_ASSUME_NONNULL_END
