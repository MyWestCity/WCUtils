//
//  UIButton+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UIButton类别
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

/**
 *  创建按钮（点击事件）
 *  @paramter   target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTarget:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/**
 *  创建按钮(标题、默认颜色、字体、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:titleColor font:font target:target selector:selector];
}

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font backgroundImageName:nil target:target selector:selector];
}

/**
 *  创建按钮(标题、默认颜色、字体、背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, font:字体, backgroundImageName:背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:titleColor font:font backgroundImageName:backgroundImageName target:target selector:selector];
}

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundImageName:背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:highlightedTitleColor font:font backgroundImageName:backgroundImageName highlightedBackgroundImageName:backgroundImageName target:target selector:selector];
}

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景图片、高亮时背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundImageName:背景图片名, highlightedBackgroundImageName:高亮背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(NSString *)backgroundImageName highlightedBackgroundImageName:(NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector {
    UIButton *button = [self buttonWithTarget:target selector:selector];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedBackgroundImageName] forState:UIControlStateHighlighted];
    
    return button;
}

/**
 *  创建按钮(标题、默认颜色、字体、背景颜色、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, font:字体, backgroundColor:背景颜色, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor highlightedTitleColor:titleColor font:font backgroundColor:backgroundColor highlightedBackgroundColor:backgroundColor target:target selector:selector];
}

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景颜色、高亮时背景颜色、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundColor:背景颜色, highlightedBackgroundColor:高亮背景颜色 target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor target:(id)target selector:(SEL)selector {
    UIButton *button = [self buttonWithTarget:target selector:selector];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
    button.titleLabel.font = font;
    // [button setBackgroundImage:[UIImage imageWithColor:backgroundColor] forState:UIControlStateNormal];
    // [button setBackgroundImage:[UIImage imageWithColor:highlightedBackgroundColor] forState:UIControlStateHighlighted];
    
    return button;
}

/**
 *  创建按钮（图片、点击事件）
 *  @paramter   imageName:图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName target:(id)target selector:(SEL)selector {
    return [self buttonWithImageName:imageName highlightedImageName:imageName target:target selector:selector];
}

/**
 *  创建按钮（图片、高亮图片、点击事件）
 *  @paramter   imageName:图片名, highlightedImageName:高亮时图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName target:(id)target selector:(SEL)selector {
    UIButton *button = [self buttonWithTarget:target selector:selector];

    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];

    return button;
}

/**
 *  创建按钮（图片、选中时图片、点击事件）
 *  @paramter   imageName:图片名, selectedImageName:选中时图片, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target selector:(SEL)selector {
    UIButton *button = [self buttonWithTarget:target selector:selector];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    
    return button;
}

/**
 *  创建按钮（文字、文字颜色、字体、图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, titleColor:文字颜色, font:文字字体, imageName:图片名, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:imageName selectedImageName:imageName size:size direction:direction spacing:spacing target:target selector:selector];
}

/**
 *  创建按钮（文字、文字颜色、字体、图片、选中时图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, titleColor:文字颜色, font:文字字体, imageName:图片名, selectedImageName:选中时图片, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector {
    return [self buttonWithTitle:title selectedTitle:title titleColor:titleColor font:font imageName:imageName selectedImageName:selectedImageName size:size direction:direction spacing:spacing target:target selector:selector];
}

/**
 *  创建按钮（文字、选中时文字、文字颜色、字体、图片、选中时图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, selectedTitle:选中时文字, titleColor:文字颜色, font:文字字体, imageName:图片名, selectedImageName:选中时图片, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector {
    UIButton *button = [self buttonWithTarget:target selector:selector];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:selectedTitle forState:UIControlStateSelected];
    button.titleLabel.font = font;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    button.frame = CGRectMake(0, 0, size.width, size.height);
    switch (direction) {
        case TitleToImageDirectionUp:
            [button setTitleUpSpace:spacing];
            break;
        case TitleToImageDirectionLeft:
            [button setTitleLeftSpace:spacing];
            break;
        case TitleToImageDirectionDown:
            [button setTitleDownSpace:spacing];
            break;
        case TitleToImageDirectionRight:
            [button setTitleRightSpace:spacing];
            break;
            
        default:
            break;
    }
    
    return button;
}

/**
 *  设置边框和圆角
 *  @paramter   borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值
 */
- (void)setBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(float)cornerRadius {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = YES;
}

/**
 *  设置文字在左，图片在右
 *  @paramter   space:间距
 */
- (void)setTitleLeftSpace:(CGFloat)space {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, (imageSize.height + space / 2), 0.0);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake((titleSize.height + space / 2), 0.0, 0.0, -titleSize.width);
}

/**
 *  设置文字在右，图片在左
 *  @paramter   space:间距
 */
- (void)setTitleRightSpace:(CGFloat)space {
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, -space);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, -space, 0.0, 0.0);
}

/**
 *  设置文字在上，图片在下
 *  @paramter   space:间距
 */
- (void)setTitleUpSpace:(CGFloat)space {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, (imageSize.height + space / 2), 0.0);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake((titleSize.height + space / 2), 0.0, 0.0, -titleSize.width);
}

/**
 *  设置文字在下，图片在上
 *  @paramter   space:间距
 */
- (void)setTitleDownSpace:(CGFloat)space {
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + space / 2), 0.0);
    CGSize titleSize = self.titleLabel.frame.size;
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + space / 2), 0.0, 0.0, -titleSize.width);
}


@end
