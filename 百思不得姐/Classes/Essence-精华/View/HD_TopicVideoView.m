//
//  HD_TopicVideoView.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/24.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TopicVideoView.h"
#import "UIImageView+WebCache.h"


@interface HD_TopicVideoView()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoTimeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *playImage;

@end

@implementation HD_TopicVideoView



-(void)awakeFromNib
{
  //  self.playBtn.hidden = NO;
    //[self awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
   
      UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideoPlayer:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tap];
    self.playImage.tag = self.topic.flag;
 
}

-(void)setTopic:(HD_Topic *)topic
{
    _topic = topic;
      [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image2]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    NSInteger minute = topic.videotime / 60;
    NSInteger second = topic.videotime % 60;
    self.videoTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}
- (IBAction)startClick:(id)sender {
//    if (self.block) {
  //      self.block((UITapGestureRecognizer*) sender);
    //}
   
    
}
-(void)showVideoPlayer:(UITapGestureRecognizer *)tap{
    
  //  NSLog(@"%s",__func__);
    
    self.playImage.hidden = YES;
    
    if (self.block) {
        self.block(self.imageView.frame,tap);
    }

    
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
