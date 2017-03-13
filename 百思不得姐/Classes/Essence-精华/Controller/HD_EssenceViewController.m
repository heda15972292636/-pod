//
//  HD_EssenceViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_EssenceViewController.h"
#import "HD_ItemManager.h"
@interface HD_EssenceViewController ()

@end

@implementation HD_EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__func__);
    self.view.backgroundColor = HD_CommonBgColor;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [HD_ItemManager itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    
}
-(void)tagClick{
    NSLog(@"%s",__func__);
}

@end
