
//
//  StringUtils.m
//  YYWallet
//
//  Created by Hao Fu on 6/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import "StringUtils.h"
#import "GTMBase64.h"

@implementation StringUtils
+ (BOOL)isEmpty:(NSString *)str
{
    BOOL res = NO;
    if (str == nil || [str isEqualToString:@""]) {
        res = YES;
    }
    return res;
}

+ (BOOL)isNotEmpty:(NSString *)str
{
    return ![StringUtils isEmpty:str];
}

+ (NSString *)base64:(NSString *)str
{
    NSString *temp = [[NSString alloc]initWithData:[GTMBase64 encodeData:[str dataUsingEncoding:NSUTF8StringEncoding]] encoding:NSUTF8StringEncoding];
    NSString *res = @"";
    res = [temp stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    res = [res stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    res = [res stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    [temp release];
    return res;
}
+ (NSString *)getNotNullValue:(NSString *)str
{
    if (str == nil) {
        str = @"";
    }
    return str;
}
+ (NSString *)convertXMLChars:(NSString *)xmlStr
{
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&#xD;" withString:@"\r"];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&amp;" withString:@" "];
    xmlStr = [xmlStr stringByReplacingOccurrencesOfString:@"&#x9;" withString:@" "];
//    DLog(@"\n---------------converted xml string---------------\n\n%@\n\n---------------converted xml string---------------\n",xmlStr);
    return xmlStr;
}
+ (NSString *)get3digitsNumberString:(int)number
{
    if (number < 10) {
        return [@"" stringByAppendingFormat:@"00%d",number];
    }else if(number < 100){
        return [@"" stringByAppendingFormat:@"0%d",number];
    }else if(number < 1000){
        return [@"" stringByAppendingFormat:@"%d",number];
    }else{
        return @"";
    }
}
+ (NSString *)getStreetName:(NSString *)string
{
    if ([string containsString:@"路"]) {
        NSRange range = [string rangeOfString:@"路"];
        int index = (int)range.location;
        return [string substringToIndex:index+1];
    }else{
        return string;
    }
    return @"";
}
+ (NSString *)getShopDistance:(NSString *)distance
{
    if ([StringUtils isEmpty:distance]) {
        return @"-";
    }
    NSInteger dis = round([distance floatValue]);
    dis = round(dis);
    if (dis >= 1000.0f) {
        CGFloat d = dis / 1000.0f;
        return [@"" stringByAppendingFormat:@"%.1fkm",d];
    }else{
        dis /= 10;
        dis *= 10;
        return [@"" stringByAppendingFormat:@"%ldm",(long)dis];
    }
}
@end
