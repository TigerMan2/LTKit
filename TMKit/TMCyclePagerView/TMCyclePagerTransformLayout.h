//
//  TMCyclePagerTransformLayout.h
//  TMKit
//
//  Created by Luther on 2019/12/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TMCyclePagerTransformLayoutType) {
    TMCyclePagerTransformLayoutNormal,
    TMCyclePagerTransformLayoutLinear,
    TMCyclePagerTransformLayoutCoverflow,
};

@class TMCyclePagerTransformLayout;
@protocol TMCyclePagerTransformLayoutDelegate <NSObject>

// initialize layout attributes
- (void)pagerViewTransformLayout:(TMCyclePagerTransformLayout *)pagerViewTransformLayout initializeTransformAttributes:(UICollectionViewLayoutAttributes *)attributes;

// apply layout attributes
- (void)pagerViewTransformLayout:(TMCyclePagerTransformLayout *)pagerViewTransformLayout applyTransformToAttributes:(UICollectionViewLayoutAttributes *)attributes;

@end

@interface TMCyclePagerViewLayout : NSObject
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@property (nonatomic, assign) TMCyclePagerTransformLayoutType layoutType;

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

@interface TMCyclePagerTransformLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) TMCyclePagerViewLayout *layout;

@property (nonatomic, weak) id <TMCyclePagerTransformLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
