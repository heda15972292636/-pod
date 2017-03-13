//
//  HD_FollowViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_FollowViewController.h"

@interface HD_FollowViewController ()

@end

@implementation HD_FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"%s",__func__);
       self.view.backgroundColor = HD_CommonBgColor;
    
    self.navigationItem.title = @"我的关注";
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    self.navigationItem.leftBarButtonItem = [HD_ItemManager itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon_click" target:self action:@selector(followClick)];
}

-(void)followClick{
  
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
