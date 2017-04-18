//
//  UITextField+HD_Extension.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/15.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "UITextField+HD_Extension.h"
static NSString *const HDPlaceholderColorkey = @"placeholderLabel.textColor";
@implementation UITextField (HD_Extension)
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
  
    [self setValue:placeholderColor forKey:HDPlaceholderColorkey];
}

-(UIColor *)placeholderColor{
    return [self valueForKeyPath:HDPlaceholderColorkey];
}
@end
