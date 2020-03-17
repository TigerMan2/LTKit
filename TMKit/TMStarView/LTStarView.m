//
//  LTStarView.m
//  LTKit
//
//  Created by Luther on 2020/1/16.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "LTStarView.h"

#define ForegroundStarImage @"b27_icon_star_yellow"
#define BackgroundStarImage @"b27_icon_star_gray"

@interface LTStarView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;
@property (nonatomic, assign) NSInteger numberOfStars;

@end

@implementation LTStarView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<LTStarViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStars = 5;
        _starStyle = LTStarViewStyleWholeStar;
        _currentScore = 0;
        _foredImageName = ForegroundStarImage;
        _backImageName = BackgroundStarImage;
        _delegate = delegate;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame animated:(BOOL)animated numberOfStars:(NSInteger)numberOfStars currentScore:(CGFloat)score starStyle:(LTStarViewStyle)starStyle foredImageName:(nullable NSString *)foredImageName backImageName:(nullable NSString *)backImageName delegate:(id<LTStarViewDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStars = numberOfStars;
        _currentScore = [self sumScore:score starStyle:starStyle];
        _starStyle = starStyle;
        _foredImageName = foredImageName ? foredImageName : ForegroundStarImage;
        _backImageName = backImageName ? backImageName : BackgroundStarImage;
        _delegate = delegate;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame finish:(finishBlock)finish
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStars = 5;
        _starStyle = LTStarViewStyleWholeStar;
        _currentScore = 0;
        _foredImageName = ForegroundStarImage;
        _backImageName = BackgroundStarImage;
        _finish = finish;
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame animated:(BOOL)animated numberOfStars:(NSInteger)numberOfStars currentScore:(CGFloat)score starStyle:(LTStarViewStyle)starStyle foredImageName:(nullable NSString *)foredImageName backImageName:(nullable NSString *)backImageName finish:(finishBlock)finish {
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStars = numberOfStars;
        _currentScore = [self sumScore:score starStyle:starStyle];
        _starStyle = starStyle;
        _foredImageName = foredImageName ? foredImageName : ForegroundStarImage;
        _backImageName = backImageName ? backImageName : BackgroundStarImage;
        _finish = finish;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.foregroundStarView = [self createStarViewWithImageName:_foredImageName];
    self.backgroundStarView = [self createStarViewWithImageName:_backImageName];
    self.foregroundStarView.frame = CGRectMake(0, 0, self.bounds.size.width * _currentScore/_numberOfStars, self.bounds.size.height);
    
    [self addSubview:self.foregroundStarView];
    [self addSubview:self.backgroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapStarView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
}

- (UIView *)createStarViewWithImageName:(NSString *)imageName {
    UIView *starView = [[UIView alloc] initWithFrame:self.bounds];
    starView.clipsToBounds = YES;
    starView.backgroundColor = [UIColor clearColor];
    
    CGFloat width = self.bounds.size.width / _numberOfStars;
    CGFloat height = self.bounds.size.height;
    for (NSInteger i = 0; i < _numberOfStars; i ++) {
        UIImageView *starImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        starImageView.image = [UIImage imageNamed:imageName];
        starImageView.contentMode = UIViewContentModeScaleAspectFit;
        [starView addSubview:starImageView];
    }
    return starView;
}

- (void)tapStarView:(UITapGestureRecognizer *)gesture {
    
    CGPoint point = [gesture locationInView:self];
    CGFloat offset = point.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / _numberOfStars);
    self.currentScore = [self sumScore:realStarScore starStyle:_starStyle];
}

- (CGFloat)sumScore:(CGFloat)currentScore starStyle:(LTStarViewStyle)starStyle {
    switch (starStyle) {
        case LTStarViewStyleWholeStar:
            return ceilf(currentScore);
        case LTStarViewStyleHalfStar:
            return roundf(currentScore) > currentScore ? ceilf(currentScore) : (ceilf(currentScore) - 0.5);
        case LTStarViewStyleIncompleteStar:
            return currentScore;
            
        default:
            return 0;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    CGFloat animationTimeInterval = self.animated ? 0.25 : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.currentScore/weakSelf.numberOfStars, weakSelf.bounds.size.height);
    }];
}

- (void)setCurrentScore:(CGFloat)currentScore {
    if (_currentScore == currentScore) {
        return;
    }
    
    if (currentScore < 0) {
        _currentScore = 0;
    } else if (currentScore > _numberOfStars) {
        _currentScore = _numberOfStars;
    } else {
        _currentScore = currentScore;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(starView:currentScore:)]) {
        [self.delegate starView:self currentScore:_currentScore];
    }
    
    if (_finish) {
        _finish(_currentScore);
    }
    
    [self setNeedsLayout];
}

@end
