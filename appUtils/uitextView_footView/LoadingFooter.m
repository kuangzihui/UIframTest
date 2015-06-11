//
//  LoadingFooter.m
//  GWRBar
//
//  Created by Hao.Fu on 13-12-20.
//  Copyright (c) 2013年 Hao.Fu. All rights reserved.
//

#import "LoadingFooter.h"


@interface LoadingFooter ()

@end

@implementation LoadingFooter

@synthesize textLabel = lblText;
@synthesize indicatorView;
@synthesize indicatorPosition;

- (id)init
{
    self = [self initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    indicatorPosition = LoadingIndicatorPositionRight;
    
    lblText = [[UILabel alloc] init];
    lblText.backgroundColor = [UIColor clearColor];
    lblText.textColor = [UIColor whiteColor];
    lblText.font = [UIFont systemFontOfSize:12.0f];
    lblText.text = @"  请稍等, 加载中";
    [self addSubview:lblText];
    
    indicatorView = [[UIActivityIndicatorView alloc] 
                          initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self addSubview:self.indicatorView];
    return self;
}

- (void)dealloc
{
    [lblText release];
    [indicatorView release];
    [super dealloc];
}

- (void)layoutSubviews
{
    CGFloat indicatorWidth = 20;
    if(![self.indicatorView isAnimating]){
        indicatorWidth = 0;
    }
    CGFloat lblWidth = [lblText.text sizeWithFont:lblText.font].width;
    CGFloat subviewWidth = lblWidth + 2 + indicatorWidth;
    CGFloat xposition = (self.frame.size.width - subviewWidth) / 2;
    
    if(indicatorPosition == LoadingIndicatorPositionRight){
        lblText.frame = CGRectMake(xposition, 0, lblWidth, self.frame.size.height);
        self.indicatorView.frame = CGRectMake(xposition + lblWidth + 2, 
                                              (self.frame.size.height - indicatorWidth) / 2, 
                                              indicatorWidth, 
                                              indicatorWidth);
    }else if(indicatorPosition == LoadingIndicatorPositionLeft){
        self.indicatorView.frame = CGRectMake(xposition, 
                                              (self.frame.size.height - indicatorWidth) / 2, 
                                              indicatorWidth, 
                                              indicatorWidth);
        lblText.frame = CGRectMake(xposition + indicatorWidth, 
                                   0, 
                                   lblWidth, 
                                   self.frame.size.height);
    }else if(indicatorPosition == LoadingIndicatorPositionBottom){
        xposition = (self.frame.size.width - lblWidth) / 2;
        lblText.frame = CGRectMake(xposition, 0, lblWidth, self.frame.size.height);
        
        xposition = (self.frame.size.width - indicatorWidth) / 2;
        CGFloat yposition = 0;
        if(![lblText.text isEqualToString:@""]){
            yposition = lblText.frame.origin.y + lblText.font.lineHeight;
        }
        self.indicatorView.frame = CGRectMake(xposition, 
                                              yposition, 
                                              indicatorWidth, 
                                              indicatorWidth);
    }else if(indicatorPosition == LoadingIndicatorPositionCust){
        self.indicatorView.frame = CGRectMake(self.frame.size.width/2-10,
                                              (self.frame.size.height - 50) / 2+5,
                                              indicatorWidth,
                                              indicatorWidth);
        lblText.frame = CGRectMake((self.frame.size.width-lblWidth-5)/2,
                                   30,
                                   lblWidth,
                                   20);
    }
}

- (void)setLabelText:(NSString *)str
{
    self.textLabel.text = str;
    [self layoutSubviews];
}

- (void)setLoading:(BOOL)loading
{
//    self.textLabel.text = @"加载中...";
    if(loading){
        [self.indicatorView startAnimating];
    }else{
        [self.indicatorView stopAnimating];
    }
    [self layoutSubviews];
}

- (void)setIndicatorPosition:(LoadingIndicatorPosition)position
{
    indicatorPosition = position;
    [self layoutSubviews];
}

@end
