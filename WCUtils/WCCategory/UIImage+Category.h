//
//  UIImage+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UIImage类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

/**
 *  base64字符串转图片
 *  @parameter  base64String:要转换的base64字符串
 *  @return     转化后的图片（UIImage对象）
 */
+ (UIImage *)imageFromBase64String:(NSString *)base64String;

/**
 *  图片转base64字符串
 *  @parameter  image:要转换的image
 *  @return     转化后的base64字符串
 */
+ (NSString *)convertToBase64StringFromImage:(UIImage *)image;

/**
 *  把颜色转换为图片
 *  @parameter   color:要转换的颜色
 *  @return     转换成的image对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 返回一张可以随意拉伸不变形的图片 */
+ (UIImage *)resizableImage:(NSString *)imageName;

/**
 *  从一个控件中截取指定大小的图片
 *  @paramparameterter   view:选取的控件, size:选取的大小
 *  @return     截取的image对象
 */
+ (UIImage *)imageFromView:(UIView *)view size:(CGSize)size;

/**
 *  从图片中按指定的位置大小截取图片的一部分
 *  @parameter   image:选取的图片, size:选取的大小
 *  @return     截取的image对象
 */
+ (UIImage *)cutImageFromImage:(UIImage *)image inRect:(CGRect)rect;

/**
 *  生成二维码
 *  @parameter   string:二维码所表示的字符串, size:生成二维码的大小
 *  @return     生成的image对象
 */
+ (UIImage *)createQRCodeImageWithString:(NSString *)string size:(CGSize)size;

/**
 *  生成条形码
 *  @parameter   string:条形码所表示的字符串, size:生成条形码的大小
 *  @return     生成的image对象
 */
+ (UIImage *)createBarCodeImageWithString:(NSString *)string size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
