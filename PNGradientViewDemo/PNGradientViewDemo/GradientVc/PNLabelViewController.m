//
//  PNLabelViewController.m
//  PNGradientViewDemo
//
//  Created by lpn on 2018/3/22.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PNLabelViewController.h"
#import "PNGradientLabel.h"

@interface PNLabelViewController ()

@end

@implementation PNLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"渐变标签背景";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 添加控件
    PNGradientLabel  *gradientLbl = [[PNGradientLabel alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    gradientLbl.gradientColors = @[[UIColor redColor], [UIColor yellowColor]];
    gradientLbl.text = @"标签背景色渐变";
    [self.view addSubview:gradientLbl];
    
}


@end
