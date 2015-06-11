//
//  TimeUtils.m
//  YYWallet
//
//  Created by Hao Fu on 7/1/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import "TimeUtils.h"
#import "StringUtils.h"

@implementation TimeUtils
+ (NSString *)timeInterval:(NSString *)time
{
    if ([StringUtils isEmpty:time]) {
        return @"";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *currentDate = [NSDate date];
    NSDate *pastDate = [dateFormatter dateFromString:time];
    NSTimeInterval intervalDouble = [currentDate timeIntervalSinceDate:pastDate];
    [dateFormatter release];
    
    long interval = (long)intervalDouble;
    
//    DLog(@"interval->%f",intervalDouble);
    
    long year = interval / (24 * 3600 * 30 * 12);
    long month = interval / (24 * 3600 * 30);
    long week = interval/(24*3600*7);
    long day = interval / (24 * 3600);
    long hour = interval % (24 * 3600) / 3600;
    long minute = interval % 3600 / 60;
    long second = interval % 60 / 60;
    
    NSString *res = @"";
    if (year != 0) {
        return [res stringByAppendingFormat:@"%ld年前",year];
    }
    if (month != 0) {
        return [res stringByAppendingFormat:@"%ld个月前",month];
    }
    if (week != 0) {
        return [res stringByAppendingFormat:@"%ld周前",week];
    }
    if (day != 0) {
        return [res stringByAppendingFormat:@"%ld天前",day];
    }
    if (hour != 0) {
        return [res stringByAppendingFormat:@"%ld小时前",hour];
    }
    if (minute != 0) {
        return [res stringByAppendingFormat:@"%ld分钟前",minute];
    }
    if (second != 0) {
        return [res stringByAppendingFormat:@"%ld秒前",second];
    }
    return @"";
}
+ (NSString *)timeFromUTCTime:(NSString *)utc_time
{
//    DLog(@"utcTime->%@",utc_time);
    if (![utc_time containsString:@"+"] || ![utc_time containsString:@"T"]) {
        return utc_time;
    }
    NSArray *tempArray = [utc_time componentsSeparatedByString:@"+"];
    NSString *uTime = [tempArray objectAtIndex:0];
    NSString *diffTime = [tempArray objectAtIndex:1];
    
    NSArray *uTimeArray = [uTime componentsSeparatedByString:@"T"];
    NSString *uTimeT = [uTimeArray objectAtIndex:1];
    NSArray *uTimeTArray = [uTimeT componentsSeparatedByString:@":"];
    
    NSString *uTimeTSec = [uTimeTArray objectAtIndex:2];
    NSRange range = [uTimeTSec rangeOfString:@"."];
    if (range.location != NSNotFound) {
        uTimeTSec = [uTimeTSec substringToIndex:range.location];
    }
    
    uTimeT = [[uTimeTArray objectAtIndex:0]stringByAppendingFormat:@":%@:%@",[uTimeTArray objectAtIndex:1],uTimeTSec];//HH:mm:ss
    
    //yyyy-MM-dd HH:mm:ss
    uTime = [[uTimeArray objectAtIndex:0] stringByAppendingFormat:@" %@",uTimeT];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *uTimeDate = [dateFormatter dateFromString:uTime];
    
    NSInteger hour = [[[diffTime componentsSeparatedByString:@":"] objectAtIndex:0] integerValue];
    NSInteger min = [[[diffTime componentsSeparatedByString:@":"] objectAtIndex:1] integerValue];
    NSTimeInterval interval = hour * 3600 + min * 60;
    
    NSDate *date = [uTimeDate dateByAddingTimeInterval:interval];
    NSString *time = [dateFormatter stringFromDate:date];
    [dateFormatter release];
//    DLog(@"beijing time->%@",time);
    return time;
}

+ (NSString *) getUtcTime
{
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timezone = [[NSTimeZone alloc] initWithName:@"UTC"];
    [formatter setTimeZone:timezone];
    //设定时间格式
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *utcTime =  [formatter stringFromDate:date];
    [formatter release];
    [timezone release];
    return utcTime;
}
@end
