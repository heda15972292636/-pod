//
//  HD_TabBar.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TabBar.h"
@interface HD_TabBar()
@property(nonatomic,weak)UIButton *publishButton;
@end

@implementation HD_TabBar
#pragma mark - 懒加载


-(UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
      //  publishButton.backgroundColor = HD_random;
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];

        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
//布局子控件
-(void)layoutSubviews
{
    [super layoutSubviews];
   //设置所有tabbarButton的frame
    CGFloat buttonW = self.HD_width / 5;
    CGFloat buttonH = self.HD_heigh;
    CGFloat buttonY = 0;
    //按钮索引
    int  buttonIndex = 0;
    for (UIView *subview in self.subviews) {
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        CGFloat buttonX = buttonIndex *buttonW;
        if (buttonIndex >= 2) { // y
            buttonX += buttonW;
        }
        subview.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //增加索引
        buttonIndex++;
        
    }
    
    //设置中间的发布按钮的frame
    
    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.publishButton.center = CGPointMake(self.HD_width * 0.5, self.HD_heigh * 0.5);
    
    
    
}


-(void)publishClick{
   
    NSLog(@"%s",__func__);
}
@end
