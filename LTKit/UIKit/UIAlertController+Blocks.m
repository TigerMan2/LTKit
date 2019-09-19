//
//  UIAlertController+Blocks.m
//  LTKit
//
//  Created by Luther on 2019/6/18.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "UIAlertController+Blocks.h"

static NSInteger const UIAlertControllerCancelButtonIndex = 0;
static NSInteger const UIAlertControllerDestructiveButtonIndex = 1;
static NSInteger const UIAlertControllerFirstOtherButtonIndex = 2;

@implementation UIAlertController (Blocks)

+ (instancetype)showInViewController:(UIViewController *)viewController
                               title:(NSString *)title message:(NSString *)message
                      preferredStyle:(UIAlertControllerStyle)preferredStyle
                   cancelButtonTitle:(NSString *)cancelButtonTitle
              destructiveButtonTitle:(NSString *)destructiveButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock
{
    UIAlertController *alertController = [self alertControllerWithTitle:title
                                                                message:message
                                                         preferredStyle:preferredStyle];
    
    __weak UIAlertController *controller = alertController;
    
    if (cancelButtonTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(controller, action, UIAlertControllerCancelButtonIndex);
            }
        }];
        [alertController addAction:cancelAction];
    }
    
    if (destructiveButtonTitle) {
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (tapBlock) {
                tapBlock(controller, action, UIAlertControllerDestructiveButtonIndex);
            }
        }];
        [alertController addAction:destructiveAction];
    }
    
    if (otherButtonTitles) {
        for (int i = 0; i < otherButtonTitles.count; i ++) {
            NSString *otherButtonTitle = otherButtonTitles[i];
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (tapBlock) {
                    tapBlock(controller, action, UIAlertControllerFirstOtherButtonIndex + i);
                }
            }];
            [alertController addAction:otherAction];
        }
    }
    
    [viewController presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}

- (BOOL)visible {
    return self.view.superview != nil;
}

- (NSInteger)cancelButtonIndex {
    return UIAlertControllerCancelButtonIndex;
}

- (NSInteger)destructiveButtonIndex {
    return UIAlertControllerDestructiveButtonIndex;
}

- (NSInteger)firstOtherButtonIndex {
    return UIAlertControllerFirstOtherButtonIndex;
}

@end
