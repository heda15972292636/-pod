//
//  HD_QuickLoginBtn.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/14.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_QuickLoginBtn.h"

@implementation HD_QuickLoginBtn

-(void)awakeFromNib{
   
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [super awakeFromNib];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.HD_y = 0;
    self.imageView.HD_centerX = self.HD_width * 0.5;
    self.titleLabel.HD_x = 0;
    self.titleLabel.HD_y = self.imageView.HD_bottom;
    self.titleLabel.HD_heigh = self.HD_heigh - self.titleLabel.HD_y;
    self.titleLabel.HD_width = self.HD_width;
    
}

@end
