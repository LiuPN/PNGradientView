//
//  PNGradientLabel.m
//  PNGradientLabel
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  背景是渐变色的label

#import "PNGradientLabel.h"

@import CoreGraphics;

@interface PNGradientLabel ()
@property (nonatomic, copy) NSString *contentText;
@end

@implementation PNGradientLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:[self.gradientColors count]];
    [self.gradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIColor class]]) {
            [colors addObject:(__bridge id)[obj CGColor]];
        } else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
            [colors addObject:obj];
        } else {
            @throw [NSException exceptionWithName:@"PNGradientLabelError"
                                           reason:@"Object in gradientColors array is not a UIColor or CGColorRef"
                                         userInfo:NULL];
        }
    }];
    
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGGradientRef gradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)colors, NULL);
    
    
    // 开始 结束point  上到下
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint,kCGGradientDrawsAfterEndLocation | kCGGradientDrawsBeforeStartLocation);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    [super drawRect: rect];
    
    // 垂直方向上居中显示
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSTextAlignmentCenter]; // 水平方向上居中显示
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.font;
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSParagraphStyleAttributeName] = style;
    
    CGSize size = [self.contentText sizeWithAttributes:dictM];
    
    [self.contentText drawInRect:CGRectMake((rect.size.width - size.width) * 0.5, (rect.size.height - size.height) * 0.5, size.width, size.height) withAttributes:dictM];
    
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)setText:(NSString *)text{
    self.contentText = text;
    
    
}



@end
