//
//  XMGTagCell.m
//  3期-百思不得姐
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGTagCell.h"
#import "HD_RecommentTag.h"
#import "UIImageView+WebCache.h"

@interface XMGTagCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageListView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;
@end

@implementation XMGTagCell

/**
 * 重写这个方法的目的：拦截cell的frame设置
 */
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    
    [super setFrame:frame];
}

- (void)setTagModel:(HD_RecommentTag *)tagModel
{
    _tagModel = tagModel;
    
    // 设置头像
   // [self.imageListView setHeader:tagModel.image_list];
    [self.imageListView sd_setImageWithURL:[NSURL URLWithString:tagModel.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        UIGraphicsBeginImageContext(image.size);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        CGContextAddEllipseInRect(ctx, rect);
        CGContextClip(ctx);
        [image drawInRect:rect];
        self.imageListView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }];
    self.themeNameLabel.text = tagModel.theme_name;
  //  UIGraphicsBeginImageContext()
    // 订阅数
    if (tagModel.sub_number >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅", tagModel.sub_number / 10000.0];
    } else {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅", tagModel.sub_number];
    }
}
-(void)awakeFromNib{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
 //   self.imageListView.layer.cornerRadius = self.imageListView.HD_width * 0.5;
 //   self.imageListView.layer.masksToBounds = YES;
}
@end
