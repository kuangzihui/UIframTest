//
//  Utils.h
//  YYWallet
//
//  Created by Hao Fu on 6/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "StringUtils.h"
//#import "Constants.h"
#import "TimeUtils.h"
//#import "ApiRequestUtils.h"

@interface Utils : NSObject
+ (NSString *)osVersion;
+ (NSString *)appVersion;
+ (NSString *)deviceID;
+ (CGSize)calculateStringSizeWithString:(NSString *)content fontSize:(CGFloat)fontSize constraintSize:(CGSize)contraintSize;
+ (NSString *)requestResultString:(ASIHTTPRequest *)request;
+ (void)playSoundWithSourceName:(NSString *)name fileType:(NSString *)type;
@end
