//
//  NSData+Category.h
//
//  Created by WestCity on 2019/6/18.
//  NSData类别
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Category)

/**
 *  NSData转十六进制字符串
 *  @parameter  data:要转的data
 *  @return     转换后的十六进制字符串
 */
+ (NSString *)convertDataToHexStr:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
