//
//  NSBundle+Category.h
//
//  Created by WestCity on 2019/6/18.
//  NSBundle类别
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Category)

/**
 *  设置APP语言
 *  @paramter   language:要设置的语言(eg:"en")
 */
+ (void)setLanguage:(NSString *)language;

/**
 *  获取系统当前语言
 *  @return     当前系统语言(eg:"en")
 */
+ (NSString *)currentLanguage;

/**
 *  获取APP名字
 *  @return     返回app名字
 */
+ (NSString *)appName;

/**
 *  获取APP版本号
 *  @return     返回app版本
 */
+ (NSString *)appVersion;

/**
 *  获取APP编译版本号
 *  @return     返回app构建版本
 */
+ (NSString *)appBuildVersion;

@end

NS_ASSUME_NONNULL_END
