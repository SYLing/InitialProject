//
//  SYLTabBar.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "SYLTabBar.h"
#import "SYLTabBarButton.h"

@interface SYLTabBar()

@property(nonatomic,weak)SYLTabBarButton *selectBtn;

@end

@implementation SYLTabBar

#pragma mark -重写iteams的set方法
- (void)setIteams:(NSArray *)iteams
{
    _iteams = iteams;
    for (UITabBarItem *iteam in iteams) {

        // 每遍历一个iteam，添加一个UITabBar。
        SYLTabBarButton *btn = [SYLTabBarButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:iteam.image forState:UIControlStateNormal];
        [btn setImage:iteam.selectedImage forState:UIControlStateSelected];
        
        // 也可以把按钮图片设为背景
//        [btn setBackgroundImage:iteam.image forState:UIControlStateNormal];
//        [btn setBackgroundImage:iteam.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        // btn绑定tag
        btn.tag = self.subviews.count;
        
        // 默认选中第一个
        if (self.subviews.count == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
        
    }
}

#pragma mark -布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    CGFloat btnW = self.width / count;
    CGFloat btnH = self.height;
    CGFloat btnY = 0;
    CGFloat btnX = 0;
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        btnX = i *btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }

}

#pragma mark -按钮点击事件，出发代理方法
- (void)btnClick:(SYLTabBarButton *)btn
{
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [self.delegate tabBar:self didClickBtn:btn.tag];
    }
}
@end
