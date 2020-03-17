//
//  LTAdPageView.h
//  LTKit
//
//  Created by Luther on 2019/10/10.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const adImageName = @"adImageName";
static NSString *const adUrl = @"adUrl";

typedef void(^TapBlock)(void);

@interface LTAdPageView : UIView

- (instancetype)initWithFrame:(CGRect)frame tapBlock:(TapBlock)tapBlock;

- (void)show;

//!< 图片路径
@property (nonatomic, strong) NSString *filePath;

@end

NS_ASSUME_NONNULL_END
