//
//  FirstLauchGuideVC.m
//  UIframTest
//
//  Created by l.h on 14-5-8.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import "FirstLauchGuideVC.h"

#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@interface FirstLauchGuideVC ()

@end

@implementation FirstLauchGuideVC
{
    UIPageControl *pageControl;
    UIScrollView  *dyScrollView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initGuide];   //加载新用户指导页面
    [self  initpagecontrol];

    self.view.backgroundColor=[UIColor  redColor];
}




-(void)initpagecontrol
{
    pageControl = [[UIPageControl alloc] init];
    pageControl.frame=CGRectMake(110, 400, 100, 30) ;
    pageControl.numberOfPages = 4; // 一共显示多少个圆点（多少页）
    // 设置非选中页的圆点颜色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    // 设置选中页的圆点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    // 禁止默认的点击功能
    pageControl.enabled = NO;
    pageControl.backgroundColor=[UIColor  clearColor];
    [self.view addSubview:pageControl];
    
    
}


-(void)initGuide
{
    NSArray *IMGarray=@[@"1136yd.png",@"1136yd1.png",@"1136yd2.png",@"1136yd3.png"];
    NSArray *IMGarray2=@[@"960yd.png",@"960yd1.png",@"960yd2.png",@"960yd3.png"];
    dyScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    dyScrollView.delegate=self;
    dyScrollView.backgroundColor=[UIColor greenColor];
    dyScrollView.contentSize=CGSizeMake(320*[IMGarray count], 460);
    dyScrollView.showsVerticalScrollIndicator=NO;
    dyScrollView.pagingEnabled=YES;
    dyScrollView.bounces=NO;       //取消弹性
    
    dyScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:dyScrollView];
    for (int i=0; i<[IMGarray  count]; i++)
    {
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(i*320, 0, 320, self.view.frame.size.height)];
        imgView.image=[UIImage imageNamed:(iPhone5?[IMGarray objectAtIndex:i]:[IMGarray2 objectAtIndex:i])];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        //        imgView.autoresizesSubviews = YES;
        //        imgView.autoresizingMask =
        //        UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [dyScrollView addSubview:imgView];
        if (i==[IMGarray  count]-1)
        {
            [imgView setUserInteractionEnabled:YES];
            UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame=CGRectMake(110, 300, 100, 40);
            [button  setBackgroundImage:[UIImage imageNamed:@"ksty"] forState:UIControlStateNormal];
            //             [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(firstpressed)  forControlEvents:UIControlEventTouchUpInside];
            [imgView addSubview:button];
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [pageControl setCurrentPage:offset.x / bounds.size.width];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    // 在滚动超过页面宽度的50%的时候，切换到新的页面
    int page = floor((dyScrollView.contentOffset.x + pageWidth/2)/pageWidth) ;
    pageControl.currentPage = page;
}

//点击button跳转到根视图
- (void)firstpressed
{
    [self.view  removeFromSuperview];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.view=nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
