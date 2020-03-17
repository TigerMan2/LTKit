//
//  LTCyclePagerView.h
//  LTKit
//
//  Created by Luther on 2019/12/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTCyclePagerTransformLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef struct {
    NSInteger index;
    NSInteger section;
}LTIndexSection;

typedef NS_ENUM(NSUInteger, LTPagerScrollDirection) {
    LTPagerScrollDirectionLeft,
    LTPagerScrollDirectionRight,
};

@class LTCyclePagerView;
@protocol LTCyclePagerViewDataSource <NSObject>

- (NSInteger)numberOfItemsInPagerView:(LTCyclePagerView *)pagerView;

- (__kindof UICollectionViewCell *)pagerView:(LTCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index;

- (LTCyclePagerViewLayout *)layoutForPagerView:(LTCyclePagerView *)pagerView;

@end

@protocol LTCyclePagerViewDelegate <NSObject>

@optional;

- (void)pagerView:(LTCyclePagerView *)pagerView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

- (void)pagerView:(LTCyclePagerView *)pagerView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index;

- (void)pagerView:(LTCyclePagerView *)pagerView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndexSection:(LTIndexSection)indexSection;

- (void)pagerView:(LTCyclePagerView *)pageView initializeTransformAttributes:(UICollectionViewLayoutAttributes *)attributes;

- (void)pagerView:(LTCyclePagerView *)pageView applyTransformToAttributes:(UICollectionViewLayoutAttributes *)attributes;


- (void)pagerViewDidScroll:(LTCyclePagerView *)pagerView;
- (void)pagerViewWillBeginDragging:(LTCyclePagerView *)pagerView;
- (void)pagerViewDidEndDragging:(LTCyclePagerView *)pagerView willDecelerate:(BOOL)decelerate;
- (void)pagerViewWillBeginDecelerating:(LTCyclePagerView *)pageView;
- (void)pagerViewDidEndDecelerating:(LTCyclePagerView *)pageView;
- (void)pagerViewWillBeginScrollingAnimation:(LTCyclePagerView *)pageView;
- (void)pagerViewDidEndScrollingAnimation:(LTCyclePagerView *)pageView;

@end

@interface LTCyclePagerView : UIView

@property (nonatomic, strong, nullable) UIView *backgroundView;

@property (nonatomic, weak) id <LTCyclePagerViewDataSource> dataSource;
@property (nonatomic, weak) id <LTCyclePagerViewDelegate> delegate;

@property (nonatomic, weak, readonly) UICollectionView *collectionView;
@property (nonatomic, strong, readonly) LTCyclePagerViewLayout *layout;

@property (nonatomic, assign) BOOL isInfiniteLoop;

@property (nonatomic, assign) CGFloat autoScrollInterval;

@property (nonatomic, assign) BOOL reloadDataNeedResetIndex;

@property (nonatomic, assign, readonly) NSInteger curIndex;
@property (nonatomic, assign, readonly) LTIndexSection indexSection;

@property (nonatomic, assign, readonly) CGPoint contentOffset;
@property (nonatomic, assign, readonly) BOOL tracking;
@property (nonatomic, assign, readonly) BOOL dragging;
@property (nonatomic, assign, readonly) BOOL decelerating;


- (void)reloadData;

- (void)updateData;

- (void)setNeedUpdateLayout;

- (void)setNeedClearLayout;

- (__kindof UICollectionViewCell *)curIndexCell;

- (NSArray <__kindof UICollectionViewCell *> *)visibleCells;

- (NSArray *)visibleIndexs;

- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated;

- (void)scrollToItemAtIndexSection:(LTIndexSection)indexSection animated:(BOOL)animated;

- (void)scrollToNearlyIndexAtDirection:(LTPagerScrollDirection)direction animated:(BOOL)animated;

- (void)registerClass:(Class)class forCellWithReuseIdentifier:(NSString *)identifier;

- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
