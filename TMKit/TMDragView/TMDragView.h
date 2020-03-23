//
//  TMDragView.h
//  TMKit
//
//  Created by Luther on 2020/3/17.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, TMDragDirection) {
    TMDragDirectionAny,             // 任意
    TMDragDirectionHorizontal,      // 水平
    TMDragDirectionVertical,        // 垂直
};

@interface TMDragView : UIView

/// 是否可以拖拽, Default YES.
@property (nonatomic, assign) BOOL isDrag;
/// 是否吸附边界, Default NO.
@property (nonatomic, assign) BOOL isKeepBounds;
/// 可移动的区域, Default superView.bounds.
@property (nonatomic, assign) CGRect freeRect;
/// 悬浮球停留时是否改变透明度,  Default YES.
@property (nonatomic, assign) BOOL shouldDelayChangeAlpha;
/// 悬浮球停留时, 透明度, 0~1, Default 0.4.
@property (nonatomic, assign) CGFloat stayAlpha;
/// 拖拽方向
@property (nonatomic, assign) TMDragDirection dragDirection;

/// 单击.
@property (nonatomic, copy) void(^singleTapDragBlock) (TMDragView *dragView);
/// 开始拖拽.
@property (nonatomic, copy) void(^beginDragBlock) (TMDragView *dragView);
/// 拖拽中.
@property (nonatomic, copy) void(^duringDragBlock) (TMDragView *dragView);
/// 结束拖拽.
@property (nonatomic, copy) void(^endDragBlock) (TMDragView *dragView);

@end

NS_ASSUME_NONNULL_END
