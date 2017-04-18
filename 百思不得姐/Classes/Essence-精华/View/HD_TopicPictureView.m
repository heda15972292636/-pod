//
//  HD_TopicPictureView.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/24.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TopicPictureView.h"
#import "UIImageView+WebCache.h"
#import <AFNetworking/AFNetworking.h>
#import "DALabeledCircularProgressView.h"
#import "KSPhotoBrowser.h"
@interface HD_TopicPictureView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigBtn;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progress;

@end

@implementation HD_TopicPictureView
-(void)awakeFromNib
{
   //   [self awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.progress.roundedCorners = 5;
    self.progress.progressLabel.textColor = [UIColor whiteColor];
    self.imageView.userInteractionEnabled = YES;
 
    [self.imageView addGestureRecognizer:   [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)]];
    [super awakeFromNib];
}
-(void)tapClick{

    NSArray *urls = [NSArray arrayWithObject:self.topic.image2];
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < urls.count; i++) {
        NSString *url = [urls[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:self.imageView imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:0];
    [browser showFromViewController:[self getCurrentViewController]];

}

-(void)setTopic:(HD_Topic *)topic
{   _topic = topic;
   
    ///AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    //if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
      //  [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image0]];
    //}else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
      //  [self.imageView sd_setImageWithURL:[ NSURL URLWithString:topic.image2]];
    
    //}else{
     //   self.imageView.image = nil;
    
   // }
    XMGWeakSelf;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image2]placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
     
        weakSelf.progress.hidden = NO;
        weakSelf.progress.progress = 1.0 * receivedSize / expectedSize;
        weakSelf.progress.progressLabel.text = [NSString stringWithFormat:@"%.0f%%", weakSelf.progress.progress * 100];
     
      
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
      weakSelf.progress.hidden = YES;
        
    }];
    

   self.gifView.hidden = !topic.is_gif;
    if (topic.isBigPicture) {
        self.seeBigBtn.hidden = NO;
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
    }else{
        self.seeBigBtn.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
    
    self.seeBigBtn.hidden = !topic.isBigPicture;
  
}
- (IBAction)bigBtnClick:(id)sender {
    
    NSArray *urls = [NSArray arrayWithObject:self.topic.image2];
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < urls.count; i++) {
        NSString *url = [urls[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:self.imageView imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:0];

    [browser showFromViewController:[self getCurrentViewController]];
    
   
}



/**得到当前控制器*/
-(UIViewController *)getCurrentViewController
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
@end
