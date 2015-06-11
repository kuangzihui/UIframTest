//
//  UIImage+YYUtils.h
//  YYWallet
//
//  Created by Hao Fu on 9/17/13.
//  Copyright (c) 2013 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"

@interface UIImage (YYUtils)
- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets Image:(UIImage *)_img;
@end
