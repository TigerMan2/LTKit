//
//  UIView+TMAutoLayout.h
//  TMKit
//
//  Created by Luther on 2019/12/24.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TMAutoLayout)

- (void)addConstraintToView:(UIView *)view edgeInset:(UIEdgeInsets)edgeInset;

- (void)addConstraintWithView:(UIView *)view topView:(UIView *)topView leftView:(UIView *)leftView bottomView:(UIView *)bottomView rightView:(UIView *)rightView edgeInset:(UIEdgeInsets)edgeInset;

- (void)addConstraintWithLeftView:(UIView *)leftView toRightView:(UIView *)rightView constant:(CGFloat)constant;

- (NSLayoutConstraint *)addConstraintWithTopView:(UIView *)topView bottomView:(UIView *)bottomView constant:(CGFloat)constant;

- (void)addConstraintWidth:(CGFloat)width height:(CGFloat)height;

- (void)addConstraintEqualWidthWithView:(UIView *)view widthToView:(UIView *)wView heightToView:(UIView *)hView;

- (void)addConstraintCenterXToView:(UIView *)xView centerYToView:(UIView *)yView;

- (NSLayoutConstraint *)addConstraintCenterYToView:(UIView *)yView constant:(CGFloat)constant;

- (void)removeConstraintWithAttribte:(NSLayoutAttribute)attr;

- (void)removeConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attr;

- (void)removeAllConstraints;

@end
