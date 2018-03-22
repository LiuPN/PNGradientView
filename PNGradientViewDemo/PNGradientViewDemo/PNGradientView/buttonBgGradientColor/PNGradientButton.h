//
//  PNGradientButton.h
//  PNGradientButton
//
//  Created by lpn on 2018/3/1.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNGradientButton : UIButton
/// 渐变色
@property (nonatomic, strong) NSArray *gradientColors;
/// 显示文本
@property(nonatomic, copy) NSString *contentText;


/// 是否是圆角矩形  默认值是no-是圆角矩形  yes-不是圆角矩形
@property(nonatomic, assign) BOOL noRoundedRectangle;
@end
