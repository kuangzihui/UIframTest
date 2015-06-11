//
//  NSString+YYUtils.m
//  YYWallet
//
//  Created by Hao Fu on 6/18/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import "NSString+YYUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YYUtils)
- (BOOL)equalsIgnoreCase:(NSString *)str
{
    NSString *upper1 = [self uppercaseString];
    NSString *upper2 = [str uppercaseString];
    return [upper1 isEqualToString:upper2];
}
-(BOOL)isCorrectEmailAddress
{
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];
    NSInteger matches = [re numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    return matches != 0;
}
- (BOOL)isCorrectCellPhone
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
- (BOOL)containsString:(NSString *)str
{
    NSRange range = [self rangeOfString:str];
    if (range.location == NSNotFound) {
        return NO;
    }else{
        return YES;
    }
}
- (NSString *)URLEncodedString
{
    NSString *encodedString = [(NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8) autorelease];
    if (encodedString) {
        return encodedString;
    }
    return @"";
}
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ]; 
}

- (BOOL)ispassWord
{
    NSString *pass = @"[a-zA-Z0-9_$]{6,20}";
    NSPredicate *passPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pass];
    if ([passPredicate evaluateWithObject:self] == YES)
        return YES;
    return NO;
}
@end
