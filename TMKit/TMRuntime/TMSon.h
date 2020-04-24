//
//  TMSon.h
//  TMKit
//
//  Created by Luther on 2020/4/22.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMFather.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSon : TMFather

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, weak) UILabel *label;

@end

NS_ASSUME_NONNULL_END
