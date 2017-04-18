//
//  HD_RefreshHeader.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_RefreshHeader.h"

@interface HD_RefreshHeader()
@property(nonatomic,weak)UIImageView *logo;
@end

@implementation HD_RefreshHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//初始化
-(void)prepare
{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据...." forState:MJRefreshStateRefreshing];
    self.lastUpdatedTimeLabel.hidden = YES;
    self.stateLabel.hidden = YES;
//    UIImageView *logo = [[UIImageView alloc]init];
//   
//    logo.image = [UIImage imageNamed:@"Cgo8PFTUWHuAUQanAAB5TovP6hY089"];
//    [self addSubview:logo];
//    self.logo = logo;
  //  [self addSubview:[[UISwitch alloc]init]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.logo.HD_width = self.HD_width;
//    self.logo.HD_heigh = 100;
//    self.logo.HD_y = -50;
}
@end
