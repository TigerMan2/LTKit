//
//  UIButton+LTCountDown.h
//  LTKit
//
//  Created by Luther on 2019/10/8.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LTCountDown)

- (void)startCountDownWithDefaultTitle:(NSString *)defaultTitle totalTime:(NSInteger)totalTime timeUnit:(NSString *)unit;

@end

NS_ASSUME_NONNULL_END
