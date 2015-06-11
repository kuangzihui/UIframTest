//
//  LoadingFooter.h
//  GWRBar
//
//  Created by Hao.Fu on 13-12-20.
//  Copyright (c) 2013年 Hao.Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    LoadingIndicatorPositionLeft,
    LoadingIndicatorPositionRight,
    LoadingIndicatorPositionBottom,
    LoadingIndicatorPositionCust
}LoadingIndicatorPosition;

@interface LoadingFooter : UIView {
    UILabel *lblText;
    UIActivityIndicatorView *indicatorView;
    
    LoadingIndicatorPosition indicatorPosition;
}

@property(nonatomic, readonly)UILabel *textLabel;
@property(nonatomic, readonly)UIActivityIndicatorView *indicatorView;
@property(nonatomic)LoadingIndicatorPosition indicatorPosition;

- (void)setLoading:(BOOL)loading;
- (void)setLabelText:(NSString *)str;

@end
