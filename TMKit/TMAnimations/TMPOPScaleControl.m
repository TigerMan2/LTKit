//
//  TMPOPScaleControl.m
//  TMKit
//
//  Created by Luther on 2020/4/1.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMPOPScaleControl.h"
#import "POP.h"

@interface TMPOPScaleControl () <POPAnimationDelegate>
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) CGFloat precent;

@end

@implementation TMPOPScaleControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.scale = 0.95;
        self.sensitiveDuration = 0.4f;
        self.scaleDuration = 0.4f;
        
        _contentView = [[UIView alloc] initWithFrame:frame];
        _contentView.userInteractionEnabled = NO;
        [self addSubview:_contentView];
        
        _button = [[UIButton alloc] initWithFrame:frame];
        [self addSubview:_button];
        
        [_button addTarget:self action:@selector(scaleToSmall) forControlEvents:(UIControlEventTouchDown | UIControlEventTouchDragEnter)];
        [_button addTarget:self action:@selector(scaleToDefault) forControlEvents:(UIControlEventTouchUpInside)];
        [_button addTarget:self action:@selector(scaleToDefault) forControlEvents:(UIControlEventTouchDragExit | UIControlEventTouchCancel)];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _button.bounds = self.bounds;
    _contentView.bounds = self.bounds;
}

// 按下响应事件
- (void)scaleToSmall {
    [self.layer pop_removeAllAnimations];
       
   POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
   animation.toValue = [NSValue valueWithCGSize:CGSizeMake(_scale, _scale)];
   animation.duration = _scaleDuration;
   animation.delegate = self;
   [self.layer pop_addAnimation:animation forKey:nil];
    
    // 延时处理点击响应事件
    [self performSelector:@selector(performSelectorEvent) withObject:nil afterDelay:_sensitiveDuration];
}

// 松开响应事件
- (void)scaleToDefault {
    [self.layer pop_removeAllAnimations];
    
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
    animation.duration = _scaleDuration;
    animation.delegate = self;
    [self.layer pop_addAnimation:animation forKey:nil];
    
    // 取消所有延迟方法
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

// 延时处理事件
- (void)performSelectorEvent {
    if (_target && _selector) {
        [_target performSelector:_selector withObject:nil afterDelay:0];
    }
    
    [self controllEventActived];
    
    if ([self.delegate respondsToSelector:@selector(POPControlEvent:)]) {
        [self.delegate POPControlEvent:self];
    }
    
}

- (void)currentScalePrecent:(CGFloat)precent {}

- (void)controllEventActived {}

#pragma mark  POPAnimationDelegate
- (void)pop_animationDidApply:(POPAnimation *)anim {
    
    NSValue *value = (NSValue *)[anim valueForKeyPath:@"currentValue"];
    
    CGSize size = [value CGSizeValue];
    
    _precent = (size.height - [TMPOPScaleControl calculateConstantWithX1:0 y1:1 x2:1 y2:_scale]) / [TMPOPScaleControl calculateSlopeWithX1:0 y1:1 x2:1 y2:_scale];
    
    [self currentScalePrecent:_precent];
    
    if ([self.delegate respondsToSelector:@selector(POPControl:currentPrecent:)]) {
        [self.delegate POPControl:self currentPrecent:_precent];
    }
}

#pragma mark  Math
+ (CGFloat)calculateSlopeWithX1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 {
    
    return (y2 - y1) / (x2 - x1);
}

+ (CGFloat)calculateConstantWithX1:(CGFloat)x1 y1:(CGFloat)y1 x2:(CGFloat)x2 y2:(CGFloat)y2 {
    
    return (y1*(x2 - x1) - x1*(y2 - y1)) / (x2 - x1);
}

- (void)setEnabled:(BOOL)enabled {
    _button.enabled = enabled;
}

- (BOOL)enabled {
    return _button.enabled;
}

@synthesize selected = _selected;

- (void)setSelected:(BOOL)selected {
    _button.selected = selected;
}

- (BOOL)selected {
    return _button.selected;
}

@end
