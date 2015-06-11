//
//  FiveViewController.m
//  UIframTest
//
//  Created by l.h on 14-4-28.
//  Copyright (c) 2014年 WeiXingApp. All rights reserved.
//

#import "FiveViewController.h"

//设置相关
#define KSETTINGPLIST @"Documents/setting.plist"
#define KFONTSIZEKEY @"fontSize"
#define KNEWSPUSHKEY @"newsPush"
#define KOFFLINEKEY @"offLine"

@interface FiveViewController ()

@end

@implementation FiveViewController
{

    NSMutableDictionary  *_settingDic;
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
    self.view.backgroundColor=[UIColor blueColor];
    
    NSString *settingPath = [NSHomeDirectory() stringByAppendingPathComponent: KSETTINGPLIST];
    //如果不存在就创建
    if ([[NSFileManager defaultManager] fileExistsAtPath: settingPath])
    {
        _settingDic = [[NSMutableDictionary alloc] initWithContentsOfFile: settingPath];
    }
    else
    {
        [[NSFileManager defaultManager] createFileAtPath: settingPath contents: nil attributes: nil];
        
        _settingDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                       [NSNumber numberWithInt: 1], KFONTSIZEKEY,
                       [NSNumber numberWithBool: YES], KNEWSPUSHKEY,
                       [NSNumber numberWithBool:NO], KOFFLINEKEY,
                       nil];
        
        [_settingDic writeToFile: settingPath atomically: YES];
    }

    
    
    
    
    
    
    CGRect  tabFram=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UITableView   *setTableView=[[UITableView  alloc] initWithFrame:tabFram  style:UITableViewStyleGrouped];
    setTableView.dataSource=self;
    setTableView.delegate=self;
    [self.view  addSubview:setTableView];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section != 1)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}


//标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"阅读设置";
            break;
            
        case 1:
            return @"订阅设置";
            break;
            
        case 2:
            return @"缓存控制";
            break;
            
        case 3:
            return @"产品信息";
            break;
            
        default:
            break;
    }
  
    return  @"biaoti";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    switch (section)
    {
        case 0:
            switch (row)
        {
            case 0:
                cell.textLabel.text = @"字体大小";
                
                NSArray *segments = [NSArray arrayWithObjects:@"小", @"中", @"大", nil];
                UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems: segments];
//                [segmented addTarget: self action: @selector(fontSizeValueChanged:) forControlEvents: UIControlEventValueChanged];
                segmented.frame = CGRectMake(cell.frame.size.width - segmented.frame.size.width-19, 5, segmented.frame.size.width, segmented.frame.size.height+1);
                [cell.contentView addSubview: segmented];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                break;
        }
            break;
            
        case 1:
            switch (row)
        {
            case 0:
            {
                cell.textLabel.text = @"消息推送";
                
                UISwitch *sw = [[UISwitch alloc] init];
//                [sw addTarget: self action: @selector(newsPushValueChanged:) forControlEvents: UIControlEventValueChanged];
                sw.frame = CGRectMake(cell.frame.size.width - sw.frame.size.width - 25, (cell.frame.size.height - sw.frame.size.height) / 2, cell.frame.size.width, cell.frame.size.height);
                [cell.contentView addSubview: sw];
                
                if (1)
                {
                    [sw setOn: YES];
                }
                else
                {
                    [sw setOn: NO];
                }
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                break;
            }
                
            case 1:
            {
                cell.textLabel.text = @"离线阅读";
                
                UISwitch *sw = [[UISwitch alloc] init];
//                [sw addTarget: self action: @selector(offLineValueChanged:) forControlEvents: UIControlEventValueChanged];
                sw.frame = CGRectMake(cell.frame.size.width - sw.frame.size.width - 25, (cell.frame.size.height - sw.frame.size.height) / 2, cell.frame.size.width, cell.frame.size.height);
                [cell.contentView addSubview: sw];
                
                if (1)
                {
                    [sw setOn: YES];
                }
                else
                {
                    [sw setOn: NO];
                }
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                break;
            }
        }
            break;
            
        case 2:
            switch (row)
        {
            case 0:
                cell.textLabel.text = @"清除缓存";
                
                break;
        }
            break;
            
        case 3:
            switch (0)
        {
            case 0:
                cell.textLabel.text = @"关于";
                
                [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
                break;
        }
            
        default:
            break;
    }

    
    return cell;
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
