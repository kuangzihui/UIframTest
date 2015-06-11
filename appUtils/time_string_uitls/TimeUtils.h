//
//  TimeUtils.h
//  YYWallet
//
//  Created by Hao Fu on 7/1/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject
+ (NSString *)timeInterval:(NSString *)time;
+ (NSString *)timeFromUTCTime:(NSString *)utc_time;
+ (NSString *) getUtcTime;
@end
