//
//  UIImageView+Category.h
//
//  Created by WestCity on 2019/6/18.
//  UIImageView类别
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

/**
 *  创建UIImageView(frame、图片名)
 *  @parameter  frame:frame, imageName:图片名
 *  @return     返回UIImageView对象
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
