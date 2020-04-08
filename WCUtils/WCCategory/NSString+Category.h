//
//  NSString+Category.h
//
//  Created by WestCity on 2019/6/18.
//  NSString类别
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)

#pragma mark - 空判断
/**
 *  判断字符串是否为空
 *  @return     YES:为空，NO:不为空
 */
+ (BOOL)isEmpty:(nullable NSString *)string;


#pragma mark - 数字类型字符串处理
/**
 *  判断字符串是否为纯数字（包括浮点型）
 *  @return     YES:纯数字，NO:不是纯数字
 */
- (BOOL)isPureNumber;

/**
 *  判断字符串是否为整型数字
 *  @return     YES:纯整型数字，NO:不是纯整型数字
 */
- (BOOL)isPureInt;

/**
 *  判断字符串是否为浮点型数字
 *  @return     YES:纯浮点型数字，NO:不是纯浮点型数字
 */
- (BOOL)isPureFloat;

/**
 *  是否是数字组成的字符串(不含小数点)
 *  @return     YES:纯数字字符串，NO:不是纯数字字符串
 */
- (BOOL)isNumberString;

/**
 *  字符串保留小数点
 *  @parameter   count:要保留的小数点位数
 *  @return     保留指定小数点位数之后的数字字符串
 */
- (NSString *)decimalPoint:(NSInteger)count;

/**
 *  字符串默认保留小数点（2位小数）
 *  @return     保留2位小数点位数之后的数字字符串
 */
- (NSString *)defaultDecimal;


#pragma mark - 密码判断（位数判断）
/**
 *  判断字符串是否为 *-* 位密码，要求必须有数字、字母
 *  @parameter  minNum:最小位数, maxNum:最大位数
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isValidPasswordWithMinNum:(NSInteger)minNum maxNum:(NSInteger)maxNum;

/**
 *  判断字符串是否为 *-* 位密码，要求必须有数字、大小写字母
 *  @parameter  minNum:最小位数, maxNum:最大位数
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isValidPasswordLetterWithMinNum:(NSInteger)minNum maxNum:(NSInteger)maxNum;

/**
 *  是否是6位数字密码
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isNumberPassword;

#pragma mark - 判断字符串有消息
/**
 *  邮箱是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidEmail;

/**
 *  身份证是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidIDCard;

/**
 *  银行卡号是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidBankCard;

#pragma mark - 获取指定类型的字符串
/**
 *  获取半加密的手机号码(即中间几位为*，默认小于3位全部显示；小于7位，前三位明文显示，后面*显示；大于7位，4～7位*显示，其余明文显示)
 *  @return     半加密的手机号码
 */
- (NSString *)encryptMobile;

/**
 *  提取字符串中的数字
 *  @return     提取出来的数字字符串
 */
- (NSString *)extractNumber;

/**
 *  去掉前后空格
 *  @return     返回去掉前后空格的字符串
 */
- (NSString *)clearBlank;

/**
 *  生成指定长度随机字符串
 *  @parameter   length:要生成的字符串的长度
 *  @return     随机字符串
 */
+ (NSString *)randomStringOfLength:(NSInteger)length;


#pragma mark - 获取富文本
/**
 *  获取富文本字体、颜色
 *  @parameter  strings:要设定富文本的文字数组, colors:要设定富文本的文字颜色数组, fonts:要设定富文本的文字字体数组 这三个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subColors:(nullable NSArray<UIColor *> *)colors subFonts:(nullable NSArray<UIFont *> *)fonts;

/**
 *  获取富文本颜色
 *  @parameter  strings:要设定富文本的文字数组, colors:要设定富文本的文字颜色数组 这两个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subColors:(NSArray<UIColor *> *)colors;

/**
 *  获取富文本字体
 *  @parameter  strings:要设定富文本的文字数组, fonts:要设定富文本的文字字体数组 这两个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subFonts:(NSArray<UIFont *> *)fonts;

/**
 *  获取富文本字体、颜色
 *  @parameter  string:要设定富文本的文字, color:要设定富文本的文字颜色, font:要设定富文本的文字字体
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subColor:(UIColor *)color subFont:(UIFont *)font;

/**
 *  获取富文本颜色
 *  @parameter  string:要设定富文本的文字, color:要设定富文本的文字颜色
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subColor:(UIColor *)color;

/**
 *  获取富文本字体
 *  @parameter  string:要设定富文本的文字, font:要设定富文本的文字字体
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subFont:(UIFont *)font;

/**
 *  获取富文本中间删除线
 *  @parameter  string:要设定富文本的文字, color:要设定的删除线颜色
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithDeleteLineWithSubString:(NSString *)string subColor:(UIColor *)color;

/**
 *  获取富文本
 *  @parameter  strings:要设定富文本的文字数组, dictionarys:要设定的富文本属性数组 两个数组长度需相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings dictionarys:(NSArray<NSDictionary *> *)dictionarys;

/**
 *  获取富文本
 *  @parameter  strings:要设定富文本的文字数组, dictionary:要设定的富文本属性
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings dictionary:(NSDictionary *)dictionary;

/**
 *  获取富文本
 *  @parameter  string:要设定富文本的文字, dictionary:要设定的富文本属性
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string dictionary:(NSDictionary *)dictionary;

#pragma mark - 进制转换


/**
 *  字符串转16进制
 *  @parameter   string:要转换的字符串
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertStringToHexString:(NSString *)string;
- (NSString *)hexString;

/**
 *  16进制转字符串
 *  @parameter   hexString:要转换的16进制字符串
 *  @return     转换之后的字符串
 */
+ (NSString *)convertHexStrToString:(NSString *)hexString;
- (NSString *)hexStrToString;

/**
 *  16进制字符串转NSData
 *  @parameter   hexString:要转换的16进制字符串
 *  @return     转换之后的NSData数据
 */
+ (NSData *)convertHexStrToData:(NSString *)hexString;
- (NSData *)hexStrToData;

/**
 *  NSData转16进制字符串
 *  @parameter   data:要转换的data
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDataToHexString:(NSData *)data;

/**
 *  十进制转十六进制,并制定转换的位数,不足补0
 *  @parameter   decimalStr:要转换的十进制, digit:转换的位数
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDecimalToHexString:(NSInteger)decimal digit:(NSInteger)digit;

/**
 *  十进制转十六进制,默认两位,不足补0
 *  @parameter   decimal:要转换的十进制
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDecimalToHexString:(NSInteger)decimal;

/**
 *  十六进制转十进制
 *  @parameter   hexString:要转换的16进制字符串
 *  @return     转换之后的十进制字符串
 */
+ (NSString *)convertHexToDecimalString:(NSString *)hexString;
- (NSString *)hexStrToDecimalString;

/**
 *  二进制转十六进制
 *  @parameter   binaryString:要转换的二进制字符串
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertBinaryToHexString:(NSString *)binaryString;
- (NSString *)binaryStrToHexString;

/**
 *  十六进制转二进制
 *  @parameter   hexString:要转换的16进制字符串
 *  @return     转换之后的二进制字符串
 */
+ (NSString *)convertHexToBinaryString:(NSString *)hexString;
- (NSString *)hexStrToBinaryString;

#pragma mark - label自适应高度
/**
 *  获取自适应高度
 *  @parameter  font:字体, width:最大宽度
 *  @return     当前文字显示在label上的高度
 */
- (CGFloat)heightForFont:(UIFont *)font maxWidth:(CGFloat)width;

/**
 *  获取自适应宽度
 *  @parameter  font:字体, height:最大高度
 *  @return     当前文字显示在label上的宽度
 */
- (CGFloat)widthForFont:(UIFont *)font maxHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
