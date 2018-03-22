//
//  PNProgressViewController.m
//  PNGradientViewDemo
//
//  Created by lpn on 2018/3/22.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PNProgressViewController.h"
#import "PNRandomProgressView.h"


@interface PNProgressViewController ()

@end

@implementation PNProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进度条渐变";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加控件
    PNRandomProgressView *randomPv = [[PNRandomProgressView alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    randomPv.colors = @[[UIColor redColor], [UIColor greenColor]];
    randomPv.progress = 0.6;
    [self.view addSubview:randomPv];
}


@end
