//
//  HD_BackItem.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_BackItem.h"

@implementation HD_BackItem

+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}
@end
