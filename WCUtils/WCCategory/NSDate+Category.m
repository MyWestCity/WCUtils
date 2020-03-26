//
//  NSDate+Category.m
//
//  Created by WestCity on 2019/6/18.
//  NSDate类别
//

#import "NSDate+Category.h"
#import "NSString+Category.h"

@implementation NSDate (Category)

#pragma mark - 时间转换
/**
 *  获取当前时间字符串
 *  @paramter   format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     获取的日期字符串(yyyy-MM-dd HH:mm:sss)
 */
+ (NSString *)currentTimeStringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    return [formatter stringFromDate:[NSDate date]];
}

/**
 *  获取当前时间戳(s)
 *  @return     获取的时间戳(单位:ms)
 */
+ (NSString *)currentTimeStamp {
    return [[NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]] decimalPoint:0];
}

/**
 *  时间戳(s) 转 日期(yyyy-MM-dd HH:mm:sss)
 *  @paramter   timeStamp:要转换的时间戳(单位:s), format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     转换之后的日期字符串(yyyy-MM-dd HH:mm:sss)
 */
+ (NSString *)convertTimeStampToTimeString:(NSString *)timeStamp format:(NSString *)format {
    if ([NSString isEmpty:timeStamp]) {
        return @"";
    }
    
    NSTimeInterval interval = [timeStamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

/**
 *  日期(yyyy-MM-dd HH:mm:sss) 转 时间戳(s)
 *  @paramter   timeString:要转换的时间戳(yyyy-MM-dd HH:mm:sss), format:转换格式(类似"yyyy-MM-dd HH:mm:sss")
 *  @return     转换之后的时间戳字符串(单位:s)
 */
+ (NSString *)convertTimeStringToTimeStamp:(NSString *)timeString format:(NSString *)format {
    if ([NSString isEmpty:timeString]) {
        return @"";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *date = [formatter dateFromString:timeString];
    
    return [[NSString stringWithFormat:@"%f", [date timeIntervalSince1970]] decimalPoint:0];
}

@end
