//
//  LTTextView.h
//  LTKit
//
//  Created by Luther on 2019/11/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LTTextView : UITextView

///文字最大行数
@property (nonatomic, assign) NSInteger maxNumOfLines;

@property (nonatomic, copy) void (^textHieghtChangeBlock)(NSString *text, CGFloat height);

@end

NS_ASSUME_NONNULL_END
