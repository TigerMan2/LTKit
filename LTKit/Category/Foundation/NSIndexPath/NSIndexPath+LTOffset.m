//
//  NSIndexPath+LTOffset.m
//  LTKit
//
//  Created by Luther on 2019/10/13.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSIndexPath+LTOffset.h"

@implementation NSIndexPath (LTOffset)

- (NSIndexPath *)previousRow {
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

- (NSIndexPath *)nextRow {
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

- (NSIndexPath *)previousItem {
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}

- (NSIndexPath *)nextItem {
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}

- (NSIndexPath *)previousSection {
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

- (NSIndexPath *)nextSection {
    return [NSIndexPath indexPathForItem:self.row
                               inSection:self.section + 1];
}

@end
