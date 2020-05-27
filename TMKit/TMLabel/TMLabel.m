//
//  TMLabel.m
//  TMKit
//
//  Created by Luther on 2020/4/27.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMLabel.h"
#import <CoreText/CoreText.h>

@implementation TMLabel

- (void)setText:(NSString *)text {
    
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    
    CFAttributedStringRef attrStr = (__bridge CFAttributedStringRef)attrString;
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(attrStr);
    
    
    
}

@end
