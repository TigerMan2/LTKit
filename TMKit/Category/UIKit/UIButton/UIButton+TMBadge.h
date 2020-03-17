//
//  UIButton+TMBadge.h
//  TMKit
//
//  Created by Luther on 2019/9/23.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TMBadge)

@property (nonatomic, strong, nullable) UILabel *badge;
//!< Badge value to display
@property (nonatomic, strong) NSString *badgeValue;
//!< Badge background Color
@property (nonatomic, strong) UIColor *badgeBGColor;
//!< Badge text color
@property (nonatomic, strong) UIColor *badgeTextColor;
//!< Badge text font
@property (nonatomic, strong) UIFont *badgeFont;
//!< Padding value for the badge
@property (nonatomic, assign) CGFloat badgePadding;
//!< Minimun size badge to small
@property (nonatomic, assign) CGFloat badgeMinSize;
//!< Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic, assign) CGFloat badgeOriginX;
@property (nonatomic, assign) CGFloat badgeOriginY;
//!< In case of numbers, remove the badge when reaching zero
@property (nonatomic, assign) BOOL shouldHideBadgeAtZero;
//!< Badge has a bounce animation when value changes
@property (nonatomic, assign) BOOL shouldAnimatedBadge;

@end

NS_ASSUME_NONNULL_END
