//
//  SYLTabBar.h
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//  自定义TabBar

#import <UIKit/UIKit.h>

@class SYLTabBar;

@protocol SYLTabBarDelegate <NSObject>

@optional
- (void)tabBar:(SYLTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

@interface SYLTabBar : UIView

@property(nonatomic,strong)NSArray *iteams;
@property(nonatomic,weak)id <SYLTabBarDelegate> delegate;

@end