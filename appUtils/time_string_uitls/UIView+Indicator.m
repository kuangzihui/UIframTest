//  Created by Hao.Fu on 12/23/13.
//  Copyright (c) 2013 Hao.Fu. All rights reserved.
//




#pragma mark -
/**/

#import "UIView+Indicator.h"
#import "MBProgressHUD.h"
#import "BundleImageCache.h"
#import <QuartzCore/QuartzCore.h>
#import "MMVectorImage.h"


#define tagIndicatorView 9876
#define fontSize    14

@implementation UIView (Indicator)

#pragma mark private
- (UIView*)showIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style andTransparent:(BOOL)bTransparent
{
    [self hideIndicator];

    MBProgressHUD *indicatorView = [[[MBProgressHUD alloc] initWithFrame:self.bounds] autorelease];
    [self addSubview:indicatorView];
    
    indicatorView.tag = tagIndicatorView;
    indicatorView.opacity = bTransparent?0:0.8;
    indicatorView.labelFont = [UIFont fontWithName:@"Helvetica" size:fontSize];
    indicatorView.labelText = text;
    indicatorView.removeFromSuperViewOnHide = YES;
    [indicatorView show:YES];
    
    return indicatorView;
}



#pragma mark - no indicator

- (UIView*)showIndicatorMessage:(NSString*)text bSquare:(BOOL)square
{
    [self hideIndicator];
    
    CGRect rect = self.bounds;
    UIView* indicatorView = [[[UIView alloc] initWithFrame:rect] autorelease];
	indicatorView.backgroundColor = [UIColor clearColor];
	indicatorView.center = self.center;
	indicatorView.tag = tagIndicatorView;
	indicatorView.clipsToBounds = YES;
    
    UILabel *lblText = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    lblText.backgroundColor = [UIColor clearColor];
    lblText.layer.cornerRadius = 8;
    lblText.textColor = [UIColor whiteColor];
    lblText.font = [UIFont fontWithName:@"Helvetica" size:fontSize];
    lblText.textAlignment = NSTextAlignmentCenter;
    lblText.text = text;
    lblText.numberOfLines = 0;
    CGSize sz = [text sizeWithFont:lblText.font];
    CGSize szSquare = [text sizeWithFont:lblText.font constrainedToSize:CGSizeMake(100, 1000)];
    CGFloat maxWid = szSquare.width > szSquare.height ? szSquare.width : szSquare.height;
    if(maxWid > 120){
        maxWid = 120;
    }else if(maxWid < 60){
        maxWid = 60;
    }
    szSquare.width = maxWid;
    szSquare.height = maxWid;
    rect.size = square?szSquare:CGSizeMake(MIN(rect.size.width, sz.width+40), 40);
    lblText.frame = CGRectMake(5, 5, rect.size.width, rect.size.height);
    
    rect.size.width += 10;
    rect.size.height += 10;
    UIView *roundRect = [[UIView alloc] initWithFrame:rect];
    roundRect.center = indicatorView.center;
    roundRect.backgroundColor = [UIColor colorWithWhite: 0.0 alpha: 0.8];
    roundRect.layer.cornerRadius = 8.0f;
    [indicatorView addSubview:roundRect];
    [roundRect addSubview:lblText];
    [roundRect release];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.30];
    [self addSubview:indicatorView];
    [UIView commitAnimations];
    
    return indicatorView;

}
- (UIView*)showIndicatorMessage:(NSString*)text bSquare:(BOOL)square hideAfterDelay:(NSTimeInterval)delay
{
    UIView *view = [self showIndicatorMessage:text bSquare:square];
    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:delay];
//    [UIView setAnimationDelegate:self];
//    view.alpha = 0.02f;
//    [UIView commitAnimations];

    [view performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:delay+1];
    
    return view;
}

- (UIView*)showIndicatorMessage:(NSString*)text hideAfterDelay:(NSTimeInterval)delay
{
    return [self showIndicatorMessage:text bSquare:NO hideAfterDelay:delay];
}

- (UIView*)showIndicatorMessage:(NSString*)text
{
    return [self showIndicatorMessage:text bSquare:NO];
}

#pragma mark - indicator
////////////////////////////////////////////////
- (UIView*)showIndicator
{   
    return [self showIndicatorWithString:nil];
}
- (UIView*)showIndicatorWithString:(NSString*)text
{
    return [self showIndicatorWithString:text andIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
}
- (UIView*)showIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    return [self showIndicatorWithString:text andIndicatorStyle:style andTransparent:NO];
}

//
- (UIView*)showTransparentIndicator
{
    return [self showTransparentIndicatorWithString:nil];
}
- (UIView*)showTransparentIndicatorWithString:(NSString*)text
{
    return [self showTransparentIndicatorWithString:text andIndicatorStyle:UIActivityIndicatorViewStyleWhite];
}
- (UIView*)showTransparentIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    return [self showIndicatorWithString:text andIndicatorStyle:style andTransparent:YES];
}


#pragma mark - hide indicator
- (void)hideIndicator
{
    [self hideIndicator:YES];
}

- (void)hideIndicator:(BOOL)animated
{
    [self hideIndicator:animated afterDelay:0];
}
- (void)hideIndicator:(BOOL)animated afterDelay:(NSTimeInterval)delay
{    
    for (UIView* subView in self.subviews ){
        if(subView.tag == tagIndicatorView){
            if ([subView isKindOfClass:[MBProgressHUD class]]){
                MBProgressHUD *hud = (id)subView;
                [hud hide:animated afterDelay:delay];
            }else if([subView isKindOfClass:[UIView class]]){
                [subView removeFromSuperview];
            }else{
                
            }
		}
	}
}

#pragma mark - special indicator
- (UIView*)showIndicatorAttention:(BOOL)on andText:(NSString*)text
{    
    MBProgressHUD *indicatorView = [[[MBProgressHUD alloc] initWithView:self] autorelease];
    [self addSubview:indicatorView];
    
    UIImage *imgView = on?[BundleImageCache imageNamed:@"checkmark_indicator.png"]:[BundleImageCache imageNamed:@"checkmark_indicator.png"];
    indicatorView.customView = [[[UIImageView alloc] initWithImage:imgView] autorelease];
    indicatorView.mode = MBProgressHUDModeCustomView;
    indicatorView.tag = tagIndicatorView;
    indicatorView.labelFont = [UIFont fontWithName:@"Helvetica" size:fontSize];
    indicatorView.labelText = text;
    indicatorView.removeFromSuperViewOnHide = YES;
    [indicatorView show:YES];
    [indicatorView hide:YES afterDelay:2];

    return indicatorView;
}

- (void)showTransparentForViewControllerWithString:(NSString *)loadingText
{
	UIView* blockerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 320, 80)];
	blockerView.backgroundColor = [UIColor clearColor];
	blockerView.center = CGPointMake(160, 200);
	blockerView.tag = tagIndicatorView;
	blockerView.clipsToBounds = YES;
	if ([blockerView.layer respondsToSelector: @selector(setCornerRadius:)])
	{
		[(id) blockerView.layer setCornerRadius: 10];
	}
	
	UILabel* label = [[UILabel alloc] initWithFrame: CGRectMake(0, 25, blockerView.bounds.size.width, 15)];
	label.text = loadingText;
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor blackColor];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
	[blockerView addSubview: label];
	[label release];
	UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
	
	spinner.frame = CGRectMake((blockerView.frame.size.width - [loadingText sizeWithFont:label.font].width) / 2 - 23, 23, 20, 20);
	[blockerView addSubview: spinner];
	[self addSubview: blockerView];
	//[self insertSubview:blockerView atIndex:[self getLastVisibleViewIndex]];
	[blockerView release];
	[spinner startAnimating];
	[spinner release];
}

- (UIView *)showSuccessfulIndicatorWithMessage:(NSString *)text hideAfterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *indicatorView = [[[MBProgressHUD alloc] initWithView:self] autorelease];
    [self addSubview:indicatorView];
    
    UIColor *imageFill = [UIColor colorWithWhite:1.f alpha:1.f];
    
    UIImage *imgView = [MMVectorImage vectorImageShapeOfType:MMVectorShapeTypeCheck size:CGSizeMake(37, 37) fillColor:imageFill];
    
    indicatorView.customView = [[[UIImageView alloc] initWithImage:imgView] autorelease];
    indicatorView.mode = MBProgressHUDModeCustomView;
    indicatorView.tag = tagIndicatorView;
    indicatorView.labelFont = [UIFont fontWithName:@"Helvetica" size:fontSize];
    indicatorView.labelText = text;
    indicatorView.removeFromSuperViewOnHide = YES;
    [indicatorView show:YES];
    [indicatorView hide:YES afterDelay:delay];
    
    return indicatorView;
}
- (UIView *)showErrorIndicatorWithMessage:(NSString *)text hideAfterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *indicatorView = [[[MBProgressHUD alloc] initWithView:self] autorelease];
    [self addSubview:indicatorView];
    
    UIColor *imageFill = [UIColor colorWithWhite:1.f alpha:1.f];
    
    UIImage *imgView = [MMVectorImage vectorImageShapeOfType:MMVectorShapeTypeX size:CGSizeMake(37, 37) fillColor:imageFill];
    
    indicatorView.customView = [[[UIImageView alloc] initWithImage:imgView] autorelease];
    indicatorView.mode = MBProgressHUDModeCustomView;
    indicatorView.tag = tagIndicatorView;
    indicatorView.labelFont = [UIFont fontWithName:@"Helvetica" size:fontSize];
    indicatorView.labelText = text;
    indicatorView.removeFromSuperViewOnHide = YES;
    [indicatorView show:YES];
    [indicatorView hide:YES afterDelay:delay];
    
    return indicatorView;
}


@end
