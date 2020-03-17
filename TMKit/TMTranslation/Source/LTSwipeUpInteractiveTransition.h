//
//  LTSwipeUpInteractiveTransition.h
//  LTKit
//
//  Created by Luther on 2020/1/20.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTSwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController *)viewController;
@end

NS_ASSUME_NONNULL_END
