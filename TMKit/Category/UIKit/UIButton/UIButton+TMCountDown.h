//
//  UIButton+TMCountDown.h
//  TMKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TMCountDown)

- (void)startCountDownWithDefauTMTitle:(NSString *)defauTMTitle totaTMime:(NSInteger)totaTMime timeUnit:(NSString *)unit;

@end

NS_ASSUME_NONNULL_END
