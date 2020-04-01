//
//  TMPressScaleButton.m
//  TMKit
//
//  Created by Luther on 2020/4/1.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMPressScaleButton.h"

@interface TMPressScaleButton ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation TMPressScaleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor     = [UIColor whiteColor];
        self.layer.cornerRadius  = frame.size.width / 2.f;
        
        self.label = [[UILabel alloc] initWithFrame:frame];
        self.label.text = @"0%";
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
    }
    return self;
}

- (void)currentScalePrecent:(CGFloat)precent {
    
    NSLog(@"precent-----%lf",precent);
    
    self.label.text = [NSString stringWithFormat:@"%.f%%", fabs(precent * 100)];
}

@end
