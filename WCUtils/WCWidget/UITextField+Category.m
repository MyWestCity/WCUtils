//
//  UITextField+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UITextField类别
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font leftView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font leftView:leftView rightView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, leftView:左边view, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font leftView:(UIView *)leftView  rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:nil leftView:leftView rightView:rightView];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed leftView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed leftView:leftView rightView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed leftView:nil rightView:rightView];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView, 左边view, rightView:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundImageNamed:backgroundImageNamed leftView:leftView leftViewMode:UITextFieldViewModeAlways rightView:rightView rightViewMode:UITextFieldViewModeAlways];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景图、leftView、leftViewMode、rightView、rightViewMode)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundImageNamed:背景图片名, leftView, 左边view, leftViewMode:左边viewMode rightView:右边view, rightViewMode:右边viewMode
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundImageNamed:(NSString *)backgroundImageNamed leftView:(UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode {
    UITextField *textField = [[self alloc] init];
    textField.text = text;
    textField.textColor = textColor;
    textField.font = font;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (placeHolder != nil) {
        textField.placeholder = placeHolder;
    }
    
    if (placeHolderColor != nil) {
        [textField setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    
    if (backgroundImageNamed != nil) {
        [textField setBackground:[UIImage imageNamed:backgroundImageNamed]];
    }
    
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = leftViewMode;
    }
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = rightViewMode;
    }
    
    return textField;
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:nil rightView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、leftView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:leftView rightView:nil];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:nil rightView:rightView];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、边框颜色、边框宽度、圆角值、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundColor:[UIColor clearColor] borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:leftView leftViewMode:UITextFieldViewModeAlways rightView:rightView rightViewMode:UITextFieldViewModeAlways];
}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景色、边框颜色、边框宽度、圆角值、leftView、rightView)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundColor:背景色, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, rightViewv:右边view
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView rightView:(UIView *)rightView {
    return [self textFieldWithText:text textColor:textColor placeHolder:placeHolder placeHolderColor:placeHolderColor font:font backgroundColor:backgroundColor borderColor:borderColor borderWidth:borderWidth cornerRadius:cornerRadius leftView:leftView leftViewMode:UITextFieldViewModeAlways rightView:rightView rightViewMode:UITextFieldViewModeAlways];

}

/**
 *  创建UITextField(text、文字颜色、placeHolder、placeHolderColor、字体、背景色、边框颜色、边框宽度、圆角值、leftView、leftViewMode、rightView、rightViewMode)
 *  @paramter   text:文字, textColor:文字颜色, placeHolder:占位字符串, placeHolderColor:占位字符串颜色, font:字体, backgroundColor:背景色, borderColor:边框颜色, borderWidth:边框宽度, cornerRadius:圆角值, leftView:左边view, leftViewMode:左边viewMode, rightViewv:右边view, rightViewMode:右边viewMode
 *  @return     返回一个TextField
 */
+ (UITextField *)textFieldWithText:(NSString *)text textColor:(UIColor *)textColor placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth cornerRadius:(float)cornerRadius leftView:(UIView *)leftView leftViewMode:(UITextFieldViewMode)leftViewMode rightView:(UIView *)rightView rightViewMode:(UITextFieldViewMode)rightViewMode
{
    UITextField *textField = [[self alloc] init];
    textField.text = text;
    textField.textColor = textColor;
    textField.font = font;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (placeHolder != nil) {
        textField.placeholder = placeHolder;
    }
    
    if (placeHolderColor != nil) {
        [textField setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    
    textField.backgroundColor = backgroundColor;
    textField.layer.borderColor = borderColor.CGColor;
    textField.layer.borderWidth = borderWidth;
    textField.layer.cornerRadius = cornerRadius;
    
    if (leftView != nil) {
        textField.leftView = leftView;
        textField.leftViewMode = leftViewMode;
    }
    
    if (rightView != nil) {
        textField.rightView = rightView;
        textField.rightViewMode = rightViewMode;
    }
    
    return textField;
}


@end
