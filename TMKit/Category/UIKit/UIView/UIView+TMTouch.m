//
//  UIView+TMTouch.m
//  TMKit
//
//  Created by Luther on 2019/9/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+TMTouch.h"
#import <objc/runtime.h>

@implementation UIView (TMTouch)

- (void(^)(UIView *))touchAction {
    return objc_getAssociatedObject(self, UIView_TouchAction);
}

- (void)lt_setTouchAction:(void(^)(UIView *view))touchAction {
    objc_setAssociatedObject(self, UIView_TouchAction, touchAction, OBJC_ASSOCIATION_COPY);
    for (UIGestureRecognizer *gesture in self.gestureRecognizers) {
        [self removeGestureRecognizer:gesture];
    }
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture)];
    [self addGestureRecognizer:tapGesture];
}

- (void)tapGesture {
    if (self.touchAction) {
        self.touchAction(self);
    }
}

- (void(^)(UIView *))longTouchBeginAction {
    return objc_getAssociatedObject(self, UIView_LongTouchAction_Begin);
}

- (void(^)(UIView *))longTouchFinishAction {
    return objc_getAssociatedObject(self, UIView_LongTouchAction_Finish);
}

- (void)lt_setLongTouchBeginAction:(void(^)(UIView *view))longTouchBeginAction longTouchFinishAction:(void(^)(UIView *view))longTouchFinishAction {
    objc_setAssociatedObject(self, UIView_LongTouchAction_Begin, longTouchBeginAction, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, UIView_LongTouchAction_Finish, longTouchFinishAction, OBJC_ASSOCIATION_COPY);
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGesture:)];
    [self addGestureRecognizer:longGesture];
}

- (void)longGesture:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.longTouchBeginAction) {
            self.longTouchBeginAction(self);
        }
    } else {
        if (self.longTouchFinishAction) {
            self.longTouchFinishAction(self);
        }
    }
}

@end
