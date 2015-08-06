//
//  AppDelegate.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

/**
 *  不渲染图片
 */
+ (instancetype)imageWithOriginRenderingName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+ (instancetype) imageWithRect:(CGRect)rect image:(UIImage *)image
{
    //开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    //把路径设置为裁剪区域
    [path addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    //从上下文获得图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


+ (instancetype) imageWithCircleBorderWH:(CGFloat)borderWH borderColor:(UIColor *)color image:(UIImage *)image
{
    
    
    CGFloat imageWH = image.size.width;
    
    //开启一个位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //描述边框区域
    CGFloat rectWH = imageWH + 2 * borderWH;
    CGRect rect = CGRectMake(0, 0, rectWH , rectWH);
    
    //描述边框路径
    UIBezierPath *bigPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    //边框颜色
    [color set];
    
    //把边框画出来
    [bigPath fill];
    
    // 裁剪区域
    CGRect clipRect = CGRectMake(borderWH, borderWH, imageWH, imageWH);
    
    //描述裁减路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    [clipPath addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    //从上下文获得图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
