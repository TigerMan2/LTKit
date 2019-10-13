//
//  NSIndexPath+LTOffset.h
//  LTKit
//
//  Created by Luther on 2019/10/13.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (LTOffset)

/// previous row indexPath
- (NSIndexPath *)previousRow;
/// next row indexPath
- (NSIndexPath *)nextRow;
/// previous item indexPath
- (NSIndexPath *)previousItem;
/// next item indexPath
- (NSIndexPath *)nextItem;
/// previous section indexPath
- (NSIndexPath *)previousSection;
/// next section indexPath
- (NSIndexPath *)nextSection;
@end

NS_ASSUME_NONNULL_END
