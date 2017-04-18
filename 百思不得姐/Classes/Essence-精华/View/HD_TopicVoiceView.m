//
//  HD_TopicVoiceView.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/24.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TopicVoiceView.h"
#import "UIImageView+WebCache.h"
#import <AVFoundation/AVFoundation.h>
@interface HD_TopicVoiceView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *voiceTimeLabel;

@property(nonatomic,strong)AVAudioPlayer *play;
@property(nonatomic,assign)int index;

@end

@implementation HD_TopicVoiceView
-(AVAudioPlayer *)play
{
    if (!_play) {
        _play = [[AVAudioPlayer alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.topic.voiceuri]] error:nil];
     
    }
    return _play;
}
-(void)awakeFromNib
{
  //  [self awakeFromNib];
    self.index = 0;
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self.imageView addGestureRecognizer:tap];
    
    
}
-(void)setTopic:(HD_Topic *)topic
{
    _topic = topic;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image2]];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    NSInteger minute = topic.voicetime / 60;
    NSInteger second = topic.voicetime % 60;
    self.voiceTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];
}

-(void)tapClick:(UITapGestureRecognizer *)tap{
   // [self.play stop];
    //self.play = [[AVAudioPlayer alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.topic.voiceuri]] error:nil];
    [self.play play];
  
}
@end
