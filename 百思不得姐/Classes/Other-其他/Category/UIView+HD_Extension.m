//
//  UIView+HD_Extension.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "UIView+HD_Extension.h"

@implementation UIView (HD_Extension)
+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(CGFloat)HD_width
{
    return self.frame.size.width;
}

-(CGFloat)HD_heigh{
    return self.frame.size.height;
}

-(void)setHD_width:(CGFloat)HD_width
{
    CGRect frame = self.frame;
    frame.size.width = HD_width;
    self.frame = frame;
}

-(void)setHD_heigh:(CGFloat)HD_heigh
{
    CGRect frame = self.frame;
    frame.size.height = HD_heigh;
    self.frame = frame;
}

-(CGFloat)HD_x
{
    return self.frame.origin.x;
}
-(void)setHD_x:(CGFloat)HD_x
{
    CGRect frame = self.frame;
    frame.origin.x = HD_x;
    self.frame = frame;
}

-(CGFloat)HD_y
{
    return self.frame.origin.y;
}

-(void)setHD_y:(CGFloat)HD_y
{
    CGRect frame = self.frame;
    frame.origin.y = HD_y;
    self.frame = frame;

}

-(CGFloat)HD_centerX{
    return self.center.x;
}

-(void)setHD_centerX:(CGFloat)HD_centerX
{
    CGPoint center = self.center;
    center.x = HD_centerX;
    self.center = center;
    
}

-(CGFloat)HD_centerY
{
    return self.center.y;
}

-(void)setHD_centerY:(CGFloat)HD_centerY
{
    CGPoint center = self.center;
    center.y = HD_centerY;
    self.center = center;
    
}

-(CGFloat)HD_right
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)HD_bottom
{
    return CGRectGetMaxY(self.frame);
}

-(void)setHD_right:(CGFloat)HD_right
{
    self.HD_x = HD_right - self.HD_width;
}
-(void)setHD_bottom:(CGFloat)HD_bottom
{
    self.HD_y = HD_bottom - self.HD_heigh;
}

-(CGSize)HD_size
{
    return self.frame.size;
}

-(void)setHD_size:(CGSize)HD_size
{
    CGRect frame = self.frame;
    frame.size = HD_size;
    self.frame = frame;
    
    
}
@end
