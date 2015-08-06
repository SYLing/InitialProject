//
//  NSString+DirString.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/8/6.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "NSString+DirString.h"

@implementation NSString (DirString)

- (instancetype)cacheDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}
- (instancetype)docDir
{
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)tmpDir
{
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
