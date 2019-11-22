//
//  NSString+LTExtension.m
//  LTKit
//
//  Created by Luther on 2019/9/20.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "NSString+LTExtension.h"

@implementation NSString (LTExtension)

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:14];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
            paraStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paraStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr
                                         context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)widthWithFont:(UIFont *)font {
    CGSize size = [self sizeWithFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGFloat)heightWithFont:(UIFont *)font {
    CGSize size = [self sizeWithFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByCharWrapping];
    return size.height;
}

+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, string));
    return result;
}

- (NSData *)dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
