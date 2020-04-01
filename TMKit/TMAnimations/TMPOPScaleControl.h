//
//  TMPOPScaleControl.h
//  TMKit
//
//  Created by Luther on 2020/4/1.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TMPOPScaleControl;

@protocol TMPOPScaleControlDelegate <NSObject>

@optional;

/// 缩放百分比事件
/// @param control 当前对象
/// @param precent 缩放百分比
- (void)POPControl:(TMPOPScaleControl *)control currentPrecent:(CGFloat)precent;

/// 事件触发
/// @param control 当前对象
- (void)POPControlEvent:(TMPOPScaleControl *)control;

@end

@interface TMPOPScaleControl : UIView

@property (nonatomic, weak) id <TMPOPScaleControlDelegate> delegate;

/// 缩放比例, 默认值为0.95
@property (nonatomic, assign) CGFloat scale;
/// 事件触发时间, 触发的时间应该是大于或等于scaleDuration
@property (nonatomic, assign) NSTimeInterval sensitiveDuration;
/// 缩放时间, 默认值是0.4
@property (nonatomic, assign) NSTimeInterval scaleDuration;
/// 按下按钮的百分比, 未按下是值为0
@property (nonatomic, assign, readonly) CGFloat precent;

/// 事件响应的目标对象
@property (nonatomic, weak) id target;

///响应事件
@property (nonatomic) SEL selector;

/// 是否有效
@property (nonatomic, assign) BOOL enabled;

/// 是否选中
@property (nonatomic, assign) BOOL selected;

@property (nonatomic, strong, readonly) UIView *contentView;

/// 缩放百分比事件
/// @param precent 百分比
- (void)currentScalePrecent:(CGFloat)precent;

/// 事件激活
- (void)controllEventActived;

@end

NS_ASSUME_NONNULL_END
