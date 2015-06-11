//
//  NSString+YYUtils.h
//  YYWallet
//
//  Created by Hao Fu on 6/18/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringUtils.h"

@interface NSString (YYUtils)
- (BOOL)equalsIgnoreCase:(NSString *)str;
- (BOOL)isCorrectEmailAddress;
- (BOOL)isCorrectCellPhone;
- (NSString *)trim;
- (BOOL)containsString:(NSString *)str;
- (NSString *)URLEncodedString;
- (NSString *)md5;
- (BOOL)ispassWord;
@end
