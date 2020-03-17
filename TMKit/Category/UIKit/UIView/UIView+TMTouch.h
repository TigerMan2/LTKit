//
//  UIView+TMTouch.h
//  TMKit
//
//  Created by Luther on 2019/9/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define UIView_TouchAction              @"UIView_TouchAction"
#define UIView_LongTouchAction_Begin    @"UIView_LongTouchAction_Begin"
#define UIView_LongTouchAction_Finish   @"UIView_LongTouchAction_Finish"

@interface UIView (TMTouch)

/**
 UIView和子类添加单击事件

 @param touchAction 单击的block
 */
- (void)TM_setTouchAction:(void(^)(UIView *view))touchAction;

/**
 UIView和子类添加长按事件

 @param longTouchBeginAction 开始长按block
 @param longTouchFinishAction 结束或者取消长按block
 */
- (void)TM_setLongTouchBeginAction:(void(^)(UIView *view))longTouchBeginAction longTouchFinishAction:(void(^)(UIView *view))longTouchFinishAction;

@end

NS_ASSUME_NONNULL_END
