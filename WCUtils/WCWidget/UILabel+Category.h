//
//  UILabel+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UILabel类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

/**
 *  创建label（文字、颜色、字体）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(nullable NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font;

/**
 *  创建label（文字、颜色、字体、行数）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, numberOfLines:多行显示
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(nullable NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines;

/**
 *  创建label（文字、颜色、字体、对齐方式）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, textAlignment:对齐方式
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(nullable NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建label（文字、颜色、字体、对齐方式、行数）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, textAlignment:对齐方式, numberOfLines:多行显示
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(nullable NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;

/**
 *  设置段落间距和行间距
 *  @paramter   paragraphSpacing:段落间距, lineSpacing:行间距
 */
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing lineSpacing:(CGFloat)lineSpacing;

@end

NS_ASSUME_NONNULL_END
