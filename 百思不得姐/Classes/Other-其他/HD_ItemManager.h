//
//  HD_ItemManager.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/13.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HD_ItemManager : NSObject
+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
