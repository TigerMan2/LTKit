//
//  LTStarRateView.h
//  LTKit
//
//  Created by Luther on 2020/1/19.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTStarRateView;

NS_ASSUME_NONNULL_BEGIN

@protocol LTStarRateViewDelegate <NSObject>

@optional;
- (void)starRatingView:(LTStarRateView *)view score:(float)score;

@end

@interface LTStarRateView : UIView

///前景图填充颜色
@property (nonatomic, strong) UIColor *foregroundViewColor;
///背景图填充颜色
@property (nonatomic, strong) UIColor *backgroundViewColor;
///前景图图片名称
@property (nonatomic, copy) NSString *foregroundImageName;
///背景图图片名称
@property (nonatomic, copy) NSString *backgroundImageName;

@property (nonatomic, weak) id <LTStarRateViewDelegate> delegate;

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
