//
//  UITextView+LT.h
//  LTKit
//
//  Created by Luther on 2019/11/22.
//  Copyright © 2019 mrstock. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Limit)

@property (nonatomic, assign) NSInteger maxLength; //if <= 0, no limit

@end

@interface UITextView (PlaceHolder)

@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end

NS_ASSUME_NONNULL_END
