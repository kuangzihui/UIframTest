//
//  ThirdViewController.m
//  UIframTest
//
//  Created by l.h on 14-4-28.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"3";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor  grayColor];
    [self  initUIlabel];
}

-(void)initUIlabel
{
    float  viewWidth=self.view.frame.size.width;
    float  viewHeith=self.view.frame.size.width;
    
    UILabel   *label=[[UILabel   alloc]initWithFrame:CGRectMake(viewWidth/2, viewHeith/2, viewWidth/2, viewHeith/4)];
    label.text=@"页面3";
    label.textColor=[UIColor  whiteColor];
    [self.view  addSubview:label];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
