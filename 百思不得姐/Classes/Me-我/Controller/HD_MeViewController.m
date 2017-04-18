//
//  HD_MeViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_MeViewController.h"
#import "HD_MeCell.h"
#import "HD_MeFooterView.h"
#import "HD_SettingViewController.h"
#import "HD_BackItem.h"
@interface HD_MeViewController ()

@end

@implementation HD_MeViewController
-(instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"%s",__func__);
       self.view.backgroundColor = HD_CommonBgColor;
    
    self.navigationItem.title = @"我的关注";
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    UIBarButtonItem *settingItem = [HD_BackItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [HD_BackItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self  action:@selector(followClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
   // self.tableView.tableHeaderView   放在整个表格的头部
   // self.tableView.tableFooterView   放在整个表格的尾部
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = HD_Margin;
    self.tableView.contentInset = UIEdgeInsetsMake(HD_Margin - 35, 0, 0, 0);
    
    HD_MeFooterView *footView = [[HD_MeFooterView alloc]init];
  //  footView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = footView;
    
    
}

-(void)settingClick{
    
    [self.navigationController pushViewController:[[HD_SettingViewController alloc]init] animated:YES];
 
    
}

-(void)followClick{
    NSLog(@"%s",__func__);

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *ID = @"cell";
    HD_MeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HD_MeCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else{
     cell.textLabel.text = @"离线下载";
     cell.imageView.image = nil;
    }
    

    return cell;
}



//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//     ///单个分组的头部
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//     //单个分组的尾部
//}
@end
