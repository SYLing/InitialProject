//
//  SYLTabBarController.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "SYLTabBarController.h"
#import "SYLTabBar.h"
#import "SYLNavigationController.h"
#import "SYLFirstViewController.h"
#import "SYLSecondTableViewController.h"
#import "SYLThirdTableViewController.h"
#import "SYLFourthViewController.h"

@interface SYLTabBarController ()<SYLTabBarDelegate>
@property(nonatomic,strong)NSMutableArray *iteams;
@end

@implementation SYLTabBarController

#pragma mark -懒加载TabBar的TabBarIteams
- (NSMutableArray *)iteams
{
    if (!_iteams) {
        _iteams = [NSMutableArray array];
    }
    return _iteams;
}

#pragma mark -View即将显示时候删除系统tabBar上的tabBarButton
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //删除系统tabBar上的tabBarButton
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有子控制器
    [self addAllSubViewController];
    
    // 添加自定义tabBar到控制器上
    [self addTabBar];
}

#pragma mark -设置自定义的TabBar
- (void)addTabBar
{
    SYLTabBar *tabBar = [[SYLTabBar alloc] init];
    tabBar.frame = self.tabBar.bounds;
    tabBar.delegate = self;
    tabBar.iteams = self.iteams;
    tabBar.backgroundColor = [UIColor blackColor];

    // 把自定义的TabBar加到系统的TabBar上
    [self.tabBar addSubview:tabBar];
}

#pragma mark -创建、设置所有子控制器
- (void)addAllSubViewController
{
    SYLFirstViewController *firstController = [[SYLFirstViewController alloc] init];
    [self addSubViewController:firstController tabBarImage:[UIImage imageNamed:@"tabbar_home"] tabBarSelectImage:[UIImage imageNamed:@"tabbar_home_selected"] title:@"第一个"];
    
    SYLSecondTableViewController *secondController = [[SYLSecondTableViewController alloc] init];
    [self addSubViewController:secondController tabBarImage:[UIImage imageNamed:@"tabbar_message_center"] tabBarSelectImage:[UIImage imageNamed:@"tabbar_message_center_selected"] title:@"第二个"];
    
    SYLThirdTableViewController *thirdController = [[SYLThirdTableViewController alloc] init];
    [self addSubViewController:thirdController tabBarImage:[UIImage imageNamed:@"tabbar_discover"] tabBarSelectImage:[UIImage imageNamed:@"tabbar_discover_selected"] title:@"第三个"];
     
    SYLFourthViewController *fourthController = [[SYLFourthViewController alloc] init];
     [self addSubViewController:fourthController tabBarImage:[UIImage imageNamed:@"tabbar_profile"] tabBarSelectImage:[UIImage imageNamed:@"tabbar_profile_selected"] title:@"第四个"];
    
}

#pragma mark -添加所有子控制器
- (void)addSubViewController:(UIViewController *)viewController tabBarImage:(UIImage *)image tabBarSelectImage:(UIImage *)selectImage title:(NSString *)title
{
    //tabBar按钮上的图片
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //导航标题
    viewController.navigationItem.title = title;
    SYLNavigationController *navigationVC = [[SYLNavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:navigationVC];
    
    //保存子控制器的UITabBarItem
    [self.iteams addObject:viewController.tabBarItem];

}

#pragma mark -<SYLTabBarDelegate>
- (void)tabBar:(SYLTabBar *)tabBar didClickBtn:(NSInteger)index
{
    // 代理方法中实现按钮点击，切换控制器页面
    self.selectedIndex = index;
}
@end
