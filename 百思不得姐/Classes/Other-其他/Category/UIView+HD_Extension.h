//
//  UIView+HD_Extension.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HD_Extension)
@property(nonatomic,assign)CGFloat HD_width;

@property(nonatomic,assign)CGFloat HD_heigh;

@property(nonatomic,assign)CGFloat HD_x;

@property(nonatomic,assign)CGFloat HD_y;

@property(nonatomic,assign)CGFloat  HD_centerX;

@property(nonatomic,assign)CGFloat HD_centerY;

@property(nonatomic,assign)CGFloat HD_right;

@property(nonatomic,assign)CGFloat HD_bottom;

@property(nonatomic,assign)CGSize HD_size;

+ (instancetype)viewFromXib;
@end
