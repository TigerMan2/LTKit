//
//  LTFPSLabel.m
//  LTKit
//
//  Created by Luther on 2019/10/9.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTFPSLabel.h"

#define kSize CGSizeMake(55, 20)

@interface LTFPSLabel ()
{
    CADisplayLink              *_link;
    NSUInteger                  _count;
    NSTimeInterval              _lastTime;
    UIFont                     *_font;
    UIFont                     *_subFont;
}
@end

@implementation LTFPSLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.00f alpha:0.700f];
    
    _font = [UIFont fontWithName:@"Menlo" size:14.0f];
    if (_font) {
        _subFont = [UIFont fontWithName:@"Menlo" size:10.0f];
    } else {
        _font = [UIFont fontWithName:@"Courier" size:14.0f];
        _subFont = [UIFont fontWithName:@"Courier" size:10.0f];
    }
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    return self;
}

- (void)dealloc
{
    [_link invalidate];
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kSize;
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d FPS",(int)round(fps)]];
    
    NSInteger length = text.length;
    [text addAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(0, length - 3)];
    [text addAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(length - 3, 3)];
    [text addAttributes:@{NSFontAttributeName:_font} range:NSMakeRange(0, length - 3)];
    [text addAttributes:@{NSFontAttributeName:_subFont} range:NSMakeRange(length - 3, 3)];
    self.attributedText = text;
    
}

@end
