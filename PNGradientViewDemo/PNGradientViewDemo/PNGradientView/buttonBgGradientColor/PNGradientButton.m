//
//  PNGradientButton.m
//  PNGradientButton
//
//  Created by lpn on 2018/3/1.
//  Copyright © 2018年 LPN. All rights reserved.
//

#import "PNGradientButton.h"

@implementation PNGradientButton


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setNeedsDisplay];
    }
    return self;
}
- (NSArray *)gradientColors{
    if (!_gradientColors) {
      _gradientColors = self.enabled ? @[[UIColor redColor], [UIColor greenColor]] : @[[UIColor redColor], [UIColor yellowColor]];
    }
    return _gradientColors;
}


//** enable值改变也是会调用的**/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIGraphicsBeginImageContext(rect.size);
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
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)colors, NULL);
    // 开始 结束point  左到右
    CGPoint startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0 );
    CGGradientRelease(gradient);

    // 图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [img drawInRect:rect];
    
    
    // 当是代码加载的时候，需要设置text是写上去的
    // 垂直方向上居中显示
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter]; // 水平方向上居中显示
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:17.0];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSStrokeColorAttributeName] = [UIColor greenColor];
    dictM[NSParagraphStyleAttributeName] = style;
    
    CGSize size = [self.contentText sizeWithAttributes:dictM];
    
    [self.contentText drawInRect:CGRectMake(rect.origin.x, (rect.size.height - size.height) * 0.5, rect.size.width, size.height) withAttributes:dictM];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.textColor = [UIColor whiteColor]; // 文字是白色
    
    if (self.noRoundedRectangle) {
        // 不是圆角
        
    }else{ // 是圆角
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
    }
    
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    
    self.gradientColors = enabled ? @[[UIColor redColor], [UIColor greenColor]] : @[[UIColor redColor], [UIColor yellowColor]];
    
}

@end
