//
//  UIImageView+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UIImageView类别
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

/**
 *  创建UIImageView(frame、图片名)
 *  @parameter  frame:frame, imageName:图片名
 *  @return     返回UIImageView对象
 */
+ (UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(nullable NSString *)imageName {
    UIImageView *imageView = [[self alloc] initWithFrame:frame];
    
    [imageView setImage:[UIImage imageNamed:imageName]];
    
    return imageView;
}

@end
