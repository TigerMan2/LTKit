//
//  LTAlertController.h
//  LTKit
//
//  Created by Luther on 2019/12/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LTAlertControllerStyle) {
    LTAlertControllerStyleAlert = 0,
    LTAlertControllerStyleActionSheet,
};

typedef NS_ENUM(NSUInteger, LTAlertTransitionAnimation) {
    LTAlertTransitionAnimationFade = 0,
    LTAlertTransitionAnimationScaleFade,
    LTAlertTransitionAnimationDropDown,
    LTAlertTransitionAnimationCustom,
};

@interface LTAlertController : UIViewController

@property (nonatomic, strong, readonly) UIView *alertView;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, assign, readonly) LTAlertControllerStyle preferredStyle;
@property (nonatomic, assign, readonly) LTAlertTransitionAnimation transitionAnimation;
@property (nonatomic, assign, readonly) Class transitionAnimationClass;

@property (nonatomic, assign) BOOL backgroundTapDismissEnable; //!< Default NO.

@property (nonatomic, assign) CGFloat alertViewOriginY; //!< Default centerY.

/// 如果宽度是0,或者宽度没有约束时,使用这个属性,Default 15 edge.
@property (nonatomic, assign) CGFloat alertStyleEdging;

/// 同上,Default 0.
@property (nonatomic, assign) CGFloat actionSheetStyleEdging;

///block
@property (nonatomic, copy) void (^viewWillShowBlock)(UIView *alertView);
@property (nonatomic, copy) void (^viewDidShowBlock)(UIView *alertView);
@property (nonatomic, copy) void (^viewWillHideBlock)(UIView *alertView);
@property (nonatomic, copy) void (^viewDidHideBlock)(UIView *alertView);

@property (nonatomic, copy) void (^dismissComplete)(void);

@end

@interface LTAlertController (TransitionAnimate)<UIViewControllerTransitioningDelegate>

@end

NS_ASSUME_NONNULL_END
