//
//  TMStarRateView.h
//  TMKit
//
//  Created by Luther on 2020/1/19.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMStarRateView;

NS_ASSUME_NONNULL_BEGIN

@protocol TMStarRateViewDelegate <NSObject>

@optional;
- (void)starRatingView:(TMStarRateView *)view score:(float)score;

@end

@interface TMStarRateView : UIView

///前景图填充颜色
@property (nonatomic, strong) UIColor *foregroundViewColor;
///背景图填充颜色
@property (nonatomic, strong) UIColor *backgroundViewColor;
///前景图图片名称
@property (nonatomic, copy) NSString *foregroundImageName;
///背景图图片名称
@property (nonatomic, copy) NSString *backgroundImageName;

@property (nonatomic, weak) id <TMStarRateViewDelegate> delegate;

/// 初始化
/// @param frame 大小
/// @param number 星星数量
- (instancetype)initWithFrame:(CGRect)frame
                 numberOfStar:(NSInteger)number;

/// 设置星星数量
/// @param score 星星数量
/// @param animated 是否动画
- (void)setScore:(CGFloat)score
        animated:(BOOL)animated;

/// 设置星星数量
/// @param score 星星数量
/// @param animated 是否动画
/// @param completion 结束回调
- (void)setScore:(CGFloat)score
        animated:(BOOL)animated
      completion:(void (^)(BOOL finish))completion;

@end

NS_ASSUME_NONNULL_END
