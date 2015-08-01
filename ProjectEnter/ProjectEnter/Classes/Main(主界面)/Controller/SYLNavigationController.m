//
//  SYLNavigationController.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "SYLNavigationController.h"
#import "UIImage+Image.h"

@interface SYLNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>


@end

@implementation SYLNavigationController

#pragma mark -当他的类或子类第一次使用时，调用此方法
+ (void)initialize
{
    //获取当前导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置导航条图片
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
   
    // 设置导航条字体
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attri[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:attri];
    
    //导航条主题颜色
    bar.tintColor = [UIColor whiteColor];

#pragma mark -设置控制器左边返回按钮的图片 第一种方法

    // 1.获取UIBarButtonItem
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    
    // 2.设置返回按钮的样式，不需要文字,
    [barButtonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark -View加载完毕时，初始化控制器
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 改变系统滑动手势
    UIScreenEdgePanGestureRecognizer *gesture = (UIScreenEdgePanGestureRecognizer *)self.interactivePopGestureRecognizer;
    NSArray *targets  =  [gesture valueForKeyPath:@"_targets"];
    
    id gestureRecognizer = targets[0];
    
    id target = [gestureRecognizer valueForKeyPath:@"_target"];
    self.interactivePopGestureRecognizer.enabled = NO;
    
    // 借用系统的滑动手势的功能，当触发自己的滑动手势的时候，调用系统的滑动返回功能
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];

}

#pragma mark -设置控制器左边返回按钮的图片 第二种方法

/*
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    // viewController:栈顶控制器导航栏的内容由栈顶控制器设置
    
    // 设置导航条左边按钮，非跟控制器才需要
    if (self.childViewControllers.count != 1) {
        
        //遮盖系统返回按钮，就不会有侧滑功能
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginRenderingName:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}
*/

@end
