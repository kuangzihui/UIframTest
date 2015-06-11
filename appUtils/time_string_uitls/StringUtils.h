//
//  StringUtils.h
//  YYWallet
//
//  Created by Hao Fu on 6/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+YYUtils.h"

@interface StringUtils : NSObject
+ (BOOL)isEmpty:(NSString *)str;
+ (BOOL)isNotEmpty:(NSString *)str;
+ (NSString *)base64:(NSString *)str;
+ (NSString *)getNotNullValue:(NSString *)str;
+ (NSString *)convertXMLChars:(NSString *)xmlStr;
+ (NSString *)get3digitsNumberString:(int)number;
+ (NSString *)getShopDistance:(NSString *)distance;
@end
