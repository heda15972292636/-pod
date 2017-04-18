//
//  HD_RefreshFooter.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/20.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_RefreshFooter.h"

@implementation HD_RefreshFooter
-(void)prepare
{
    [super prepare];
    self.automaticallyChangeAlpha = YES;
    self.stateLabel.textColor = [UIColor orangeColor];
  //  self.stateLabel.hidden = YES;
    self.triggerAutomaticallyRefreshPercent = -0.5;

}

@end
