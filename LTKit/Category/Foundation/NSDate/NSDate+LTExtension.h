//
//  NSDate+LTExtension.h
//  LTKit
//
//  Created by edward lannister on 2018/5/11.
//  Copyright © 2018年 edward lannister. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LTExtension)

#pragma mark ------Component Properties------
@property (nonatomic, readonly) NSInteger year; //Year Component
@property (nonatomic, readonly) NSInteger month;//Month Component (1~12)
@property (nonatomic, readonly) NSInteger day;//Day Component (1~31)
@property (nonatomic, readonly) NSInteger hour;//Hour Component (0~23)
@property (nonatomic, readonly) NSInteger minute;//Minute Component (0~59)
@property (nonatomic, readonly) NSInteger second;//Second Component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond;//Nanosecond Component (纳秒)
@property (nonatomic, readonly) NSInteger weekday;//Weekday Component (1~7) 1=Sunday
@property (nonatomic, readonly) NSInteger weekdayOrdinal;//WeekdayOrdinal Component
@property (nonatomic, readonly) NSInteger weekOfMonth;//WeekOfMonth Component (1~5)
@property (nonatomic, readonly) NSInteger weekOfYear;//WeekOfYear Component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;//YearForWeekOfYear Component
@property (nonatomic, readonly) NSInteger quarter;//Quarter Component (季度)

@property (nonatomic, readonly) BOOL isLeapYear;//whether the year is leap year
@property (nonatomic, readonly) BOOL isLeapMonth;//whether the month is leap month
@property (nonatomic, readonly) BOOL isToday;//whether date is Today
@property (nonatomic, readonly) BOOL isYesterday;//whether date is Yesterday


/**
 Returns a date representing the receiver date shifted later by the provided number of years.

 @param days Number of days to add
 @return Date modified by the number of desired days.
 */
- (NSDate *)dateByAddingDays:(NSInteger)days;

@end

NS_ASSUME_NONNULL_END
