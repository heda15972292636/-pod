//
//  HD_BaseViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_BaseViewController.h"

@interface HD_BaseViewController ()

@end

@implementation HD_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
