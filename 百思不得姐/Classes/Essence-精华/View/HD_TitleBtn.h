//
//  HD_TitleBtn.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HD_TitleBtn : UIButton

@property(nonatomic,copy) void (^block)(int,int) ;
-(instancetype)initWithBlock:(int(^)(int  ,int ))block;
@end
