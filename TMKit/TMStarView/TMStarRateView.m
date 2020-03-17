//
//  TMStarRateView.m
//  TMKit
//
//  Created by Luther on 2020/1/19.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMStarRateView.h"
#import "UIImage+Tint.h"

#define kNUMBER_OF_STAR  5

@interface TMStarRateView ()
@property (nonatomic, assign, readonly) NSInteger numberOfStar;
@property (nonatomic, strong) UIView *starForegroundView;
@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) NSMutableArray *foregroundImageViewArray;
@property (nonatomic, strong) NSMutableArray *backgroundImageViewArray;
@end

@implementation TMStarRateView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStar:kNUMBER_OF_STAR];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
        _numberOfStar = number;
    }
    return self;
}

- (void)setupSubviews {
    _numberOfStar = kNUMBER_OF_STAR;
    self.foregroundViewColor = [UIColor clearColor];
    self.backgroundViewColor = [UIColor clearColor];
    self.foregroundImageName = @"foregroundStar";
    self.backgroundImageName = @"backgroundStar";
    self.foregroundImageViewArray = [NSMutableArray array];
    self.backgroundImageViewArray = [NSMutableArray array];
    self.starForegroundView = [self buildStarViewWithStarImageName:self.foregroundImageName isForegroundColor:YES];
    self.starBackgroundView = [self buildStarViewWithStarImageName:self.backgroundImageName isForegroundColor:NO];
    [self addSubview:self.starForegroundView];
    [self addSubview:self.starBackgroundView];
}

- (void)setScore:(CGFloat)score animated:(BOOL)animated {
    [self setScore:score animated:animated completion:nil];
}

- (void)setScore:(CGFloat)score animated:(BOOL)animated completion:(void (^)(BOOL finish))completion {
    NSAssert((score >= 0.0 && score <= 1.0), @"score must be between 0 and 1");
    if (score < 0)
    {
        score = 0;
    }
    
    if (score > 1)
    {
        score = 1;
    }
    CGPoint point = CGPointMake(score * self.frame.size.width, 0);
    
    if(animated)
    {
        __weak __typeof(self)weakSelf = self;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             [weakSelf changeStarForegroundViewWithPoint:point];
             
         } completion:^(BOOL finished)
         {
             if (completion)
             {
                 completion(finished);
             }
         }];
    }
    else
    {
        [self changeStarForegroundViewWithPoint:point];
    }
}

- (void)dealloc
{
    [self unRegisterForKVO];
}

#pragma mark  Touch Event
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (CGRectContainsPoint(rect, point)) {
        [self changeStarForegroundViewWithPoint:point];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^
    {
        [weakSelf changeStarForegroundViewWithPoint:point];
    }];
}

- (void)changeStarForegroundViewWithPoint:(CGPoint)point {
    if (point.x < 0) {
        point.x = 0;
    }
    if (point.y > self.frame.size.width) {
        point.x = self.frame.size.width;
    }
    NSString *str = [NSString stringWithFormat:@"%0.2f",point.x/self.frame.size.width];
    float score = [str floatValue];
    point.x = score * self.frame.size.width;
    self.starForegroundView.frame = CGRectMake(0, 0, point.x, self.frame.size.height);
    if (self.delegate && [self.delegate respondsToSelector:@selector(starRatingView:score:)]) {
        [self.delegate starRatingView:self score:score];
    }
}

#pragma mark  构建星星视图
- (UIView *)buildStarViewWithStarImageName:(NSString *)imageName isForegroundColor:(BOOL)isForegroundColor {
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.numberOfStar; i ++) {
        UIImageView *imageView;
        if (isForegroundColor) {
            imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:self.foregroundImageName] imageWithGradientTintColor:self.foregroundViewColor]];
        } else {
            imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:self.backgroundImageName] imageWithGradientTintColor:self.backgroundViewColor]];
        }
        imageView.frame = CGRectMake(i * frame.size.width / self.numberOfStar, 0, frame.size.width / self.numberOfStar, frame.size.height);
        [view addSubview:imageView];
        if (isForegroundColor) {
            [self.foregroundImageViewArray addObject:imageView];
        } else {
            [self.backgroundImageViewArray addObject:imageView];
        }
    }
    return view;
}

#pragma mark  KVO
- (void)registerForKVO {
    for (NSString *keypaths in [self observableKeypaths]) {
        [self addObserver:self forKeyPath:keypaths options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)unRegisterForKVO {
    for (NSString *keypaths in [self observableKeypaths]) {
        [self removeObserver:self forKeyPath:keypaths];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(updateUIForKeyPath:) withObject:keyPath waitUntilDone:NO];
    } else {
        [self updateUIForKeyPath:keyPath];
    }
}

- (NSArray *)observableKeypaths {
    return [NSArray arrayWithObjects:@"foregroundViewColor", @"backgroundViewColor", @"foregroundImageName", @"backgroundImageName", nil];
}

- (void)updateUIForKeyPath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"foregroundViewColor"]) {
        for (NSInteger i = 0; i < [self.foregroundImageViewArray count]; i++) {
            UIImageView *imageView = self.foregroundImageViewArray[i];
            imageView.image = [imageView.image imageWithGradientTintColor:self.foregroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"backgroundViewColor"]) {
        for (NSInteger i = 0; i < [self.backgroundImageViewArray count]; i++) {
            UIImageView *imageView = self.backgroundImageViewArray[i];
            imageView.image = [imageView.image imageWithGradientTintColor:self.backgroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"foregroundImageName"]) {
        for (NSInteger i = 0; i < [self.foregroundImageViewArray count]; i++) {
            UIImageView *imageView = self.foregroundImageViewArray[i];
            imageView.image = [[UIImage imageNamed:self.foregroundImageName] imageWithGradientTintColor:self.foregroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"backgroundImageName"]) {
        for (NSInteger i = 0; i < [self.backgroundImageViewArray count]; i++) {
            UIImageView *imageView = self.backgroundImageViewArray[i];
            imageView.image = [[UIImage imageNamed:self.backgroundImageName] imageWithGradientTintColor:self.backgroundViewColor];
        }
    }
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

@end
