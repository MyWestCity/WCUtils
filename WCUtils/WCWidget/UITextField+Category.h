//
//  UITextField+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UITextField类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(nullable UIView *)leftView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, leftView:左边view, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(nullable UIView *)leftView  rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(nullable NSString *)backgroundImageNamed;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(nullable NSString *)backgroundImageNamed leftView:(nullable UIView *)leftView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(nullable NSString *)backgroundImageNamed rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView, 左边view, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(nullable NSString *)backgroundImageNamed leftView:(nullable UIView *)leftView rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView、leftViewMode、rightView、rightViewMode)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView, 左边view, leftViewMode:左边viewMode rightView:右边view, rightViewMode:右边viewMode
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(nullable UIView *)leftView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(nullable UIView *)leftView rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景色、边框颜色、边框宽度、圆角值、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundColor:背景色, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(nullable UIView *)leftView rightView:(nullable UIView *)rightView;

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景色、边框颜色、边框宽度、圆角值、leftView、leftViewMode、rightView、rightViewMode)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundColor:背景色, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, leftViewMode:左边viewMode, rightViewv:右边view, rightViewMode:右边viewMode
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(nullable NSString *)text textColor:(UIColor *)textColor placeHolder:(nullable NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(nullable UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(nullable UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode;


@end

NS_ASSUME_NONNULL_END
