//
//  TMTextView.m
//  TMKit
//
//  Created by Luther on 2019/11/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "TMTextView.h"

@interface TMTextView ()
@property (nonatomic, assign) NSInteger textHeight;
@property (nonatomic, assign) NSInteger maxHeight;
@end

@implementation TMTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    [self removeObserver:self forKeyPath:@"text"];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.scrollEnabled = NO;
    self.scrollsToTop = NO;
    self.showsVerticalScrollIndicator = NO;
    self.enablesReturnKeyAutomatically = YES;
    self.maxNumOfLines = 5;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textValueChanged) name:UITextViewTextDidChangeNotification object:self];
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self && [keyPath isEqualToString:@"text"]) {
        [self textValueChanged];
    }
}

- (void)textValueChanged {
    NSInteger height = ceil([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
    if (self.textHeight != height) { //改变了高度
        
        if (height > self.maxHeight) {
            height = self.maxHeight;
        }
        
        if (self.textHieghtChangeBlock) {
            self.textHieghtChangeBlock(self.text, height);
            [self.superview layoutIfNeeded];
        }
        
    }
}

- (void)setTextHieghtChangeBlock:(void (^)(NSString * _Nonnull, CGFloat))textHieghtChangeBlock {
    _textHieghtChangeBlock = textHieghtChangeBlock;
    [self textValueChanged];
}

- (void)setMaxNumOfLines:(NSInteger)maxNumOfLines {
    _maxNumOfLines = maxNumOfLines;
    //超出这个最大高度，就可以滚动；小于这个高度时，frame改变
    self.maxHeight = ceil(self.font.lineHeight * maxNumOfLines + self.contentInset.top + self.contentInset.bottom);
}

@end
