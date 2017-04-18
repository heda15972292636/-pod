//
//  HD_CleanCachesCell.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_CleanCachesCell.h"
#import "SDImageCache.h"
#import <SVProgressHUD/SVProgressHUD.h>
#define HDDefauleCaches  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"Custom"]
@implementation HD_CleanCachesCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        self.textLabel.text = @"清除缓存(正在计算缓存大小.....)";
      
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
              [NSThread sleepForTimeInterval:2];
            unsigned long long size = HDDefauleCaches.fileSize;
           
            size += [SDImageCache sharedImageCache].getSize;
            NSString *sizeText  = nil;
            if (size >= 1000 * 1000 * 1000) {
                sizeText = [NSString stringWithFormat:@"%.2fGB",size / 1000.0 / 1000.0 / 1000.0];
            }else if (size > 1000 * 1000){
                sizeText = [NSString stringWithFormat:@"%.2fMB",size / 1000.0 / 1000.0];
            }else if (size > 1000){
                sizeText = [NSString stringWithFormat:@"%.2fKB",size / 1000.0];
             }else{
                sizeText = [NSString stringWithFormat:@"%zdB",size];
                
            }
            NSString *text = [NSString stringWithFormat:@"清除缓存(%@)",sizeText];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textLabel.text = text;
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cleanCaches)];
                [self addGestureRecognizer:tap];

                
            });
        });
        NSLog(@"%@",NSHomeDirectory());
     
    }
    return self;
}

-(void)cleanCaches{

    //弹出指示器
    [SVProgressHUD showWithStatus:@"正在清除缓存....."];
    //删除缓存文件
    
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSFileManager *mgr = [NSFileManager defaultManager];
            [mgr removeItemAtPath:HDDefauleCaches error:nil];
            [mgr createDirectoryAtPath:HDDefauleCaches withIntermediateDirectories:NO attributes:nil error:nil];
            
            [NSThread sleepForTimeInterval:2.0];
            //所以得缓存清除完毕
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                self.textLabel.text = @"清除缓存(0B)";
            });
        });
    }];

    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
