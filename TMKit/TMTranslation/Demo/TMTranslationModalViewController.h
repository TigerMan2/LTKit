//
//  TMTranslationModalViewController.h
//  TMKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMTranslationModalViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol TMTranslationModalViewControllerDelegate <NSObject>

@optional;
- (void)modalViewControllerDidClickedDismissButton:(TMTranslationModalViewController *)viewController;

@end

@interface TMTranslationModalViewController : UIViewController
@property (nonatomic, weak) id <TMTranslationModalViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
