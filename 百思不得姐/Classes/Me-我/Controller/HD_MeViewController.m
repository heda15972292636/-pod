//
//  HD_MeViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_MeViewController.h"

@interface HD_MeViewController ()

@end

@implementation HD_MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"%s",__func__);
       self.view.backgroundColor = HD_CommonBgColor;
    
    self.navigationItem.title = @"我的关注";
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    UIBarButtonItem *settingItem = [HD_ItemManager itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [HD_ItemManager itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self  action:@selector(followClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    
    
    
}

-(void)settingClick{
    NSLog(@"%s",__func__);
    
}

-(void)followClick{
    NSLog(@"%s",__func__);

}


@end
