//
//  PNTextViewController.m
//  PNGradientViewDemo
//
//  Created by lpn on 2018/3/22.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PNTextViewController.h"
#import "PNGradientText.h"

@interface PNTextViewController ()

@end

@implementation PNTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"渐变文字";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // 添加文字
    PNGradientText *gradientTxt = [[PNGradientText alloc] initWithColors:@[[UIColor redColor], [UIColor yellowColor]]];
    
    gradientTxt.frame = CGRectMake(100, 100, 155, 60);
    gradientTxt.font = [UIFont boldSystemFontOfSize:25];
    gradientTxt.text = @"我是渐变文字";
    gradientTxt.gradientDirection = PNGradientDirectionLeftToRight; // 默认渐变方向
    
    [self.view addSubview:gradientTxt];
}


@end
