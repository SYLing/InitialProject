//
//  SYLFirstViewController.m
//  ProjectEnter
//
//  Created by 邵银岭 on 15/7/31.
//  Copyright (c) 2015年 邵银岭. All rights reserved.
//

#import "SYLFirstViewController.h"
#import "SYLSecondTableViewController.h"

@interface SYLFirstViewController ()

@end

@implementation SYLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.navigationController pushViewController:[[SYLSecondTableViewController alloc] init] animated:YES];
}

@end
