//
//  PNGradientText.h
//  绘图
//  文字是渐变色的label

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, PNGradientDirection) {//渐变色的方向
    PNGradientDirectionLeftToRight = 0,          //左 --> 右
    PNGradientDirectionTopLeftToBottomRight = 1, //左上 --> 右下
    PNGradientDirectionBottomLeftToTopRight = 2,  //左下 --> 右上
    PNGradientDirectionTopToTopBottom = 3 //上 -> 下
};
@interface PNGradientText : UILabel

/// 属性
@property(nonatomic, strong) NSArray<UIColor *> *colors;
@property(nonatomic, assign) PNGradientDirection gradientDirection;

/// 实例方法1
- (instancetype)initWithColors:(NSArray<UIColor *> *)colors;
/// 实例方法2
- (instancetype)initWithColors:(NSArray<UIColor *> *)colors
            gradientDirection:(PNGradientDirection)gradientDirection;



@end
