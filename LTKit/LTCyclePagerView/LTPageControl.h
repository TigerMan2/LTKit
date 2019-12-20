//
//  LTPageControl.h
//  LTKit
//
//  Created by Luther on 2019/12/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTPageControl : UIControl

@property (nonatomic, assign) NSInteger numberOfPages;  //!< 总页码数
@property (nonatomic, assign) NSInteger currentPage;    //!< 当前页码

@property (nonatomic, assign) BOOL hidesForSinglePage;  //!< 只有一个页码时，是否隐藏

@property (nonatomic, assign) CGFloat pageIndicatorSpaing;  //!< 页码间隔
@property (nonatomic, assign) UIEdgeInsets contentInset;
@property (nonatomic, assign, readonly) CGSize contentSize; //!< view size

@property (nonatomic, strong) UIColor *pageIndicatorTintColor;  //!< 默认页码tint color
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;   //!< 当前页码 tint color

@property (nonatomic, strong) UIImage *pageIndicatorImage;  //!< 默认页码图片
@property (nonatomic, strong) UIImage *currentPageIndicatorImage;   //!< 当前页码图片
@property (nonatomic, assign) UIViewContentMode indicatorImageContentMode;

@property (nonatomic, assign) CGSize pageIndicatorSize; //!< 默认页码大小 默认(6,6)
@property (nonatomic, assign) CGSize currentPageIndicatorSize;  //!< 当前页码大小

@property (nonatomic, assign) CGFloat animateDuring; //!< 动画时间

- (void)setCurrentPage:(NSInteger)currentPage animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
