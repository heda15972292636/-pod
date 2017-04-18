//
//  HD_MeFooterView.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/16.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_MeFooterView.h"
#import "AFNetworking.h"
#import "HD_MeSquare.h"
#import "MJExtension.h"
#import "UIButton+WebCache.h"
#import "HD_MeSquareButton.h"
#import "HD_WebViewController.h"
@interface HD_MeFooterView()
@property(nonatomic,strong)NSMutableDictionary <NSString *,HD_MeSquare *>*allSquares;

@end

@implementation HD_MeFooterView

-(NSMutableDictionary<NSString *,HD_MeSquare *> *)allSquares
{
    if (!_allSquares) {
        _allSquares = [NSMutableDictionary dictionary];
    }
    return _allSquares;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
       // manager.securityPolicy.validatesDomainName = YES;
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
    NSArray *squares   =     [HD_MeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self createSquares:squares];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }
    return self;
}
-(void)createSquares:(NSArray *)squares{
  
    NSInteger count = squares.count;
    int maxColsCount = 4;
    CGFloat buttonW =  self.HD_width / maxColsCount;
    CGFloat buttonH = buttonW;
    for (int i = 0; i < count; i++) {
        HD_MeSquare *square = squares[i];
        
     
        HD_MeSquareButton *button = [HD_MeSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        button.HD_x = (i % maxColsCount) *buttonW;
        button.HD_y = (i / maxColsCount) *buttonH;
        button.HD_width = buttonW;
        button.HD_heigh = buttonH;
        
        //设置数据
        [button setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        [button setTitle:square.name forState:UIControlStateNormal];
        self.allSquares[button.currentTitle] = square;
        [button sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
        
    }
    //设置footer的高度
    self.HD_heigh = self.subviews.lastObject.HD_bottom;
    UITableView *tableView = (UITableView *)self.superview;
  //  tableView.contentSize = CGSizeMake(0, self.HD_bottom);
    tableView.tableFooterView = self;
    [tableView reloadData];
}
-(void)buttonClick:(HD_MeSquareButton *)button{

    HD_MeSquare *square = self.allSquares[button.currentTitle];
    if ([square.url hasPrefix:@"http"]) {
        HD_WebViewController *webView = [[HD_WebViewController alloc]init];
        webView.title = [button currentTitle];
        webView.url = square.url;
        UITabBarController *tabbarVc = (UITabBarController *)self.window.rootViewController;
        UINavigationController *nav =  tabbarVc.selectedViewController;
        [nav pushViewController:webView animated:YES];
        
    }else  if([square.url hasPrefix:@"mod"]){
  
        if ([square.url hasSuffix:@"BDJ_TO_check"]) {
            NSLog(@"跳转到神贴界面");
        }else if ([square.url hasSuffix:@"BDJ_TO_RecentHot"]){
            NSLog(@"跳转到每日排行界面");
        }else{
            NSLog(@"跳转到其他界面");
        }
        
    }else{
        NSLog(@"不是http或者mod协议的");
    }
  
}
@end
