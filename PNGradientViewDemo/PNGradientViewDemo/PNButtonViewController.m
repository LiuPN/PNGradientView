//
//  PNButtonViewController.m
//  PNGradientViewDemo
//
//  Created by lpn on 2018/3/22.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PNButtonViewController.h"
#import "PNGradientButton.h"

@interface PNButtonViewController ()

@end

@implementation PNButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"按钮背景色渐变";
    self.view.backgroundColor = [UIColor whiteColor];
  
    // 添加按钮
    PNGradientButton *gradientBtn = [[PNGradientButton alloc] initWithFrame:CGRectMake(100, 100, 130, 44)];
    gradientBtn.gradientColors = @[[UIColor greenColor], [UIColor redColor]];
    gradientBtn.contentText = @"我是渐变按钮";
    gradientBtn.noRoundedRectangle = NO; // 默认是圆角矩形
    [self.view addSubview:gradientBtn];
    
}


@end
