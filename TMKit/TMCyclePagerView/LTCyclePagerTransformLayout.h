//
//  LTCyclePagerTransformLayout.h
//  LTKit
//
//  Created by Luther on 2019/12/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LTCyclePagerTransformLayoutType) {
    LTCyclePagerTransformLayoutNormal,
    LTCyclePagerTransformLayoutLinear,
    LTCyclePagerTransformLayoutCoverflow,
};

@class LTCyclePagerTransformLayout;
@protocol LTCyclePagerTransformLayoutDelegate <NSObject>

// initialize layout attributes
- (void)pagerViewTransformLayout:(LTCyclePagerTransformLayout *)pagerViewTransformLayout initializeTransformAttributes:(UICollectionViewLayoutAttributes *)attributes;

// apply layout attributes
- (void)pagerViewTransformLayout:(LTCyclePagerTransformLayout *)pagerViewTransformLayout applyTransformToAttributes:(UICollectionViewLayoutAttributes *)attributes;

@end

@interface LTCyclePagerViewLayout : NSObject
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@property (nonatomic, assign) LTCyclePagerTransformLayoutType layoutType;

@property (nonatomic, assign) CGFloat minimumScale;
@property (nonatomic, assign) CGFloat minimumAlpha;
@property (nonatomic, assign) CGFloat maximumAngle;

@property (nonatomic, assign) BOOL isInfiniteLoop;
@property (nonatomic, assign) CGFloat rateOfChange;
@property (nonatomic, assign) BOOL adjustSpacingWhenScroling;

@property (nonatomic, assign) BOOL itemVerticalCenter;
@property (nonatomic, assign) BOOL itemHorizontalCenter;

@property (nonatomic, assign, readonly) UIEdgeInsets onlyOneSectionInset;
@property (nonatomic, assign, readonly) UIEdgeInsets firstSectionInset;
@property (nonatomic, assign, readonly) UIEdgeInsets lastSectionInset;
@property (nonatomic, assign, readonly) UIEdgeInsets middleSectionInset;

@end

@interface LTCyclePagerTransformLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) LTCyclePagerViewLayout *layout;

@property (nonatomic, weak) id <LTCyclePagerTransformLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
