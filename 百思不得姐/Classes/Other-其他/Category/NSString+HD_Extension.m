//
//  NSString+HD_Extension.m
//  百思不得姐
//
//  Created by 何达达mac on 17/3/17.
//  Copyright © 2017年 hedada. All rights reserved.
//

#import "NSString+HD_Extension.h"

@implementation NSString (HD_Extension)
-(unsigned long long)fileSize
{
    unsigned long long size = 0;
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory])
    {
          NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
           for (NSString *subPath in enumerator) {
            //全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subPath];
            //文件大小
          size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
            //累加文件大小
            // size += [attrs[NSFileSize] unsignedIntegerValue];
          
        
    }
  
    }else{
        size = attrs.fileSize;
    }
    return size;
    
}
@end
