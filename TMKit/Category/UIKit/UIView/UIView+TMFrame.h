//
//  UIView+TMFrame.h
//  TMKit
//
//  Created by Luther on 2019/9/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TMFrame)

@property (nonatomic) CGFloat TM_x;
@property (nonatomic) CGFloat TM_y;

@property (nonatomic) CGFloat TM_centerX;
@property (nonatomic) CGFloat TM_centerY;

@property (nonatomic) CGFloat TM_maxX;
@property (nonatomic) CGFloat TM_maxY;

@property (nonatomic) CGFloat TM_width;
@property (nonatomic) CGFloat TM_height;

@property (nonatomic) CGSize TM_size;
@property (nonatomic) CGPoint TM_origin;

@property (nonatomic) CGFloat TM_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat TM_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat TM_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat TM_bottom;      ///< Shortcut for frame.origin.y + frame.size.height

@end

NS_ASSUME_NONNULL_END
