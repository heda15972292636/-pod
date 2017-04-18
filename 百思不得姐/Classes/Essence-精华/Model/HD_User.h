//
//  HD_User.h
//  百思不得姐
//
//  Created by 何达达mac on 17/3/21.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HD_User : NSObject
/** 用户名 */
@property (nonatomic, copy) NSString *username;
/** 性别 */
@property (nonatomic, copy) NSString *sex;
/** 头像 */
@property (nonatomic, copy) NSString *profile_image;
@end
