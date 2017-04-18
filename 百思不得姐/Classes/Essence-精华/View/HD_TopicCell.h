//
//  HD_TopicCell.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/20.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HD_Topic.h"
#import "HD_TopicPictureView.h"
#import "HD_TopicVideoView.h"
#import "HD_TopicVoiceView.h"
//#import "CJVideoPlayer.h"

@interface HD_TopicCell : UITableViewCell
@property(nonatomic,strong)HD_Topic *topic;

/** 图片 */
@property (nonatomic, weak) HD_TopicPictureView *pictureView;
/** 视频 */
@property (nonatomic, weak) HD_TopicVideoView *videoView;
/** 声音 */
@property (nonatomic, weak) HD_TopicVoiceView *voiceView;

@property(nonatomic,copy)touchBlock block;

@property(nonatomic,assign)NSInteger row;
@end
