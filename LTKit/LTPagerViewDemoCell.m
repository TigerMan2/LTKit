//
//  LTPagerViewDemoCell.m
//  LTKit
//
//  Created by Luther on 2019/12/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LTPagerViewDemoCell.h"

@implementation LTPagerViewDemoCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@(0));
        }];
    }
    return self;
}
@end
