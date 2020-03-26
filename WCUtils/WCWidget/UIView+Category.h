//
//  UIView+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UIView类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)

/**
 *  移除此view上的所有子视图
 */
- (void)removeAllSubviews;

/**
 *  创建一条带颜色的线
 *  @parameter  color:线的颜色
 */
+ (UIView *)viewWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
