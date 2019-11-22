//
//  NSData+LTExtension.h
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (LTEncrypt)

/**
 MD2加密

 @return MD2加密后的字符串
 */
- (NSString *)md2String;

/**
 MD2加密

 @return MD2加密后的data
 */
- (NSData *)md2Data;

/**
 MD4加密

 @return MD4加密后的字符串
 */
- (NSString *)md4String;

/**
 MD4加密

 @return MD4加密后的data
 */
- (NSData *)md4Data;

/**
 MD5加密

 @return MD5加密后的字符串
 */
- (NSString *)md5String;

/**
 MD5加密
 
 @return MD5加密后的data
 */
- (NSData *)md5Data;

/**
 SHA1加密
 
 @return SHA1加密后的字符串
 */
- (NSString *)sha1String;

/**
 SHA1加密
 
 @return SHA1加密后的data
 */
- (NSData *)sha1Data;

/**
 SHA224加密
 
 @return SHA224加密后的字符串
 */
- (NSString *)sha224String;

/**
 SHA224加密
 
 @return SHA224加密后的data
 */
- (NSData *)sha224Data;

/**
 SHA256加密
 
 @return SHA256加密后的字符串
 */
- (NSString *)sha256String;

/**
 SHA256加密
 
 @return SHA256加密后的data
 */
- (NSData *)sha256Data;

/**
 SHA384加密
 
 @return SHA384加密后的字符串
 */
- (NSString *)sha384String;

/**
 SHA384加密
 
 @return SHA384加密后的data
 */
- (NSData *)sha384Data;

/**
 SHA512加密
 
 @return SHA512加密后的字符串
 */
- (NSString *)sha512String;

/**
 SHA512加密
 
 @return SHA512加密后的data
 */
- (NSData *)sha512Data;

@end

NS_ASSUME_NONNULL_END
