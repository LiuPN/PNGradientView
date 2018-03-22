//
//  ViewController.m
//  PNGradientViewDemo
//
//  Created by lpn on 2018/3/19.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "ViewController.h"
#import "PNProgressViewController.h"
#import "PNTextViewController.h"
#import "PNLabelViewController.h"
#import "PNButtonViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1 文字渐变
    
    
    // 2 视图背景渐变
    
    // 3 进度条视图渐变
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    switch (section) {
        case 0:
            // 进度条渐变
            [self progressColor];
            
            break;
        case 1:
            // 文字渐变
            [self textColor];
            break;
        case 2:
            // 标签背景色渐变
            [self labelBgColor];
            
            break;
        case 3:
            // 按钮渐变背景色
            [self buttonBgColor];
            break;
    }
}
/// 进度条
- (void)progressColor{
    PNProgressViewController *progressVC = [[PNProgressViewController alloc] init];
    [self.navigationController pushViewController:progressVC animated:YES];
}
/// 文字
- (void)textColor{
    
    PNTextViewController *textVC = [[PNTextViewController alloc] init];
    [self.navigationController pushViewController:textVC animated:YES];
}
/// 标签
- (void)labelBgColor{
    PNLabelViewController *labelVC = [[PNLabelViewController alloc] init];
    [self.navigationController pushViewController:labelVC animated:YES];
}
/// 按钮
- (void)buttonBgColor{
    PNButtonViewController *buttonVC = [[PNButtonViewController alloc] init];
    [self.navigationController pushViewController:buttonVC animated:YES];
}










@end
