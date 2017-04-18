//
//  HD_TopicVideoView.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/24.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HD_Topic.h"

@interface HD_TopicVideoView : UIView

@property(nonatomic,strong)HD_Topic *topic;

@property(nonatomic,copy)touchBlock block;
@end
