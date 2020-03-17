//
//  LTTranslationModalViewController.h
//  LTKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTTranslationModalViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol LTTranslationModalViewControllerDelegate <NSObject>

@optional;
- (void)modalViewControllerDidClickedDismissButton:(LTTranslationModalViewController *)viewController;

@end

@interface LTTranslationModalViewController : UIViewController
@property (nonatomic, weak) id <LTTranslationModalViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
