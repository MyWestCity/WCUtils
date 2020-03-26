//
//  NSInvocation+Category.h
//
//  Created by WestCity on 2019/6/18.
//  NSInvocation类别
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSInvocation (Category)

/**
 *  创建一个invocation
 *  @parameter  target:响应对象, selector:响应的方法, params:传的参数
 *  @return     返回生成的对象
 */
+ (NSInvocation *)invocationWithTarget:(id)target selector:(SEL)selector params:(NSArray *)params;

@end

NS_ASSUME_NONNULL_END
