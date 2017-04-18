//
//  HD_TabBarController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TabBarController.h"
#import "HD_NavigationController.h"
#import "HD_TabBar.h"
#import "HD_EssenceViewController.h"
#import "HD_NewViewController.h"
#import "HD_FollowViewController.h"
#import "HD_MeViewController.h"
@interface HD_TabBarController ()

@end

@implementation HD_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarItem *item = [UITabBarItem appearance];
   
    //普通状态下文字的属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    //选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    [self setupOneChildController:  [[HD_NavigationController alloc]initWithRootViewController:[[HD_EssenceViewController alloc]init]] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self setupOneChildController:[[HD_NavigationController alloc]initWithRootViewController:[[HD_NewViewController alloc]init]] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self setupOneChildController:[[HD_NavigationController alloc]initWithRootViewController:[[HD_FollowViewController alloc]init]]  title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self setupOneChildController: [[HD_NavigationController alloc]initWithRootViewController:[[HD_MeViewController alloc]init]]   title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    //更换tabBar的操作

    [self setValue:[[HD_TabBar alloc]init] forKeyPath:@"tabBar"];
    
    
}

-(void)setupOneChildController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{

 
   
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
    

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
