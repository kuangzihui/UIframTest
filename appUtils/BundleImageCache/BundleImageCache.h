//
//  BundleImageCache.h
//  GWRDice
//
//  Created by Hao.Fu on 11/21/13.
//  Copyright (c) 2013 Hao.Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BundleImageCache : NSObject
{
	NSMutableDictionary *imageCache;
}


+ (BundleImageCache *) sharedCache;
+ (UIImage *) imageNamed:(NSString *) imageName;
+ (UIImage *) imageNamed:(NSString *) imageName withCapInsets:(UIEdgeInsets)capInsets;


+ (UIImage *) imageNamed:(NSString *) imageName withLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;


@end

