//
//  HD_TopicCell.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/20.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TopicCell.h"
#import "UIImageView+WebCache.h"
#import "HD_Comment.h"
#import "HD_User.h"
#import "HD_TitleBtn.h"
#import "AppDelegate.h"
@interface HD_TopicCell()
{
    
 //   CJVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;


/** 最热评论-整体 */
@property (weak, nonatomic) IBOutlet UIView *topCmtView;
/** 最热评论-文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *topCmtLabel;
@end



@implementation HD_TopicCell

//- (CJVideoPlayer *)player {
  //  if (!_player) {
    //    _player = [[CJVideoPlayer alloc] init];
      //  _player.frame = CGRectMake(0, 64, self.imageView.frame.size.width, 250);
    //}
   // return _player;
//}
- (HD_TopicPictureView *)pictureView
{
    if (!_pictureView) {
        HD_TopicPictureView *pictureView = [HD_TopicPictureView viewFromXib];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (HD_TopicVideoView *)videoView
{
    if (!_videoView) {
        HD_TopicVideoView *videoView = [HD_TopicVideoView viewFromXib];

        [self.contentView addSubview:videoView];
        _videoView = videoView;
   
     
    }
    return _videoView;
}

- (HD_TopicVoiceView *)voiceView
{
    if (!_voiceView) {
        HD_TopicVoiceView *voiceView = [HD_TopicVoiceView viewFromXib];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
   self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTopic:(HD_Topic *)topic
{
    _topic = topic;
    self.topic.flag =self.row;
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.createdAtLabel.text = topic.created_at;
    self.text_label.text = topic.text;
    
     
    [self setupButton:self.dingButton number:topic.ding placeholder:@"顶"];
     [self setupButton:self.caiButton number:topic.cai placeholder:@"踩"];
     [self setupButton:self.repostButton number:topic.repost placeholder:@"分享"];
     [self setupButton:self.commentButton number:topic.comment placeholder:@"评论"];
    
    //最热评论
    if (topic.top_cmt.count) {
       
        self.topCmtView.hidden = NO;
        HD_Comment *comment = topic.top_cmt.firstObject;
      
        NSString *userName = comment.user.username;
        NSString *content = comment.content;
        
        self.topCmtLabel.text = [NSString stringWithFormat:@"%@ : %@",userName,content];
    }else{
        self.topCmtView.hidden = YES;
    
       
    }
    
    if (topic.type == HDTopicTypePicture) {
        
        self.pictureView.hidden = NO;
          self.pictureView.frame = topic.contentF;
        self.pictureView.topic = topic;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
      //  NSLog(@"%@",NSStringFromCGRect(topic.contentF));
  
        
    }else if (topic.type == HDTopicTypeWord){
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
    
    }else if (topic.type == HDTopicTypeVoice){
        self.voiceView.hidden = NO;
        self.voiceView.frame = topic.contentF;
        
        self.voiceView.topic = topic;
        
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
       
             //   NSLog(@"%@",NSStringFromCGRect(topic.contentF));
       
        
    }else if (topic.type == HDTopicTypeVideo){
     //   [self.contentView addSubview:]
                self.videoView.hidden = NO;
               self.videoView.frame = topic.contentF;
        
        _videoView.block = ^(CGRect rect,UITapGestureRecognizer *tap){
            
            
          
          //  _player = [[CJVideoPlayer alloc]init];
            //_player.videoUrl = self.topic.videouri;
            //_player.frame = tap.view.bounds;
          //  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.row inSection:1];
          //  [_player palyerBindTableView:self.table atIndexPath:indexPath];
            //[tap.view addSubview:_player];
            //_player.completedPlayingBlock = ^(CJVideoPlayer *player) {
              //  [player destroyPlayer];
               // _player = nil;
        //    };
        };
        
        self.videoView.topic = topic;

        self.pictureView.hidden = YES;
      
        self.voiceView.hidden = YES;


    
    }
 
}
-(void)layoutSubviews
{
    [super layoutSubviews];
 //   [_player destroyPlayer];
   // _player = nil;
    
}

-(void)setFrame:(CGRect)frame{
  
    frame.size.height -= HD_Margin;
    [super setFrame:frame];
  
}

-(void)setupButton:(UIButton *)button number:(NSInteger)number placeholder:(NSString *)placeholder{
    if (number >= 1000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number / 10000.0] forState:UIControlStateNormal];
    }else if (number > 0){
        [button setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    }else{
        [button setTitle:placeholder forState:UIControlStateNormal];
    }
    
}
- (IBAction)more:(id)sender {
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"我的标题" message:@"消息内容" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    [alert show];
//    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"我的标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"其他按钮", @"哈哈",@"呵呵",nil];
//    [sheet showInView:self];
   
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你确定要收藏吗" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
    
}
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"%ld",buttonIndex);
//}


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
