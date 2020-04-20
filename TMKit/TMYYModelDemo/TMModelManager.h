//
//  TMModelManager.h
//  TMKit
//
//  Created by Luther on 2020/4/10.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class TMUser;

@interface TMModelManager : NSObject

@property (nonatomic, strong) TMUser *user;

+ (instancetype)shareManager;
- (void)tm_jsonToModel;

@end

NS_ASSUME_NONNULL_END
