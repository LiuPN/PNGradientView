//
//  PLRandomProgressView.m
//  进度条渐变
//
//  Created by lpn on 2018/2/27.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PLRandomProgressView.h"

@interface PLRandomProgressView()

@property(nonatomic, strong)  NSMutableArray *gradientColors; // 渐变颜色
@property(nonatomic, weak) UIView * shadow;

@end
@implementation PLRandomProgressView

/// init initWithFrame都会调用这个方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 外侧圆角设置
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = BQLeftColor.CGColor;
        self.layer.masksToBounds = YES;

     
        // 阴影视图
        UIView * shadow = [[UIView alloc] init];
//        [self insertSubview:shadow belowSubview:progressView];
        shadow.layer.shadowOffset = CGSizeMake(0, 0);
        shadow.layer.shadowColor = BQRightColor.CGColor;
        shadow.backgroundColor = BQRightColor;
        shadow.clipsToBounds = NO;
        shadow.layer.shadowOpacity = 0.8;
        shadow.layer.shadowRadius = 2;
        self.shadow = shadow;
     
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    // 所在的范围r
    self.backgroundColor = [UIColor whiteColor];
    CGRect r = CGRectMake(0, 0, rect.size.width * self.progress, rect.size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:[self.gradientColors count]];
    [self.gradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIColor class]]) {
            [colors addObject:(__bridge id)[obj CGColor]];
        } else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
            [colors addObject:obj];
        } else {
            @throw [NSException exceptionWithName:@"CRGradientLabelError"
                                           reason:@"Object in gradientColors array is not a UIColor or CGColorRef"
                                         userInfo:NULL];
        }
    }];
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -r.size.height);
    
    /// 圆角矩形
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:r cornerRadius:r.size.height*0.5];
    [[UIColor clearColor] setStroke];
    [path stroke];
    [path addClip];
    
    /// 画渐变
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)colors, NULL);
    // 开始 结束point  左到右
    CGPoint startPoint = CGPointMake(CGRectGetMinX(r), CGRectGetMidY(r));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(r), CGRectGetMidY(r));
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint,0);

    CGGradientRelease(gradient);
    CGContextRestoreGState(context);

    
    
}
- (void)setProgress:(CGFloat)progress{
    _progress = progress;  // 此时self.progressView的frame = CGZero
    
    if (_progress == 1.0 || _progress == 0.0) {
        // 不再绘画视图
        _progress = 0.0;
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.shadow.hidden = YES; // CWColor(229,229,229)
        self.backgroundColor = CWColor(229,229,229);
        [self setNeedsDisplay];
        
        
        return;
    }else{
        // 重新执行动画
        self.layer.borderColor = BQLeftColor.CGColor;
        [self setNeedsDisplay];
        
    }
    
    
    
}


/// 传递颜色
- (void)setColors:(NSArray<UIColor *> *)colors
{
    _colors = colors;
    [self.gradientColors removeAllObjects];
    for (UIColor *color in _colors) {
        [self.gradientColors addObject:(__bridge id)color.CGColor];
    }
}

#pragma mark - lazy
- (NSMutableArray *)gradientColors{
    if (!_gradientColors) {
        _gradientColors = [NSMutableArray array];
    }
    return _gradientColors;
}



@end
