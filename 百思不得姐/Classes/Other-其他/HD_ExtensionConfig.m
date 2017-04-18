//
//  HD_ExtensionConfig.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/31.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "HD_ExtensionConfig.h"
#import <MJExtension/MJExtension.h>
#import "HD_Topic.h"
#import "HD_Comment.h"
@implementation HD_ExtensionConfig
+(void)load{
        [HD_Topic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID" : @"id"};
        }];
       [HD_Comment mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id"};
    }];
}
@end
