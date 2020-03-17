//
//  UIButton+TMBadge.m
//  TMKit
//
//  Created by Luther on 2019/9/23.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIButton+TMBadge.h"
#import <objc/runtime.h>

NSString const * UIButton_badgeKey =        @"UIButton_badgeKey";
NSString const * UIButton_badgeValueKey = @"UIButton_badgeValueKey";
NSString const * UIButton_badgeBGColorKey = @"UIButton_badgeBGColorKey";
NSString const * UIButton_badgeTextColorKey = @"UIButton_badgeTextColorKey";
NSString const * UIButton_badgeFontKey = @"UIButton_badgeFontKey";
NSString const * UIButton_badgePaddingKey = @"UIButton_badgePaddingKey";
NSString const * UIButton_badgeMinSizeKey = @"UIButton_badgeMinSizeKey";
NSString const * UIButton_badgeOriginXKey = @"UIButton_badgeOriginXKey";
NSString const * UIButton_badgeOriginYKey = @"UIButton_badgeOriginYKey";
NSString const * UIButton_shouldHideBadgeAtZeroKey = @"UIButton_shouldHideBadgeAtZeroKey";
NSString const * UIButton_shouldAnimatedBadgeKey = @"UIButton_shouldAnimatedBadgeKey";

@implementation UIButton (TMBadge)
@dynamic badgeValue, badgeBGColor, badgeTextColor, badgeFont;
@dynamic badgePadding, badgeMinSize, badgeOriginX, badgeOriginY;
@dynamic shouldAnimatedBadge, shouldHideBadgeAtZero;

- (void)badgeInit {
    
    //badge初始化
    self.badgeTextColor = [UIColor whiteColor];
    self.badgeFont = [UIFont systemFontOfSize:12.0];
    self.badgeBGColor = [UIColor redColor];
    self.badgePadding = 6;
    self.badgeMinSize = 8;
    self.badgeOriginX = self.frame.size.width - self.badge.frame.size.width * 0.5;
    self.badgeOriginY = - (self.badge.frame.size.height * 0.5);
    self.shouldHideBadgeAtZero = YES;
    self.shouldAnimatedBadge = YES;
    self.clipsToBounds = NO;
}

- (void)refreshBadge {
    self.badge.textColor = self.badgeTextColor;
    self.badge.font = self.badgeFont;
    self.badge.backgroundColor = self.badgeBGColor;
}

- (CGSize)badgeExpectedSize {
    UILabel *frameLabel = [self duplicateLabel:self.badge];
    [frameLabel sizeToFit];
    
    CGSize badgeExpectedSize = frameLabel.frame.size;
    return badgeExpectedSize;
}

- (void)updateBadgeFrame {
    
    CGSize badgeExpectedSize = [self badgeExpectedSize];
    
    CGFloat minHeight = badgeExpectedSize.height;
    
    minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : minHeight;
    CGFloat minWidth = badgeExpectedSize.width;
    CGFloat padding = self.badgePadding;
    
    minWidth = (minWidth < minHeight) ? minHeight : minWidth;
    self.badge.frame = CGRectMake(self.badgeOriginX, self.badgeOriginY, minWidth + padding, minHeight + padding);
    self.badge.layer.cornerRadius = (minHeight + padding) * 0.5;
    self.badge.layer.masksToBounds = YES;
}

- (void)updateBadgeValueAnimated:(BOOL)animated {
    
    if (animated && self.shouldAnimatedBadge &&
        ![self.badge.text isEqualToString:self.badgeValue]) {
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    self.badge.text = self.badgeValue;
    NSTimeInterval duration = (animated && self.shouldAnimatedBadge) ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self updateBadgeFrame];
    }];
}

- (UILabel *)duplicateLabel:(UILabel *)labelToCopy {
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    return duplicateLabel;
}

- (void)removeBadge {
    [UIView animateWithDuration:0.2 animations:^{
        self.badge.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        [self.badge removeFromSuperview];
        self.badge = nil;
    }];
}

#pragma mark    -   getter && setter
- (UILabel *)badge {
    return objc_getAssociatedObject(self, &UIButton_badgeKey);
}

- (void)setBadge:(UILabel *)badge {
    objc_setAssociatedObject(self, &UIButton_badgeKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)badgeValue {
    return objc_getAssociatedObject(self, &UIButton_badgeValueKey);
}

- (void)setBadgeValue:(NSString *)badgeValue {
    objc_setAssociatedObject(self, &UIButton_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSLog(@"%d     %d      %d     %d",!self.badgeValue, [badgeValue isEqualToString:@""], [badgeValue isEqualToString:@"0"], self.shouldHideBadgeAtZero);
    
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.shouldHideBadgeAtZero)) {
        [self removeBadge];
    } else if (!self.badge) {
        self.badge                      = [[UILabel alloc] initWithFrame:CGRectMake(self.badgeOriginX, self.badgeOriginY, 20, 20)];
        self.badge.textColor            = self.badgeTextColor;
        self.badge.backgroundColor      = self.badgeBGColor;
        self.badge.font                 = self.badgeFont;
        self.badge.textAlignment        = NSTextAlignmentCenter;
        [self badgeInit];
        [self addSubview:self.badge];
        [self updateBadgeValueAnimated:NO];
    } else {
        [self updateBadgeValueAnimated:YES];
    }
}

- (UIColor *)badgeBGColor {
    return objc_getAssociatedObject(self, &UIButton_badgeBGColorKey);
}

- (void)setBadgeBGColor:(UIColor *)badgeBGColor {
    objc_setAssociatedObject(self, &UIButton_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

- (UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, &UIButton_badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    objc_setAssociatedObject(self, &UIButton_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

- (UIFont *)badgeFont {
    return objc_getAssociatedObject(self, &UIButton_badgeFontKey);
}

- (void)setBadgeFont:(UIFont *)badgeFont {
    objc_setAssociatedObject(self, &UIButton_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

- (CGFloat)badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_badgePaddingKey);
    return number.floatValue;
}

- (void)setBadgePadding:(CGFloat)badgePadding {
    NSNumber *number = [NSNumber numberWithFloat:badgePadding];
    objc_setAssociatedObject(self, &UIButton_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}

// Minimum size badge to small
- (CGFloat) badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_badgeMinSizeKey);
    return number.floatValue;
}
- (void) setBadgeMinSize:(CGFloat)badgeMinSize {
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &UIButton_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
- (CGFloat) badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_badgeOriginXKey);
    return number.floatValue;
}

- (void) setBadgeOriginX:(CGFloat)badgeOriginX {
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &UIButton_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}

- (CGFloat) badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_badgeOriginYKey);
    return number.floatValue;
}

- (void) setBadgeOriginY:(CGFloat)badgeOriginY {
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &UIButton_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
- (BOOL) shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setShouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero {
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &UIButton_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge has a bounce animation when value changes
- (BOOL) shouldAnimatedBadge {
    NSNumber *number = objc_getAssociatedObject(self, &UIButton_shouldAnimatedBadgeKey);
    return number.boolValue;
}

- (void)setShouldAnimatedBadge:(BOOL)shouldAnimatedBadge {
    NSNumber *number = [NSNumber numberWithBool:shouldAnimatedBadge];
    objc_setAssociatedObject(self, &UIButton_shouldAnimatedBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
