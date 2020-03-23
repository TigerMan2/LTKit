//
//  TMDragView.m
//  TMKit
//
//  Created by Luther on 2020/3/17.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMDragView.h"

static CGFloat TMKeepBoundsDuration = .5;
static CGFloat TMUpdateFrameDuration = .25;
static CGFloat TMDelayAlphaDuration = .25;

@interface TMDragView ()<UIGestureRecognizerDelegate>
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@end

@implementation TMDragView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.freeRect.origin.x != 0 || self.freeRect.origin.y != 0 || self.freeRect.size.width != 0 || self.freeRect.size.height != 0) {
        
    } else {
        self.freeRect = (CGRect){CGPointZero,self.superview.bounds.size};
    }
}

- (void)setupSubviews {
    self.isDrag = YES;
    self.clipsToBounds = YES;
    self.isKeepBounds = NO;
    self.stayAlpha = 1.0;
    self.backgroundColor = [UIColor lightGrayColor];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapDrag)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragAction:)];
    self.panGestureRecognizer.minimumNumberOfTouches = 1;
    self.panGestureRecognizer.maximumNumberOfTouches = 1;
    self.panGestureRecognizer.delegate = self;
    [self addGestureRecognizer:self.panGestureRecognizer];
}

#pragma mark  UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    self.alpha = 1.0;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    return YES;
}

/// 单击Drag
- (void)singleTapDrag {
    if (self.singleTapDragBlock) {
        self.singleTapDragBlock(self);
    }
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:2];
}

/// 拖拽Drag
- (void)dragAction:(UIPanGestureRecognizer *)gesture {
    if (!self.isDrag) return;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (self.beginDragBlock) {
                self.beginDragBlock(self);
            }
            [gesture setTranslation:CGPointZero inView:self];
            self.startPoint = [gesture translationInView:self];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if (self.duringDragBlock) {
                self.duringDragBlock(self);
            }
            CGPoint point = [gesture translationInView:self];
            CGFloat dx;
            CGFloat dy;
            switch (self.dragDirection) {
                case TMDragDirectionAny:
                {
                    dx = point.x - self.startPoint.x;
                    dy = point.y - self.startPoint.y;
                }
                    break;
                case TMDragDirectionHorizontal:
                {
                    dx = point.x - self.startPoint.x;
                    dy = 0;
                }
                    break;
                case TMDragDirectionVertical:
                {
                    dx = 0;
                    dy = point.y - self.startPoint.y;
                }
                    break;
                    
                default:
                    break;
            }
            
            CGPoint center = CGPointMake(self.center.x + dx, self.center.y + dy);
            self.center = center;
            
            [gesture setTranslation:CGPointZero inView:self];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [self keepBounds];
            if (self.endDragBlock) {
                self.endDragBlock(self);
            }
            [self performSelector:@selector(delayMethod) withObject:nil afterDelay:2];
        }
            break;
            
        default:
            break;
    }
}

- (void)delayMethod {
    [UIView animateWithDuration:TMDelayAlphaDuration animations:^{
       self.alpha = self.stayAlpha;
    }];
}

- (void)keepBounds {
    CGRect rect = self.frame;
    CGFloat centerX = self.freeRect.origin.x + (self.freeRect.size.width - self.frame.size.width) * 0.5;
    if (self.isKeepBounds) { //有吸附边界效果
        if (self.frame.origin.x < centerX) {
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:@"leftMove" context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:TMKeepBoundsDuration];
            rect.origin.x = self.freeRect.origin.x;
            self.frame = rect;
            [UIView commitAnimations];
        } else {
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:@"rightMove" context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:TMKeepBoundsDuration];
            rect.origin.x = self.freeRect.origin.x + self.freeRect.size.width - self.frame.size.width;
            self.frame = rect;
            [UIView commitAnimations];
        }
    } else {
        if (self.frame.origin.x < self.freeRect.origin.x) {
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:@"leftMove" context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:TMUpdateFrameDuration];
            rect.origin.x = self.freeRect.origin.x;
            self.frame = rect;
            [UIView commitAnimations];
        } else if ((self.frame.origin.x + self.frame.size.width) > (self.freeRect.origin.x + self.freeRect.size.width)) {
            CGContextRef context = UIGraphicsGetCurrentContext();
            [UIView beginAnimations:@"rightMove" context:context];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationDuration:TMUpdateFrameDuration];
            rect.origin.x = self.freeRect.origin.x + self.freeRect.size.width - self.frame.size.width;
            self.frame = rect;
            [UIView commitAnimations];
        }
    }
    
    if (self.frame.origin.y < self.freeRect.origin.y) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"topMove" context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:TMUpdateFrameDuration];
        rect.origin.y = self.freeRect.origin.y;
        self.frame = rect;
        [UIView commitAnimations];
    } else if ((self.frame.origin.y + self.frame.size.height) > (self.freeRect.origin.y + self.freeRect.size.height)) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:@"bottomMove" context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:TMUpdateFrameDuration];
        rect.origin.y = self.freeRect.origin.y + self.freeRect.size.height - self.frame.size.height;
        self.frame = rect;
        [UIView commitAnimations];
    }
}

@end
