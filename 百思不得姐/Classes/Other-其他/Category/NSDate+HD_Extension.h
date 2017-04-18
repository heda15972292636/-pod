//
//  NSDate+HD_Extension.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/21.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HD_Extension)
- (NSDateComponents *)intervalToDate:(NSDate *)date;
- (NSDateComponents *)intervalToNow;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;

/**
 * 是否为明天
 */
- (BOOL)isTomorrow;
@end
