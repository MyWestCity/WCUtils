//
//  UIView+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UIView类别
//

#import "UIView+Category.h"

@implementation UIView (Category)

/**
 *  移除此view上的所有子视图
 */
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    return;
}

/**
 *  创建一条带颜色的线
 *  @parameter  color:线的颜色
 */
+ (UIView *)viewWithColor:(UIColor *)color {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    
    lineView.backgroundColor = color;
    
    return lineView;
}

@end
