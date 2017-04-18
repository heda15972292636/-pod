//
//  HD_TitleBtn.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_TitleBtn.h"

@implementation HD_TitleBtn
-(instancetype)initWithBlock:(int (^)(int , int))block
{
    block(20,10);
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setHighlighted:(BOOL)highlighted
{

}
@end
