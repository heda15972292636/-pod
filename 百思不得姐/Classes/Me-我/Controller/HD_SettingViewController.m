//
//  HD_SettingViewController.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/16.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_SettingViewController.h"
#import "SDImageCache.h"
#import "HD_CleanCachesCell.h"
#import "HD_SettingCell.h"
static NSString *const HDCleanCellId = @"CleanCachesCell";
static NSString *const HDSettingCell = @"SettingCell";
@interface HD_SettingViewController ()

@end

@implementation HD_SettingViewController

-(instancetype)init{
    return [self initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor = HD_CommonBgColor;
    self.navigationItem.title = @"设置";
    NSLog(@"%zd",[SDImageCache sharedImageCache].getSize);
    NSLog(@"%zd",@"/Users/hedadamac/Desktop".fileSize);
    [self getCacheSize];
    [self getCachesSize2];
    NSLog(@"%@",NSHomeDirectory());
    
    [self.tableView registerClass:[HD_CleanCachesCell class] forCellReuseIdentifier:HDCleanCellId];
    [self.tableView registerClass:[HD_SettingCell class] forCellReuseIdentifier:HDSettingCell];
}
-(void)getCacheSize{
    unsigned long long size = 0;
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [ cachesPath stringByAppendingPathComponent:@"MP3/share"];
    //文件管理者
    NSFileManager *mag = [NSFileManager defaultManager];
   // NSDictionary *attrs  =    [mag attributesOfItemAtPath:filePath error:nil];
    //获得文件夹的总大小
    NSArray *subPaths = [mag subpathsAtPath:filePath];
    for (NSString *subPath in subPaths) {
        //全路径
        NSString *fullSubpath = [filePath stringByAppendingPathComponent:subPath];
        //文件大小
        NSDictionary *attrs = [mag attributesOfItemAtPath:fullSubpath error:nil];
        //累加文件大小
       // size += [attrs[NSFileSize] unsignedIntegerValue];
        
        size += attrs.fileSize;
    }
    NSLog(@"%zd",size);

}

-(void)getCachesSize2{
 
    unsigned long long size = 0;
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *filePath = [ cachesPath stringByAppendingPathComponent:@"MP3/share"];
    //文件管理者
    NSFileManager *mag = [NSFileManager defaultManager];
    // NSDictionary *attrs  =    [mag attributesOfItemAtPath:filePath error:nil];
    //获得文件夹的总大小
    //enumerator:便利器
    NSDirectoryEnumerator *enumerator = [mag enumeratorAtPath:filePath];
    for (NSString *subPath in enumerator) {
        //全路径
        NSString *fullSubpath = [filePath stringByAppendingPathComponent:subPath];
        //文件大小
        NSDictionary *attrs = [mag attributesOfItemAtPath:fullSubpath error:nil];
        //累加文件大小
        // size += [attrs[NSFileSize] unsignedIntegerValue];
        
        size += attrs.fileSize;
    }
    NSLog(@"%zd",size);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:HDCleanCellId];
    }else{
        HD_SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:HDSettingCell];
        cell.textLabel.text = @"检查更新";
        return cell;
    }
      
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
