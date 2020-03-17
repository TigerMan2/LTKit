//
//  UIAlertController+Blocks.h
//  TMKit
//
//  Created by Luther on 2019/6/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UIAlertControllerCompletionBlock)(UIAlertController * __nonnull controller, UIAlertAction * __nonnull action, NSInteger buttonIndex);

@interface UIAlertController (Blocks)

+ (instancetype)showInViewController:(UIViewController *)viewController
                               title:(NSString *)title message:(NSString *)message
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock;

@property (nonatomic, assign, readonly) BOOL visible;
@property (nonatomic, assign, readonly) NSInteger cancelButtonIndex;
@property (nonatomic, assign, readonly) NSInteger destructiveButtonIndex;
@property (nonatomic, assign, readonly) NSInteger firstOtherButtonIndex;

@end

NS_ASSUME_NONNULL_END
