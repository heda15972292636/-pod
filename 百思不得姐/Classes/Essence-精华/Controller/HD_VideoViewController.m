//
//  HD_VideoViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. Video rights reserved.
//

#import "HD_VideoViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "HD_Topic.h"
#import <MJExtension/MJExtension.h>
#import "UIImageView+WebCache.h"
#import <MJRefresh/MJRefresh.h>
#import "HD_RefreshHeader.h"
#import "HD_TopicCell.h"
#import "HD_CommentViewController.h"
@interface HD_VideoViewController ()
@property(nonatomic,strong)NSMutableArray <HD_Topic *> *topics;

@property(nonatomic,copy)NSString *maxtime;

@property(nonatomic,strong)AFHTTPSessionManager  *manager;
@end
static NSString *const HD_TopicCellID = @"topic";
@implementation HD_VideoViewController
-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(109, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(109, 0, 49, 0);
    self.tableView.backgroundColor = HD_CommonBgColor;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HD_TopicCell class])bundle:nil] forCellReuseIdentifier:HD_TopicCellID];
    // self.tableView.rowHeight = 250;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupRefresh{
    
    self.tableView.mj_header = [HD_RefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}
#pragma mark - Table view data source

-(void)loadNewTopics{
    
    
    //取消其他请求
    //    for (NSURLSessionTask *task in self.manager.tasks) {
    //        [task cancel];
    //    }
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    //  [self.manager invalidateSessionCancelingTasks:YES];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"41";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.topics = [HD_Topic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        self.maxtime = responseObject[@"info"][@"maxtime"];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)loadMoreTopics{
    
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"41";
    params[@"maxtime"] = self.maxtime;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.maxtime = responseObject[@"info"][@"maxtime"];
        NSArray *moreTopics = [HD_Topic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:moreTopics];
        
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HD_TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:HD_TopicCellID];
    
    cell.topic = self.topics[indexPath.row];
    NSLog(@"%@",cell.topic.videouri);
    // NSLog(@"%f %f",cell.topic.width,cell.topic.height);
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  NSLog(@"%f",self.topics[indexPath.row].cellHeight);
    
    return self.topics[indexPath.row].cellHeight;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   HD_CommentViewController *comment = [[HD_CommentViewController alloc]init];
    comment.topic = self.topics[indexPath.row];
    [self.navigationController pushViewController:comment animated:YES];
}
@end
