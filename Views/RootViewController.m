//
//  RootViewController.m
//  UIframTest
//
//  Created by l.h on 14-4-28.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import "RootViewController.h"
#import "SVProgressHUD.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"1";
    }
    return self;
}

- (void)viewDidLoad
{
    
    // http://blog.csdn.net/xiazailushang/article/details/9716043  使用方法
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor brownColor];
    [self  initUIlabel];
    
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];// 同步执行方法
    //[SVProgressHUD showWithStatus:@"加载中..."];
    //[SVProgressHUD showProgress:0.1f];
    [SVProgressHUD showSuccessWithStatus:@"success"];
//    NIAttributedLabel *attrLab = [[NIAttributedLabel alloc] initWithFrame:CGRectMake(0, 100,320, 50)];
//    attrLab.text = @"fjhjhjhjhfjhfjhfjjjjjhfj";
//    attrLab.font = [UIFont systemFontOfSize:14];
//    [attrLab setTextColor:[UIColor greenColor] range:NSMakeRange(1, 3)];
//    [attrLab setTextKern:6.0];// 设置横向间距
//    [attrLab setStrokeColor:[UIColor redColor] range:NSMakeRange(4, 7)];
//    //[attrLab setStrokeWidth:2.0]; // 设置字体宽度
//    attrLab.autoDetectLinks = YES;
//   // [attrLab setUnderlineStyle:kCTUnderlineStyleThick]; // 加下划线
//    [attrLab setUnderlineStyle:kCTUnderlineStyleDouble modifier:kCTUnderlinePatternSolid range:NSMakeRange(1, 7)]; // 加下划线并选择样式
//   // attrLab.backgroundColor = [ UIColor redColor];
//   // [attrLab insertImage:[UIImage imageNamed:@"blueArrow"] atIndex:0];
//    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blueArrow"] ];
//    imgV.frame = CGRectMake(150, 0, 14 , 14);
//    [attrLab insertSubview:imgV atIndex:0];
//    [self.view addSubview:attrLab];
//    
//    NITextField *textF = [[NITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 50)];
//    textF.placeholder = @"请输入手机号";
//   // textF.placeholderTextColor = [UIColor redColor];
//    textF.placeholderFont = [UIFont systemFontOfSize:40];
//    [self.view addSubview:textF];
    
    
}




-(void)initUIlabel
{
    float  viewWidth=self.view.frame.size.width;
    float  viewHeith=self.view.frame.size.width;
    
    UILabel   *label=[[UILabel   alloc]initWithFrame:CGRectMake(viewWidth/2, viewHeith/2, viewWidth/2, viewHeith/4)];
    label.text=@"页面1";
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
