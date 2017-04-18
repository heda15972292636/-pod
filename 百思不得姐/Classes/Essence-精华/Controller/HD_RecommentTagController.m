//
//  HD_RecommentTagController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/30.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_RecommentTagController.h"
#import <AFNetworking/AFNetworking.h>
#import "XMGTagCell.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <MJExtension/MJExtension.h>
#import "HD_RecommentTag.h"
@interface HD_RecommentTagController ()
/** 所有的标签数据（里面存放的都是XMGTag模型） */
@property (nonatomic, strong) NSArray *tags;

@property(nonatomic,strong)AFHTTPSessionManager *manager;
@end

@implementation HD_RecommentTagController
/** cell的循环利用标识 */
static NSString * const XMGTagCellId = @"tag";

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"推荐标签";
    
    [self setupTable];
    
    [self loadTags];

}
- (void)setupTable
{
    self.tableView.backgroundColor = HD_CommonBgColor;
    // 设置行高
    self.tableView.rowHeight = 70;
    
    // 去掉系统自带的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGTagCell class]) bundle:nil] forCellReuseIdentifier:XMGTagCellId];
}


- (void)loadTags
{
    // 弹框
  
         [SVProgressHUD showWithStatus:@"正在请求数据........"];
    
   
    
    
    //弱化self
    __weak typeof(self) weakSelf = self;
    // 加载标签数据
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    // 发送请求
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
            return;
        }
        
             weakSelf.tags = [HD_RecommentTag mj_objectArrayWithKeyValuesArray:responseObject];
       // NSLog(@"%@",weakSelf.tags);
        
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 刷新表格
            [weakSelf.tableView reloadData];
            // 关闭弹框
            [SVProgressHUD dismiss];
        });
        

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 如果是取消了任务，就不算请求失败，就直接返回
        if (error.code == NSURLErrorCancelled) return;
        
        if (error.code == NSURLErrorTimedOut) {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试！"];
        } else {
            // 关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        }
       
    }];
}


- (void)dealloc
{
    // 停止请求
    [self.manager invalidateSessionCancelingTasks:YES];

    
    [SVProgressHUD dismiss];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tags.count;
}

/**
 * 返回indexPath位置对应的cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGTagCell *cell = [tableView dequeueReusableCellWithIdentifier:XMGTagCellId];
    
    cell.tagModel = self.tags[indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
