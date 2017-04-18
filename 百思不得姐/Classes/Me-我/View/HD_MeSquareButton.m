//
//  HD_MeSquareButton.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/16.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_MeSquareButton.h"

@implementation HD_MeSquareButton


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.HD_y = self.HD_heigh * 0.2;
    self.imageView.HD_heigh = self.HD_heigh * 0.5;
    self.imageView.HD_width = self.imageView.HD_heigh;
    self.imageView.HD_centerX = self.HD_width * 0.5;
    
    
    self.titleLabel.HD_x = 0;
    self.titleLabel.HD_y = self.imageView.HD_bottom;
    self.titleLabel.HD_width = self.HD_width;
    self.titleLabel.HD_heigh = self.HD_heigh - self.titleLabel.HD_y;
}

@end
