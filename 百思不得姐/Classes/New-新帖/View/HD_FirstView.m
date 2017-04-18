//
//  HD_FirstView.m
//  百思不得姐
//
//  Created by 何达达mac on 17/4/5.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_FirstView.h"

@interface HD_FirstView()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation HD_FirstView
+(instancetype)createFirstView
{
    return [[NSBundle mainBundle]loadNibNamed:@"HD_FirstView" owner:nil options:nil].firstObject;
}

-(void)awakeFromNib{
  self.textLabel.text = @"活动手册到设备但事实上坚实的火花塞圣诞节时间舌尖上的活动手册到设备但事实上坚实的火花塞圣诞节时间舌尖上的活动手册到设";
}


@end
