//
//  AppDelegate.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

//返回一张没有渲染的图片
+ (instancetype)imageWithOriginRenderingName:(NSString *)imageName;


/**
 *  图片剪裁成圆形图片
 *
 *  @param rect  剪裁形状大小
 *  @param image 图片
 *
 *  @return 返回一个剪裁过得图片
 */
+ (instancetype) imageWithRect:(CGRect)rect image:(UIImage *)image;

/**
 *  图片剪裁成圆形图片
 *
 *  @param borderWH 图片边框宽度
 *  @param color    边框颜色
 *  @param rect     剪裁形状大小
 *  @param image    图片
 *
 *  @return 返回一个剪裁过得图片
 */
+ (instancetype) imageWithCircleBorderWH:(CGFloat)borderWH borderColor:(UIColor *)color  image:(UIImage *)image;
@end
