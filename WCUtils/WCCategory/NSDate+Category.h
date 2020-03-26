//
//  NSDate+Category.h
//
//  Created by WestCity on 2019/6/18.
//  NSDate类别
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)

#pragma mark - 时间转换
/**
 *  获取当前时间字符串
 *  @parameter   format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     获取的日期字符串(yyyy-MM-dd HH:mm:sss)
 */
+ (NSString *)currentTimeStringWithFormat:(NSString *)format;

/**
 *  获取当前时间戳(s)
 *  @return     获取的时间戳(单位:s)
 */
+ (NSString *)currentTimeStamp;

/**
 *  时间戳(s) 转 日期(yyyy-MM-dd HH:mm:sss)
 *  @parameter   timeStamp:要转换的时间戳(单位:s), format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     转换之后的日期字符串(yyyy-MM-dd HH:mm:sss)
 */
+ (NSString *)convertTimeStampToTimeString:(NSString *)timeStamp format:(NSString *)format;

/**
 *  日期(yyyy-MM-dd HH:mm:sss) 转 时间戳(s)
 *  @parameter   timeString:要转换的时间戳(yyyy-MM-dd HH:mm:sss), format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     转换之后的时间戳字符串(单位:s)
 */
+ (NSString *)convertTimeStringToTimeStamp:(NSString *)timeString format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
