//
//  HD_EssenceViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_EssenceViewController.h"
#import "HD_BackItem.h"
#import "HD_TitleBtn.h"
#import "HD_AllViewController.h"
#import "HD_VideoViewController.h"
#import "HD_VoiceViewController.h"
#import "HD_PictureViewController.h"
#import "HD_WordViewController.h"
#import "HD_RecommentTagController.h"

@interface HD_EssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIButton *selectBtn;

@property(nonatomic,weak)UIView *indicatorView;

@property(nonatomic,weak)UIScrollView *scorllView;

@property(nonatomic,weak)UIView *titleViews;
@end

@implementation HD_EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNav];
    [self setupChildViewControllers];
    [self setupScrollView];
    [self setupTitleView];

    self.automaticallyAdjustsScrollViewInsets = NO;
    //默认添加子控制器
    [self addChildVcView];
    
    
    
}

-(void)setupChildViewControllers{
   
    HD_AllViewController *all = [[HD_AllViewController alloc]init];
    [self addChildViewController:all];
    
    HD_VideoViewController *video = [[HD_VideoViewController alloc]init];
    [self addChildViewController:video];
    
    HD_VoiceViewController *voice = [[HD_VoiceViewController alloc]init];
    [self addChildViewController:voice];
    
    HD_PictureViewController *picture = [[HD_PictureViewController alloc]init];
    [self addChildViewController:picture];
    
    HD_WordViewController *word = [[HD_WordViewController alloc]init];
    [self addChildViewController:word];
    
}
-(void)setupNav{

    self.view.backgroundColor = HD_CommonBgColor;
   // self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.title = @"精华";
    self.navigationItem.leftBarButtonItem = [HD_BackItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];


}

-(void)setupScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scorllView = scrollView;
    NSInteger count = self.childViewControllers.count;
    scrollView.contentSize = CGSizeMake(scrollView.HD_width * count, 0);

}


-(void)setupTitleView{
    //标题栏
    UIView *titleViews = [[UIView alloc]init];
    titleViews.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    titleViews.HD_width = self.view.HD_width;
    titleViews.HD_heigh = 35;
    titleViews.HD_x = 0 ;
    titleViews.HD_y = 64;
    [self.view addSubview:titleViews];
    self.titleViews = titleViews;
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    NSInteger count = titles.count;
    CGFloat titleButtonW = titleViews.HD_width / count;
    CGFloat titleButtonH = titleViews.HD_heigh;
    
    for (int i = 0; i < count; i++) {
        //创建
        HD_TitleBtn *btn = [HD_TitleBtn buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
     
      
        [titleViews addSubview:btn];
        
      
    
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
          [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    //按钮选中的颜色
    HD_TitleBtn *firstBtn = titleViews.subviews.firstObject;
    //底部的指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [firstBtn titleColorForState:UIControlStateSelected];
    indicatorView.HD_heigh = 1;
    indicatorView.HD_y = titleViews.HD_heigh - indicatorView.HD_heigh;
    [titleViews addSubview:indicatorView];
    
    self.indicatorView = indicatorView;
    [firstBtn.titleLabel sizeToFit ];
    indicatorView.HD_width = firstBtn.titleLabel.HD_width;
    indicatorView.HD_centerX = firstBtn.HD_centerX;
    [self btnClick:firstBtn];
 
    
    
 }
-(void)btnClick:(UIButton *)btn{
//    [self.selectBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    self.selectBtn = btn;
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    
    //指示器
   [UIView animateWithDuration:0.25 animations:^{
       
       
        CGFloat titleW  = [btn.currentTitle sizeWithAttributes:@{NSFontAttributeName : btn.titleLabel.font}].width;
        self.indicatorView.HD_width = titleW + 10;
        self.indicatorView.HD_centerX = btn.HD_centerX;
    }];
//    for (NSInteger i = 0; i< count; i++) {
//        UIView *chileVcView = self.childViewControllers[i].view;
//        chileVcView.HD_x = i * chileVcView.HD_width;
//        chileVcView.backgroundColor = HD_random;
//        chileVcView.HD_y = 0;
//        chileVcView.HD_heigh = scrollView.HD_heigh;
//        [scrollView addSubview:chileVcView];
//        
//        
//    }
    
    //让UIScrollView滚动到对应位置
    CGPoint offset = self.scorllView.contentOffset;
    offset.x = btn.tag *self.view.HD_width;
    [self.scorllView setContentOffset:offset animated:YES];
   
 
 }


-(void)tagClick{
    HD_RecommentTagController *tag = [[HD_RecommentTagController alloc]init];
    [self.navigationController pushViewController:tag animated:YES];

}
#pragma mark - UIScrollViewDelegate
//监听滚动停止
//由外部控制 当使用  [self.scorllView setContentOffset:offset animated:YES]; 或者scrollRectVisible:animated:方法让scrollView产生动画，在动画结束就调用这个方法

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{

    NSLog(@"%s",__func__);
    [self addChildVcView];

}
//人为用手去触发的
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
    NSInteger index  = scrollView.contentOffset.x / scrollView.HD_width;
    HD_TitleBtn *btn =self.titleViews.subviews[index];
    [self btnClick:btn];
    [self addChildVcView];
    //添加自控制器的view
    

}
-(void)addChildVcView{
    NSInteger index = self.scorllView.contentOffset.x / self.scorllView.HD_width;
    UIViewController *childVC = self.childViewControllers[index];
    if ([childVC isViewLoaded])return;
    childVC.view.HD_y = 0;
    childVC.view.HD_x = index *self.scorllView.HD_width;
    childVC.view.HD_width = self.scorllView.HD_width;
    childVC.view.HD_heigh = self.scorllView.HD_heigh;
    [self.scorllView addSubview:childVC.view];
       
    
}
@end
