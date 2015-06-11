//
//  BundleImageCache.m
//  GWRDice
//
//  Created by Hao.Fu on 11/21/13.
//  Copyright (c) 2013 Hao.Fu. All rights reserved.
//

#import "BundleImageCache.h"

@interface BundleImageCache ()
- (UIImage *) getImageNamed:(NSString *) name;
- (void) clearCache;
@end

@implementation BundleImageCache

static BundleImageCache *globalInstance;

+ (BundleImageCache *) sharedCache {
	if (!globalInstance) {
        @synchronized(self) {
            globalInstance = [[BundleImageCache alloc] init];
        }
	}
	
	return globalInstance;
}

+ (UIImage *) imageNamed:(NSString *) imageName {
	return [[BundleImageCache sharedCache] getImageNamed:imageName];
}

+ (UIImage *) imageNamed:(NSString *) imageName withCapInsets:(UIEdgeInsets)capInsets
{
    UIImage *image = [self imageNamed:imageName];
    return [image resizableImageWithCapInsets:capInsets];
}

+ (UIImage *) imageNamed:(NSString *) imageName withLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight
{
    UIImage *image = [self imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}

- (UIImage *) getImageNamed:(NSString *) name {
	UIImage *result = [imageCache objectForKey:name];
	
	if (!result) {
        result = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@""]];
		
		if (result) {
			[imageCache setObject:result forKey:name];
		}
	}
	
	return result;
}


- (void) clearCache {
	[imageCache removeAllObjects];
}


- (id) init {
	if ((self = [super init])) {
		imageCache = [NSMutableDictionary new];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearCache) name:UIApplicationDidReceiveMemoryWarningNotification object:Nil];
	}
	
	return self;
}


- (void) dealloc {
	[imageCache release];
	[super dealloc];
}

@end

