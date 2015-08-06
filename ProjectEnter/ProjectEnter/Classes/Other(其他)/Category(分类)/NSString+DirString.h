//
//  NSString+DirString.h
//  ProjectEnter
//
//  Created by 邵银岭 on 15/8/6.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DirString)
/**
 *  生成缓存目录全路径
 */
- (instancetype)cacheDir;
/**
 *  生成文档目录全路径
 */
- (instancetype)docDir;
/**
 *  生成临时目录全路径
 */
- (instancetype)tmpDir;

@end
