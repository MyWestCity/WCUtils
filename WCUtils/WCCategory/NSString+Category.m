//
//  NSString+Category.m
//
//  Created by WestCity on 2019/6/18.
//  NSString类别
//

#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark - 空判断
/**
 *  判断字符串是否为空
 *  @return     YES:为空，NO:不为空
 */
+ (BOOL)isEmpty:(NSString *)string {
    if (!string ||
        ![string isKindOfClass:[NSString class]] ||
        !string.length ||
        ![string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length) {
        return YES;
    }
    
    return NO;
}


#pragma mark - 数字类型字符串处理
/**
 *  判断字符串是否为纯数字（包括浮点型）
 *  @return     YES:纯数字，NO:不是纯数字
 */
- (BOOL)isPureNumber {
    if (self.length > 0) {
        if([self isPureInt] || [self isPureFloat]) {
            return YES;
        }
    }
    
    return NO;
}

/**
 *  判断字符串是否为整型数字
 *  @return     YES:纯整型数字，NO:不是纯整型数字
 */
- (BOOL)isPureInt {
    if (self.length > 0) {
        NSScanner* scan = [NSScanner scannerWithString:self];
        int val;
        return [scan scanInt:&val] && [scan isAtEnd];
    }
    
    return NO;
}

/**
 *  判断字符串是否为浮点型数字
 *  @return     YES:纯浮点型数字，NO:不是纯浮点型数字
 */
- (BOOL)isPureFloat {
    if (self.length > 0) {
        NSScanner* scan = [NSScanner scannerWithString:self];
        float val;
        return [scan scanFloat:&val] && [scan isAtEnd];
    }
    
    return NO;
}

/**
 *  是否是数字组成的字符串(不含小数点)
 *  @return     YES:纯数字字符串，NO:不是纯数字字符串
 */
- (BOOL)isNumberString {
    if (self.length > 0) {
        NSString *regex = @"[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        if ([pred evaluateWithObject:self]) {
            return YES;
        }
    }
    
    return NO;
}

/**
 *  字符串保留小数点
 *  @paramter   count:要保留的小数点位数
 *  @return     保留指定小数点位数之后的数字字符串
 */
- (NSString *)decimalPoint:(NSInteger)count {
    if (!self.length || (![self isPureInt] && ![self isPureFloat])) {
        return @"0";
    }
    
    NSString *str = [NSString stringWithFormat:@"%%.%ldf", (long)count];
    
    return [NSString stringWithFormat:str, [self doubleValue]];
}

/**
 *  字符串默认保留小数点（2位小数）
 *  @return     保留2位小数点位数之后的数字字符串
 */
- (NSString *)defaultDecimal {
    return [self decimalPoint:2];
}


#pragma mark - 密码判断（位数判断）
/**
 *  判断字符串是否为 *-* 位密码，要求必须有数字、字母
 *  @parameter  minNum:最小位数, maxNum:最大位数
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isValidPasswordWithMinNum:(NSInteger)minNum maxNum:(NSInteger)maxNum {
    if ((minNum < 0) || (maxNum < 0) || (minNum > maxNum)) {
        return NO;
    }
    
    // 判断长度大于6位后再接着判断是否同时包含数字和字母
    NSString *regex = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%ld,%ld}$", (long)minNum, (long)maxNum];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

/**
 *  判断字符串是否为 *-* 位密码，要求必须有数字、大小写字母
 *  @parameter  minNum:最小位数, maxNum:最大位数
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isValidPasswordLetterWithMinNum:(NSInteger)minNum maxNum:(NSInteger)maxNum {
    if ((minNum < 0) || (maxNum < 0) || (minNum > maxNum)) {
        return NO;
    }
    
    NSString *regex = [NSString stringWithFormat:@"(?![0-9A-Z]+$)(?![0-9a-z]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%ld,%ld}$", (long)minNum, (long)maxNum];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

/**
 *  是否是6位数字密码
 *  @return     YES:满足条件，NO:不满足条件
 */
- (BOOL)isNumberPassword {
    if (self.length == 6) {
        NSString *regex = @"[0-9]*";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        if ([pred evaluateWithObject:self]) {
            return YES;
        }
    }
    
    return NO;
}


#pragma mark - 判断字符串有消息
/**
 *  邮箱是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidEmail {
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
    
    return [postcodeTest evaluateWithObject:self];
}

/**
 *  身份证是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidIDCard {
    NSString *idCardStr;
    
    if (self.length == 15) {
        idCardStr = @"^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$";
        
    } else if (self.length == 18) {
        idCardStr = @"^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$";
    }
    
    NSPredicate *postcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"idCardStr"];
    
    return [postcodeTest evaluateWithObject:self];
}

/**
 *  银行卡号是否合法
 *  @return     YES:有效, NO:无效
 */
- (BOOL)isValidBankCard {
    if(self.length == 0){
        return NO;
    }
    
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < self.length; i++){
        c = [self characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
            
        } else {
            addend = digit;
        }
        
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    
    return modulus == 0;
}


#pragma mark - 获取指定类型的字符串
/**
 *  获取半加密的手机号码(即中间几位为*，默认小于3位全部显示；小于7位，前三位明文显示，后面*显示；大于7位，4～7位*显示，其余明文显示)
 *  @return     半加密的手机号码
 */
- (NSString *)encryptMobile {
    NSMutableString *encryptMobile = [NSMutableString string];
    
    if (self.length >= 3) {
        [encryptMobile appendString:[self substringToIndex:3]];
        if (self.length >= 7) {
            [encryptMobile appendString:@"****"];
            [encryptMobile appendString:[self substringFromIndex:7]];
        } else {
            for (int i = 3; i < self.length; i++) {
                [encryptMobile appendString:@"*"];
            }
        }
    } else {
        [encryptMobile appendString:self];
    }
    
    return encryptMobile;
}

/**
 *  提取字符串中的数字
 *  @return     提取出来的数字字符串
 */
- (NSString *)extractNumber {
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    
    return [[self componentsSeparatedByCharactersInSet:nonDigitCharacterSet] componentsJoinedByString:@""];
}

/**
 *  去掉前后空格
 *  @return     返回去掉前后空格的字符串
 */
- (NSString *)clearBlank {
    NSString *string = @"";
    if (self && self.length) {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        string = [self stringByTrimmingCharactersInSet:set];
    }
    
    return string;
}

/**
 *  生成指定长度随机字符串
 *  @paramter   length:要生成的字符串的长度
 *  @return     随机字符串
 */
+ (NSString *)randomStringOfLength:(NSInteger)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (NSInteger i = 0; i < length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex:arc4random() % ([letters length])]];
    }
    
    return [NSString stringWithFormat:@"%@", randomString];
}


#pragma mark - 获取富文本
/**
 *  获取富文本字体、颜色
 *  @parameter  strings:要设定富文本的文字数组, colors:要设定富文本的文字颜色数组, fonts:要设定富文本的文字字体数组 这三个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subColors:(NSArray<UIColor *> *)colors subFonts:(NSArray<UIFont *> *)fonts {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];

    if (self.length && strings) {
        [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [self rangeOfString:obj];

            if (range.location != NSNotFound) {
                if (colors && (idx < colors.count)) {
                    [attributedString addAttribute:NSForegroundColorAttributeName value:colors[idx] range:range];
                }
                if (fonts && (idx < fonts.count)) {
                    [attributedString addAttribute:NSFontAttributeName value:fonts[idx] range:range];
                }
            }
        }];
    }
    
    return attributedString;
}

/**
 *  获取富文本颜色
 *  @parameter  strings:要设定富文本的文字数组, colors:要设定富文本的文字颜色数组 这两个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subColors:(NSArray<UIColor *> *)colors {
    return [self attributedStringWithSubStrings:strings subColors:colors subFonts:nil];
}

/**
 *  获取富文本字体
 *  @parameter  strings:要设定富文本的文字数组, fonts:要设定富文本的文字字体数组 这两个数组长度必须相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings subFonts:(NSArray<UIFont *> *)fonts {
    return [self attributedStringWithSubStrings:strings subColors:nil subFonts:fonts];
}

/**
 *  获取富文本字体、颜色
 *  @parameter  string:要设定富文本的文字, color:要设定富文本的文字颜色, font:要设定富文本的文字字体
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subColor:(UIColor *)color subFont:(UIFont *)font {
    if (string && color && font) {
        return [self attributedStringWithSubStrings:@[string] subColors:@[color] subFonts:@[font]];
    }
    
    return [[NSAttributedString alloc] initWithString:self];
}

/**
 *  获取富文本颜色
 *  @parameter  string:要设定富文本的文字, color:要设定富文本的文字颜色
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subColor:(UIColor *)color {
    if (string && color) {
        return [self attributedStringWithSubStrings:@[string] subColors:@[color] subFonts:nil];
    }
    
    return [[NSAttributedString alloc] initWithString:self];
}

/**
 *  获取富文本字体
 *  @parameter  string:要设定富文本的文字, font:要设定富文本的文字字体
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string subFont:(UIFont *)font {
    if (string && font) {
        return [self attributedStringWithSubStrings:@[string] subColors:nil subFonts:@[font]];
    }
    
    return [[NSAttributedString alloc] initWithString:self];
}

/**
 *  获取富文本中间删除线
 *  @parameter  string:要设定富文本的文字, color:要设定的删除线颜色
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithDeleteLineWithSubString:(NSString *)string subColor:(UIColor *)color {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];

    if (string && color) {
        if (self.length) {
            NSRange range = [self rangeOfString:self];
            if (range.location != NSNotFound) {
                [attributedString addAttribute:NSStrikethroughColorAttributeName value:color range:range];
                [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
            }
        }
    }
    
    return attributedString;
}

/**
 *  获取富文本
 *  @parameter  strings:要设定富文本的文字数组, dictionarys:要设定的富文本属性数组 两个数组长度需相同
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings dictionarys:(NSArray<NSDictionary *> *)dictionarys {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    
    if (self.length && strings) {
        [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [self rangeOfString:obj];
            
            if (range.location != NSNotFound) {
                if (dictionarys && idx < dictionarys.count) {
                    NSDictionary *dictionary = dictionarys[idx];
                    
                    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key1, id  _Nonnull obj1, BOOL * _Nonnull stop1) {
                        [attributedString addAttribute:key1 value:obj1 range:range];
                    }];
                }
            }
        }];
    }
    
    return attributedString;
}

/**
 *  获取富文本
 *  @parameter  strings:要设定富文本的文字数组, dictionary:要设定的富文本属性
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubStrings:(NSArray<NSString *> *)strings dictionary:(NSDictionary *)dictionary {
    if (strings && dictionary) {
        NSMutableArray *dictionarys = [NSMutableArray array];
        
        for (int i = 0; i < strings.count; i++) {
            [dictionarys addObject:dictionary];
        }
        
        return [self attributedStringWithSubStrings:strings dictionarys:dictionarys];
    }
    
    return [[NSAttributedString alloc] initWithString:self];
}

/**
 *  获取富文本
 *  @parameter  string:要设定富文本的文字, dictionary:要设定的富文本属性
 *  @return     设置后的富文本字符串
 */
- (NSAttributedString *)attributedStringWithSubString:(NSString *)string dictionary:(NSDictionary *)dictionary {
    if (string && dictionary) {
        return [self attributedStringWithSubStrings:@[string] dictionarys:@[dictionary]];
    }
    
    return [[NSAttributedString alloc] initWithString:self];
}

#pragma mark - 进制转换
/**
 *  字符串转16进制
 *  @paramter   string:要转换的字符串
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertStringToHexString:(NSString *)string {
    if ([NSString isEmpty:string]) {
        return @"";
    }

    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableString *hexString = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [hexString appendString:hexStr];
                
            } else {
                [hexString appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return hexString;
}

- (NSString *)hexString {
    return [NSString convertStringToHexString:self];
}

/**
 *  16进制转字符串
 *  @paramter   hexString:要转换的16进制字符串
 *  @return     转换之后的字符串
 */
+ (NSString *)convertHexStrToString:(NSString *)hexString {
    if ([NSString isEmpty:hexString]) {
        return @"";
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([hexString length] % 2 == 0) {
        range = NSMakeRange(0, 2);
        
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [hexString length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [hexString substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    NSString *string = [[NSString alloc]initWithData:hexData encoding:NSUTF8StringEncoding];
    
    return string;
}

- (NSString *)hexStrToString {
    return [NSString convertHexStrToString:self];
}

/**
 *  16进制字符串转NSData
 *  @paramter   hexString:要转换的16进制字符串
 *  @return     转换之后的NSData数据
 */
+ (NSData *)convertHexStrToData:(NSString *)hexString {
    if ([NSString isEmpty:hexString]) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([hexString length] % 2 == 0) {
        range = NSMakeRange(0, 2);
        
    } else {
        range = NSMakeRange(0, 1);
    }
    
    for (NSInteger i = range.location; i < [hexString length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [hexString substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}

- (NSData *)hexStrToData {
    return [NSString convertHexStrToData:self];
}

/**
 *  NSData转16进制字符串
 *  @parameter   data:要转换的data
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDataToHexString:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    
    NSMutableString *hexString = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [hexString appendString:hexStr];
                
            } else {
                [hexString appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return hexString;
}

/**
 *  十进制转十六进制,并制定转换的位数,不足补0
 *  @paramter   decimalStr:要转换的十进制字符串, digit:转换的位数
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDecimalToHexString:(NSInteger)decimal digit:(NSInteger)digit {
    NSString *hexString = @"";
    
    if (decimal == 0) {
        hexString = @"0";
        
    } else {
        while (decimal) {
            NSInteger last = decimal % 16;
            
            switch (last) {
                case 10:
                    hexString = [NSString stringWithFormat:@"A%@", hexString];
                    break;
                case 11:
                    hexString = [NSString stringWithFormat:@"B%@", hexString];
                    break;
                case 12:
                    hexString = [NSString stringWithFormat:@"C%@", hexString];
                    break;
                case 13:
                    hexString = [NSString stringWithFormat:@"D%@", hexString];
                    break;
                case 14:
                    hexString = [NSString stringWithFormat:@"E%@", hexString];
                    break;
                case 15:
                    hexString = [NSString stringWithFormat:@"F%@", hexString];
                    break;
                default:
                    hexString = [NSString stringWithFormat:@"%ld%@", (long)last, hexString];
                    break;
            }
            
            
            decimal = decimal / 16;
        }
    }
    
    while (hexString.length < digit) {
        hexString = [NSString stringWithFormat:@"0%@", hexString];
    }
    
    return hexString;
}

/**
 *  十进制转十六进制,默认两位,不足补0
 *  @paramter   decimalString:要转换的十进制字符串
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertDecimalToHexString:(NSInteger)decimal {
    return [NSString convertDecimalToHexString:decimal digit:2];
}

/**
 *  十六进制转十进制
 *  @paramter   hexString:要转换的16进制字符串
 *  @return     转换之后的十进制字符串
 */
+ (NSString *)convertHexToDecimalString:(NSString *)hexString {
    if ([NSString isEmpty:hexString]) {
        return @"0";
    }
    
    return [NSString stringWithFormat:@"%lu", strtoul([hexString UTF8String], 0, 16)];
}

- (NSString *)hexStrToDecimalString {
    return [NSString convertHexToDecimalString:self];
}

/**
 *  二进制转十六进制
 *  @paramter   binaryString:要转换的二进制字符串
 *  @return     转换之后的16进制字符串
 */
+ (NSString *)convertBinaryToHexString:(NSString *)binaryString {
    NSMutableDictionary *binaryDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    [binaryDic setObject:@"0" forKey:@"0000"];
    [binaryDic setObject:@"1" forKey:@"0001"];
    [binaryDic setObject:@"2" forKey:@"0010"];
    [binaryDic setObject:@"3" forKey:@"0011"];
    [binaryDic setObject:@"4" forKey:@"0100"];
    [binaryDic setObject:@"5" forKey:@"0101"];
    [binaryDic setObject:@"6" forKey:@"0110"];
    [binaryDic setObject:@"7" forKey:@"0111"];
    [binaryDic setObject:@"8" forKey:@"1000"];
    [binaryDic setObject:@"9" forKey:@"1001"];
    [binaryDic setObject:@"A" forKey:@"1010"];
    [binaryDic setObject:@"B" forKey:@"1011"];
    [binaryDic setObject:@"C" forKey:@"1100"];
    [binaryDic setObject:@"D" forKey:@"1101"];
    [binaryDic setObject:@"E" forKey:@"1110"];
    [binaryDic setObject:@"F" forKey:@"1111"];
    
    if (binaryString.length % 4 != 0) {
        NSMutableString *mStr = [[NSMutableString alloc]init];
        
        for (int i = 0; i < 4 - binaryString.length % 4; i++) {
            [mStr appendString:@"0"];
        }
        
        binaryString = [mStr stringByAppendingString:binaryString];
    }
    
    NSString *hexString = @"";
    
    for (int i = 0; i < binaryString.length; i += 4) {
        NSString *key = [binaryString substringWithRange:NSMakeRange(i, 4)];
        
        NSString *value = [binaryDic objectForKey:key];
        if (value) {
            hexString = [hexString stringByAppendingString:value];
        }
    }
    
    return hexString;
}

- (NSString *)binaryStrToHexString {
    return [NSString convertBinaryToHexString:self];
}

/**
 *  十六进制转二进制
 *  @paramter   hexString:要转换的16进制字符串
 *  @return     转换之后的二进制字符串
 */
+ (NSString *)convertHexToBinaryString:(NSString *)hexString {
    NSMutableDictionary *hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    [hexDic setObject:@"0000" forKey:@"0"];
    [hexDic setObject:@"0001" forKey:@"1"];
    [hexDic setObject:@"0010" forKey:@"2"];
    [hexDic setObject:@"0011" forKey:@"3"];
    [hexDic setObject:@"0100" forKey:@"4"];
    [hexDic setObject:@"0101" forKey:@"5"];
    [hexDic setObject:@"0110" forKey:@"6"];
    [hexDic setObject:@"0111" forKey:@"7"];
    [hexDic setObject:@"1000" forKey:@"8"];
    [hexDic setObject:@"1001" forKey:@"9"];
    [hexDic setObject:@"1010" forKey:@"A"];
    [hexDic setObject:@"1011" forKey:@"B"];
    [hexDic setObject:@"1100" forKey:@"C"];
    [hexDic setObject:@"1101" forKey:@"D"];
    [hexDic setObject:@"1110" forKey:@"E"];
    [hexDic setObject:@"1111" forKey:@"F"];
    
    NSString *binaryString = @"";
    
    for (int i = 0; i < [hexString length]; i++) {
        NSString *key = [hexString substringWithRange:NSMakeRange(i, 1)];
        
        NSString *value = [hexDic objectForKey:key.uppercaseString];
        
        if (value) {
            binaryString = [binaryString stringByAppendingString:value];
        }
    }
    
    return binaryString;
}

- (NSString *)hexStrToBinaryString {
    return [NSString convertHexToBinaryString:self];
}

#pragma mark - label自适应高度
/**
 *  获取自适应高度
 *  @parameter  font:字体, width:最大宽度
 *  @return     当前文字显示在label上的高度
 */
- (CGFloat)heightForFont:(UIFont *)font maxWidth:(CGFloat)width {
    CGFloat height = 0;
    
    if (self.length) {
        NSDictionary *attributes = @{ NSFontAttributeName : font };
        height = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height;
    }
    
    return height;
}

/**
 *  获取自适应宽度
 *  @parameter  font:字体, height:最大高度
 *  @return     当前文字显示在label上的宽度
 */
- (CGFloat)widthForFont:(UIFont *)font maxHeight:(CGFloat)height {
    CGFloat width = 0;
    
    if (self.length) {
        NSDictionary *attributes = @{ NSFontAttributeName : font };
        width = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    }
    
    return width;
}

@end
