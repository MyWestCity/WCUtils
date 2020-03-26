//
//  UIButton+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UIButton类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TitleToImageDirection) {
    TitleToImageDirectionUp = 0,    // 文字在图片上方
    TitleToImageDirectionLeft,      // 文字在图片左边
    TitleToImageDirectionDown,      // 文字在图片下方
    TitleToImageDirectionRight      // 文字在图片右边
};

@interface UIButton (Category)

/**
 *  创建按钮（点击事件）
 *  @paramter   target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTarget:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、字体、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、字体、背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, font:字体, backgroundImageName:背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundImageName:(nullable NSString *)backgroundImageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundImageName:背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(nullable NSString *)backgroundImageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景图片、高亮时背景图片、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundImageName:背景图片名, highlightedBackgroundImageName:高亮背景图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundImageName:(nullable NSString *)backgroundImageName highlightedBackgroundImageName:(nullable NSString *)highlightedBackgroundImageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、字体、背景颜色、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, font:字体, backgroundColor:背景颜色, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target selector:(SEL)selector;

/**
 *  创建按钮(标题、默认颜色、高亮颜色、字体、背景颜色、高亮时背景颜色、点击事件)
 *  @paramter   title:标题, titleColor:标题默认颜色, highlightedTitleColor:高亮颜色, font:字体, backgroundColor:背景颜色, highlightedBackgroundColor:高亮背景颜色 target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor highlightedTitleColor:(UIColor *)highlightedTitleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor highlightedBackgroundColor:(UIColor *)highlightedBackgroundColor target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（图片、点击事件）
 *  @paramter   imageName:图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(nullable NSString *)imageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（图片、高亮图片、点击事件）
 *  @paramter   imageName:图片名, highlightedImageName:高亮时图片名, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(nullable NSString *)imageName highlightedImageName:(nullable NSString *)highlightedImageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（图片、选中时图片、点击事件）
 *  @paramter   imageName:图片名, selectedImageName:选中时图片, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithImageName:(nullable NSString *)imageName selectedImageName:(nullable NSString *)selectedImageName target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（文字、文字颜色、字体、图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, titleColor:文字颜色, font:文字字体, imageName:图片名, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(nullable NSString *)imageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（文字、文字颜色、字体、图片、选中时图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, titleColor:文字颜色, font:文字字体, imageName:图片名, selectedImageName:选中时图片, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor font:(UIFont *)font imageName:(nullable NSString *)imageName selectedImageName:(nullable NSString *)selectedImageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector;

/**
 *  创建按钮（文字、选中时文字、文字颜色、字体、图片、选中时图片、按钮尺寸、文字图片方向、文字图片间距、点击事件）
 *  @paramter   title:文字, selectedTitle:选中时文字, titleColor:文字颜色, font:文字字体, imageName:图片名, selectedImageName:选中时图片, size:按钮尺寸, direction:方向, spacing:间距, target:触发对象, selector:响应事件
 *  @return     返回button对象
 */
+ (UIButton *)buttonWithTitle:(nullable NSString *)title selectedTitle:(nullable NSString *)selectedTitle titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(nullable NSString *)imageName selectedImageName:(nullable NSString *)selectedImageName size:(CGSize)size direction:(TitleToImageDirection)direction spacing:(CGFloat)spacing target:(id)target selector:(SEL)selector;


/**
 *  设置边框和圆角
 *  @paramter   borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值
 */
- (void)setBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(float)cornerRadius;

/**
 *  设置文字在左，图片在右
 *  @paramter   space:间距
 */
- (void)setTitleLeftSpace:(CGFloat)space;

/**
 *  设置文字在右，图片在左
 *  @paramter   space:间距
 */
- (void)setTitleRightSpace:(CGFloat)space;

/**
 *  设置文字在上，图片在下
 *  @paramter   space:间距
 */
- (void)setTitleUpSpace:(CGFloat)space;

/**
 *  设置文字在下，图片在上
 *  @paramter   space:间距
 */
- (void)setTitleDownSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
