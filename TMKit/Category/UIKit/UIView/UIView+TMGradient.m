//
//  UIView+TMGradient.m
//  TMKit
//
//  Created by Luther on 2019/9/19.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIView+TMGradient.h"
#import <objc/runtime.h>

@implementation UIView (TMGradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)tm_gradientViewWithColors:(NSArray <UIColor *> *)colors locations:(NSArray <NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[UIView alloc] init];
    [view tm_setGradientBackgroundWithColors:colors loactions:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)tm_setGradientBackgroundWithColors:(NSArray <UIColor *> *)colors loactions:(NSArray <NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [[NSMutableArray alloc] init];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.colors = [colorsM mutableCopy];
    self.locations = locations;
    self.startPoint = startPoint;
    self.endPoint = endPoint;
}

#pragma mark    -   getter & setter

- (NSArray *)colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setColors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [(CAGradientLayer *)self.layer setColors:self.colors];
    }
}

- (NSArray *)locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLocations:(NSArray *)locations {
    objc_setAssociatedObject(self, @selector(locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [(CAGradientLayer *)self.layer setLocations:self.locations];
    }
}

- (CGPoint)startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setStartPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.startPoint];
    }
}

- (CGPoint)endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setEndPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.endPoint];
    }
}

@end
