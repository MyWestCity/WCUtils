//
//  NSObject+Encrypt.m
//  WCUtilsDemo
//
//  Created by xq on 2020/4/8.
//  Copyright © 2020 yzm. All rights reserved.
//

#import "NSObject+Encrypt.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Category.h"
#import "GTMBase64.h"

@implementation NSObject (Encrypt)

/**
 *  AES加密Data类型数据
 *  @parameter  data:数据明文, key:密钥
 *  @return     加密后的Ddata
 */
+ (NSData *)AES256EncryptWithData:(NSData *)data key:(NSString *)key {
    if (!data || [data length] == 0) {
        return nil;
    }
    
    char keyPtr[kCCKeySizeAES256+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    
    return nil;
}

/**
 *  AES解密Data类型数据
 *  @parameter  data:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)AES256DecryptWithData:(NSData *)data key:(NSString *)key {
    if (!data || [data length] == 0) {
        return nil;
    }
    
    char keyPtr[kCCKeySizeAES256+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    
    return nil;
}

/**
 *  AES加密NSString类型数据
 *  @parameter  string:数据明文, key:密钥
 *  @return     加密后的Ddata
 */
+ (NSData *)AES256EncryptWithString:(NSString *)string key:(NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    
    return nil;
}

/**
 *  AES解密NSString类型数据
 *  @parameter  string:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)AES256DecryptWithString:(NSString *)string key:(NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];

    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    
    return nil;
}

/**
 *  DES加密Data类型数据
 *  @parameter  data:数据明文, key:密钥
 *  @return     加密后的data
 */
+ (NSData *)DESEncryptWithData:(NSData *)data key:(NSString *)key {
    if (!data || [data length] == 0) {
        return nil;
    }
    
    NSStringEncoding EnC = NSUTF8StringEncoding;
    
    NSMutableData * dKey = [[key dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([data length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCEncrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            [data bytes], // const void *dataIn
            [data length],  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    
    return sResult;
}

/**
 *  DES解密Data类型数据
 *  @parameter  data:数据密文, key:密钥
 *  @return     解密后的data
 */
+ (NSData *)DESDecryptWithData:(NSData *)data key:(NSString *)key {
    if (!data || [data length] == 0) {
        return nil;
    }
    
    NSStringEncoding EnC = NSUTF8StringEncoding;
    const void *dataIn;
    size_t dataInLength;
    
    dataInLength = [data length];
    dataIn = [data bytes];
    
    NSMutableData * dKey = [[key dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    //uint8_t iv[kCCBlockSizeDES];
    //memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([data length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCDecrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            dataIn, // const void *dataIn
            dataInLength,  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    
    return sResult;
}

/**
 *  MD5加密NSString数据
 *  @parameter  string:数据明文
 *  @return     加密后的string
 */
+ (NSString *)MD5EncryptWithString:(NSString *)string {
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)md5 {
    if (![NSString isEmpty:(NSString *)self]) {
        return [NSObject MD5EncryptWithString:(NSString *)self];
    }
    
    return nil;
}

/**
 *  Base64加密NSString
 *  @parameter  string:数据明文
 *  @return     加密后的字符串
 */
+ (NSString *)Base64EncryptWithString:(NSString *)string {
    if ([NSString isEmpty:string]) {
        return nil;
    }
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

/**
 *  Base64解密NSString
 *  @parameter  string:数据密文
 *  @return     解密后的字符串
 */
+ (NSString *)Base64DecryptWithString:(NSString *)string {
    if ([NSString isEmpty:string]) {
        return nil;
    }
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

/**
 *  Base64加密Data数据
 *  @parameter  data:数据明文
 *  @return     加密后的字符串
 */
+ (NSString *)Base64EncryptWithData:(NSData *)data {
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

/**
 *  Base64解密Data数据
 *  @parameter  data:数据密文
 *  @return     解密后的字符串
 */
+ (NSString *)Base64DecryptWithData:(NSData *)data {
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

@end
