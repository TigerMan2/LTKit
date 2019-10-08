//
//  UIApplication+LTExtension.h
//  LTKit
//
//  Created by Luther on 2019/9/23.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  UIApplication的扩展类
 */
@interface UIApplication (LTExtension)

//!< 沙盒中Document
@property (nonatomic, strong, readonly) NSURL *documentsURL;
@property (nonatomic, strong, readonly) NSString *documentsPath;

//!< 沙盒中缓存
@property (nonatomic, strong, readonly) NSURL *cachesURL;
@property (nonatomic, strong, readonly) NSString *cachesPath;

//!< 沙盒中Library
@property (nonatomic, strong, readonly) NSURL *libraryURL;
@property (nonatomic, strong, readonly) NSString *libraryPath;

//!< Application Bundle Name.
@property (nonatomic, strong, readonly) NSString *appBundleName;
//!< Application Bundle ID.
@property (nonatomic, strong, readonly) NSString *appBundleID;
//!< Application Version.        e.g. "1.2.0"
@property (nonatomic, strong, readonly) NSString *appVersion;
//!< Application Build Version.     e.g. "123"
@property (nonatomic, strong, readonly) NSString *appBuildVersion;

@end

NS_ASSUME_NONNULL_END
