//
//  LTStarView.h
//  LTKit
//
//  Created by Luther on 2020/1/16.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTStarView;

NS_ASSUME_NONNULL_BEGIN

typedef void(^finishBlock)(CGFloat currentScore);

typedef NS_ENUM(NSUInteger, LTStarViewStyle) {
    LTStarViewStyleWholeStar = 0,           //整星
    LTStarViewStyleHalfStar,                //半星
    LTStarViewStyleIncompleteStar           //零星
};

@protocol LTStarViewDelegate <NSObject>
@optional;

- (void)starView:(LTStarView *)starView currentScore:(CGFloat)score;

@end

@interface LTStarView : UIView

@property (nonatomic, assign) BOOL animated;
@property (nonatomic, assign) LTStarViewStyle starStyle;
@property (nonatomic, assign) CGFloat currentScore;
@property (nonatomic, weak) id <LTStarViewDelegate> delegate;
@property (nonatomic, strong) NSString *foredImageName;
@property (nonatomic, strong) NSString *backImageName;
@property (nonatomic, copy) finishBlock finish;

#pragma mark  Delegate
/// 初始化
/// @param frame 大小
/// @param delegate 代理
- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<LTStarViewDelegate>)delegate;
/// 初始化
/// @param frame 大小
/// @param animated 是否动画
/// @param numberOfStars 星星数量
/// @param score 当前选中的星星数
/// @param starStyle 类型
/// @param foredImageName 选中星星图片
/// @param backImageName 未选中星星图片
/// @param delegate 代理
- (instancetype)initWithFrame:(CGRect)frame
                     animated:(BOOL)animated
                numberOfStars:(NSInteger)numberOfStars
                 currentScore:(CGFloat)score
                    starStyle:(LTStarViewStyle)starStyle
               foredImageName:(nullable NSString *)foredImageName
                backImageName:(nullable NSString *)backImageName
                     delegate:(id<LTStarViewDelegate>)delegate;


#pragma mark  Block
/// 初始化
/// @param frame 大小
/// @param finish block
- (instancetype)initWithFrame:(CGRect)frame
                       finish:(finishBlock)finish;
/// 初始化
/// @param frame 大小
/// @param animated 是否动画
/// @param numberOfStars 星星数量
/// @param score 当前选中的星星数
/// @param starStyle 类型
/// @param foredImageName 选中星星图片
/// @param backImageName 未选中星星图片
/// @param finish block
- (instancetype)initWithFrame:(CGRect)frame animated:(BOOL)animated
                numberOfStars:(NSInteger)numberOfStars
                 currentScore:(CGFloat)score
                    starStyle:(LTStarViewStyle)starStyle
               foredImageName:(nullable NSString *)foredImageName
                backImageName:(nullable NSString *)backImageName
                       finish:(finishBlock)finish;

@end

NS_ASSUME_NONNULL_END
