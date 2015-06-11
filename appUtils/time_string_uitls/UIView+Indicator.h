//  Created by Hao.Fu on 12/23/13.
//  Copyright (c) 2013 Hao.Fu. All rights reserved.
//




@interface UIView (Indicator)

- (UIView*)showIndicatorMessage:(NSString*)text;
- (UIView*)showIndicatorMessage:(NSString*)text bSquare:(BOOL)square;
- (UIView*)showIndicatorMessage:(NSString*)text hideAfterDelay:(NSTimeInterval)delay;
- (UIView*)showIndicatorMessage:(NSString*)text bSquare:(BOOL)square hideAfterDelay:(NSTimeInterval)delay;


- (UIView*)showIndicator;
- (UIView*)showIndicatorWithString:(NSString*)text;
- (UIView*)showIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style;

- (UIView*)showTransparentIndicator;
- (UIView*)showTransparentIndicatorWithString:(NSString*)text;
- (UIView*)showTransparentIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style;
- (UIView*)showIndicatorWithString:(NSString*)text andIndicatorStyle:(UIActivityIndicatorViewStyle)style andTransparent:(BOOL)bTransparent;
- (void)hideIndicator;
- (void)hideIndicator:(BOOL)animated;
- (void)hideIndicator:(BOOL)animated afterDelay:(NSTimeInterval)delay;

- (UIView*)showIndicatorAttention:(BOOL)on andText:(NSString*)text;
- (void)showTransparentForViewControllerWithString:(NSString *)loadingText;


- (UIView *)showSuccessfulIndicatorWithMessage:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;
- (UIView *)showErrorIndicatorWithMessage:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;

@end
