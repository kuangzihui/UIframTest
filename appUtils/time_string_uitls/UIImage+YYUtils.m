//
//  UIImage+YYUtils.m
//  YYWallet
//
//  Created by Hao Fu on 9/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import "UIImage+YYUtils.h"

@implementation UIImage (YYUtils)
- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets Image:(UIImage *)_img
{
    if ([[Utils osVersion]floatValue] < 6.0f) {
        _img = [_img resizableImageWithCapInsets:capInsets];
    }else if([[Utils osVersion]floatValue] >= 6.0f){
        _img = [_img resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    }
    return _img;
}


@end
