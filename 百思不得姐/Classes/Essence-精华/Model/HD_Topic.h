//
//  HD_Topic.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger , HDTopicType){
  
    //图片
    HDTopicTypePicture = 10,
    //文字
    HDTopicTypeWord = 29,
    //声音
    HDTopicTypeVoice = 31,
    //视频
    HDTopicTypeVideo = 41
  
    
};


@class HD_Comment;
@interface HD_Topic : NSObject

@property(nonatomic,copy)NSString *ID;

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString *profile_image;

@property(nonatomic,copy)NSString *text;

@property(nonatomic,copy)NSString *created_at;

@property(nonatomic,assign)NSInteger ding;

@property(nonatomic,assign)NSInteger cai;

@property(nonatomic,assign)NSInteger repost;

@property(nonatomic,assign)NSInteger comment;

@property(nonatomic,strong)NSArray <HD_Comment *> *top_cmt;

@property(nonatomic,assign)NSInteger type;

@property(nonatomic,assign) CGFloat cellHeight;

@property(nonatomic,assign)CGFloat width;

@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)CGRect contentF;

//r** 小图 */
@property (nonatomic, copy) NSString *image0; // image0
/** 大图 */
@property (nonatomic, copy) NSString *image1; // image1
/** 中图 */
@property (nonatomic, copy) NSString *image2; // image2

/** 是否为动态图 */
@property (nonatomic, assign) BOOL is_gif;

/** 视频的时长 */
@property (nonatomic, assign) NSInteger videotime;
/** 音频的时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 播放数量 */
@property (nonatomic, assign) NSInteger playcount;


@property(nonatomic,assign,getter  = isBigPicture)BOOL bigPicture;

@property(nonatomic,copy)NSString *videouri;

@property(nonatomic,copy)NSString *voiceuri;

@property(nonatomic,assign)NSInteger flag;
@end
