//
//  Utils.m
//  YYWallet
//
//  Created by Hao Fu on 6/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import "Utils.h"
#import "OpenUDID.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation Utils
+ (NSString *)osVersion
{
    return [[UIDevice currentDevice]systemVersion];
}
+ (NSString *)appVersion
{
    return [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"];
}
+ (NSString *)deviceID
{
    return [OpenUDID value];
}
+ (CGSize)calculateStringSizeWithString:(NSString *)content fontSize:(CGFloat)fontSize constraintSize:(CGSize)contraintSize
{
    return [content sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:contraintSize lineBreakMode:NSLineBreakByWordWrapping];
}
+ (NSString *)requestResultString:(ASIHTTPRequest *)request
{
    return [@"" stringByAppendingFormat:@"\n---------------request info---------------\n\n----request error----\n%@\n----status code----\n%d\n----status message----\n%@\n----response string----\n%@\n\n---------------request info---------------\n",[request.error localizedDescription],request.responseStatusCode,request.responseStatusMessage,[StringUtils convertXMLChars:request.responseString]];
}
+ (void)playSoundWithSourceName:(NSString *)name fileType:(NSString *)type
{
    SystemSoundID soundId;
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:type];
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL URLWithString:path], &soundId);
    AudioServicesPlaySystemSound(soundId);
}
@end
