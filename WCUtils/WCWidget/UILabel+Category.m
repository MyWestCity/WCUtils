//
//  UILabel+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UILabel类别
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

/**
 *  创建label（文字、颜色、字体）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font {
    return [self labelWithText:text textColor:textColor font:font textAlignment:NSTextAlignmentLeft numberOfLines:1];
}

/**
 *  创建label（文字、颜色、字体、行数）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, numberOfLines:多行显示
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font numberOfLines:(NSInteger)numberOfLines {
    return [self labelWithText:text textColor:textColor font:font textAlignment:NSTextAlignmentLeft numberOfLines:numberOfLines];
}

/**
 *  创建label（文字、颜色、字体、对齐方式）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, textAlignment:对齐方式
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWithText:text textColor:textColor font:font textAlignment:textAlignment numberOfLines:1];
}

/**
 *  创建label（文字、颜色、字体、对齐方式、行数）
 *  @parameter  text:文字, textColor:文字颜色, font:文字字体, textAlignment:对齐方式, numberOfLines:多行显示
 *  @return     返回label对象
 */
+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    label.text = text;
    
    return label;
}

/**
 *  设置段落间距和行间距
 *  @paramter   paragraphSpacing:段落间距, lineSpacing:行间距
 */
- (void)setParagraphSpacing:(CGFloat)paragraphSpacing lineSpacing:(CGFloat)lineSpacing {
    NSString *text = self.text;
    if (text == nil || !text.length) {
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    ;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setParagraphSpacing:paragraphSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    
    self.attributedText = attributedString;
}

@end
