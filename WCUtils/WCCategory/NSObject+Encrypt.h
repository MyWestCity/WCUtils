//
//  NSObject+Encrypt.h
//  WCUtilsDemo
//
//  Created by xq on 2020/4/8.
//  Copyright © 2020 yzm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Encrypt)

/**
 *  AES加密Data类型数据
 *  @parameter  data:数据明文, key:密钥
 *  @return     加密后的data
 */
+ (NSData *)AES256EncryptWithData:(NSData *)data key:(NSString *)key;

/**
 *  AES解密Data类型数据
 *  @parameter  data:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)AES256DecryptWithData:(NSData *)data key:(NSString *)key;

/**
 *  AES加密NSString类型数据
 *  @parameter  string:数据明文, key:密钥
 *  @return     加密后的data
 */
+ (NSData *)AES256EncryptWithString:(NSString *)string key:(NSString *)key;

/**
 *  AES解密NSString类型数据
 *  @parameter  string:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)AES256DecryptWithString:(NSString *)string key:(NSString *)key;

/**
 *  DES加密Data类型数据
 *  @parameter  data:数据明文, key:密钥
 *  @return     加密后的data
 */
+ (NSData *)DESEncryptWithData:(NSData *)data key:(NSString *)key;

/**
 *  DES解密Data类型数据
 *  @parameter  data:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)DESDecryptWithData:(NSData *)data key:(NSString *)key;

/**
 *  MD5加密NSString数据
 *  @parameter  string:数据明文
 *  @return     加密后的string
 */
+ (NSString *)MD5EncryptWithString:(NSString *)string;
- (NSString *)md5;

/**
 *  Base64加密NSString
 *  @parameter  string:数据明文
 *  @return     加密后的字符串
 */
+ (NSString *)Base64EncryptWithString:(NSString *)string;

/**
 *  Base64解密NSString
 *  @parameter  string:数据密文
 *  @return     解密后的字符串
 */
+ (NSString *)Base64DecryptWithString:(NSString *)string;

/**
 *  Base64加密Data数据
 *  @parameter  data:数据明文
 *  @return     加密后的字符串
 */
+ (NSString *)Base64EncryptWithData:(NSData *)data;

/**
 *  Base64解密Data数据
 *  @parameter  data:数据密文
 *  @return     解密后的字符串
 */
+ (NSString *)Base64DecryptWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
