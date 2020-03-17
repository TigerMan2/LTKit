//
//  TMCyclePagerView.h
//  TMKit
//
//  Created by Luther on 2019/12/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMCyclePagerTransformLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef struct {
    NSInteger index;
    NSInteger section;
}TMIndexSection;

typedef NS_ENUM(NSUInteger, TMPagerScrollDirection) {
    TMPagerScrollDirectionLeft,
    TMPagerScrollDirectionRight,
};

@class TMCyclePagerView;
@protocol TMCyclePagerViewDataSource <NSObject>

- (NSInteger)numberOfItemsInPagerView:(TMCyclePagerView *)pagerView;

- (__kindof UICollectionViewCell *)pagerView:(TMCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index;

- (TMCyclePagerViewLayout *)layoutForPagerView:(TMCyclePagerView *)pagerView;

@end

@protocol TMCyclePagerViewDelegate <NSObject>

@optional;

- (void)pagerView:(TMCyclePagerView *)pagerView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

- (void)pagerView:(TMCyclePagerView *)pagerView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndex:(NSInteger)index;

- (void)pagerView:(TMCyclePagerView *)pagerView didSelectedItemCell:(__kindof UICollectionViewCell *)cell atIndexSection:(TMIndexSection)indexSection;

- (void)pagerView:(TMCyclePagerView *)pageView initializeTransformAttributes:(UICollectionViewLayoutAttributes *)attributes;

- (void)pagerView:(TMCyclePagerView *)pageView applyTransformToAttributes:(UICollectionViewLayoutAttributes *)attributes;


- (void)pagerViewDidScroll:(TMCyclePagerView *)pagerView;
- (void)pagerViewWillBeginDragging:(TMCyclePagerView *)pagerView;
- (void)pagerViewDidEndDragging:(TMCyclePagerView *)pagerView willDecelerate:(BOOL)decelerate;
- (void)pagerViewWillBeginDecelerating:(TMCyclePagerView *)pageView;
- (void)pagerViewDidEndDecelerating:(TMCyclePagerView *)pageView;
- (void)pagerViewWillBeginScrollingAnimation:(TMCyclePagerView *)pageView;
- (void)pagerViewDidEndScrollingAnimation:(TMCyclePagerView *)pageView;

@end

@interface TMCyclePagerView : UIView

@property (nonatomic, strong, nullable) UIView *backgroundView;

@property (nonatomic, weak) id <TMCyclePagerViewDataSource> dataSource;
@property (nonatomic, weak) id <TMCyclePagerViewDelegate> delegate;

@property (nonatomic, weak, readonly) UICollectionView *collectionView;
@property (nonatomic, strong, readonly) TMCyclePagerViewLayout *layout;

@property (nonatomic, assign) BOOL isInfiniteLoop;

@property (nonatomic, assign) CGFloat autoScrollInterval;

@property (nonatomic, assign) BOOL reloadDataNeedResetIndex;

@property (nonatomic, assign, readonly) NSInteger curIndex;
@property (nonatomic, assign, readonly) TMIndexSection indexSection;

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

- (void)scrollToItemAtIndexSection:(TMIndexSection)indexSection animated:(BOOL)animated;

- (void)scrollToNearlyIndexAtDirection:(TMPagerScrollDirection)direction animated:(BOOL)animated;

- (void)registerClass:(Class)class forCellWithReuseIdentifier:(NSString *)identifier;

- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
