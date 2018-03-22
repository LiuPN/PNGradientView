//
//  PNRandomProgressView.h
//  进度条渐变
//
//  Created by lpn on 2018/2/27.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PNRandomProgressView : UIView
// 实例函数
@property(nonatomic, strong)NSArray <UIColor *> *colors;

/// 进度范围0.0-1.0
@property(nonatomic, assign) CGFloat progress;
@end
