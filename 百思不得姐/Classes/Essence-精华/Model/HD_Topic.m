//
//  HD_Topic.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_Topic.h"
#import <MJExtension/MJExtension.h>
#import "HD_Comment.h"
#import "HD_User.h"
#import "StringSize.h"
@implementation HD_Topic

+(NSDictionary *)mj_objectClassInArray
{
    
    
    
    
    return @{@"top_cmt" : [HD_Comment class]};
}
- (NSString *)created_at
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // NSString -> NSDate
    NSDate *createdAtDate = [fmt dateFromString:_created_at];

    // 比较【发帖时间】和【手机当前时间】的差值
    NSDateComponents *cmps = [createdAtDate intervalToNow];
    
    if (createdAtDate.isThisYear) {
        if (createdAtDate.isToday) { // 今天
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1分钟 =< 时间差距 <= 59分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else {
                return @"刚刚";
            }
        } else if (createdAtDate.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
        } else { // 今年的其他时间
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:createdAtDate];
        }
    } else { // 非今年
        return _created_at;
    }
}

-(CGFloat)cellHeight
{
   if (_cellHeight)  return _cellHeight ;
    

    
    //1.头像
    _cellHeight = 55;
    //2.文字
    CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 *HD_Margin;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);


    CGSize textSize = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight +=  textSize.height +  2 *HD_Margin;

    //中间的内容
    if (self.type != HDTopicTypeWord) {//如果不是文字 才需要计算高度
        
        //中间内容的高度
        
          CGFloat contentH =self.height / (self.width / textMaxW);
        if (contentH > [UIScreen mainScreen].bounds.size.height) {//将超长图片变为200
            contentH = 200;
            self.bigPicture = YES;
        }
                self.contentF = CGRectMake(HD_Margin, _cellHeight, textMaxW, contentH);
                _cellHeight += contentH + HD_Margin;
        
       }
    
    //最热评论

    if (self.top_cmt.count) { //如果有最热评论
        
        _cellHeight += 20 + HD_Margin;
        NSString *content = self.top_cmt[0].content;
        if (self.top_cmt[0].voiceuri.length) {
            content = @"语音评论";
        }
        NSString *topCmtContent = [NSString stringWithFormat:@"%@ : %@",self.top_cmt.firstObject.user.username,self.top_cmt.firstObject.content];
        CGSize topCmtContentSize = [topCmtContent boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
        _cellHeight += topCmtContentSize.height +  2 *HD_Margin ;
        
        
    }
    
   //5.底部工具条
    
    _cellHeight += 35 +  HD_Margin;
    
    
    
    return _cellHeight;
}

-(NSInteger)flag{
    return 0;
}
@end
