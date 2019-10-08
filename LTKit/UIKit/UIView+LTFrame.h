//
//  UIView+LTFrame.h
//  LTKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LTFrame)

@property (nonatomic) CGFloat lt_x;
@property (nonatomic) CGFloat lt_y;

@property (nonatomic) CGFloat lt_centerX;
@property (nonatomic) CGFloat lt_centerY;

@property (nonatomic) CGFloat lt_maxX;
@property (nonatomic) CGFloat lt_maxY;

@property (nonatomic) CGFloat lt_width;
@property (nonatomic) CGFloat lt_height;

@property (nonatomic) CGSize lt_size;
@property (nonatomic) CGPoint lt_origin;

@property (nonatomic) CGFloat lt_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat lt_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat lt_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat lt_bottom;      ///< Shortcut for frame.origin.y + frame.size.height

@end

NS_ASSUME_NONNULL_END
