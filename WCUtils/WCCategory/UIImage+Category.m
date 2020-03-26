//
//  UIImage+Category.m
//
//  Created by WestCity on 2019/6/18.
//  UIImage类别
//

#import "UIImage+Category.h"
#import "NSString+Category.h"

@implementation UIImage (Category)

/**
 *  base64字符串转图片
 *  @parameter  base64String:要转换的base64字符串
 *  @return     转化后的图片（UIImage对象）
 */
+ (UIImage *)imageFromBase64String:(NSString *)base64String {
    if ([NSString isEmpty:base64String]) {
        return nil;
    }
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    
    return [UIImage imageWithData:data];
}

/**
 *  图片转base64字符串
 *  @return     转化后的base64字符串
 */
+ (NSString *)convertToBase64StringFromImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.3f);//NSDataBase64EncodingEndLineWithLineFeed这个枚举值是base64串不换行
    
    NSString *imageBase64Str = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    return imageBase64Str;
}

/**
 *  把颜色转换为图片
 *  @parameter   color:要转换的颜色
 *  @return     转换成的image对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/** 返回一张可以随意拉伸不变形的图片 */
+ (UIImage *)resizableImage:(NSString *)imageName {
    UIImage *normal = [UIImage imageNamed:imageName];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}

/**
 *  从一个控件中截取指定大小的图片
 *  @paramparameterter   view:选取的控件, size:选取的大小
 *  @return     截取的image对象
 */
+ (UIImage *)imageFromView:(UIView *)view size:(CGSize)size {
    //创建一个基于位图的图形上下文并指定大小
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    //renderInContext 呈现接受者及其子范围到指定的上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //返回一个基于当前图形上下文的图片
    UIImage *extractImage =UIGraphicsGetImageFromCurrentImageContext();
    
    //移除栈顶的基于当前位图的图形上下文
    UIGraphicsEndImageContext();
    
    //以png格式返回指定图片的数据
    NSData *imageData = UIImagePNGRepresentation(extractImage);
    UIImage *imge = [UIImage imageWithData:imageData];
    
    return imge;
}

/**
 *  从图片中按指定的位置大小截取图片的一部分
 *  @parameter   image:选取的图片, size:选取的大小
 *  @return     截取的image对象
 */
+ (UIImage *)cutImageFromImage:(UIImage *)image inRect:(CGRect)rect {
    // 把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    // 截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    
    return newImage;
}

/**
 *  生成二维码
 *  @parameter   string:二维码所表示的字符串, size:生成二维码的大小
 *  @return     生成的image对象
 */
+ (UIImage *)createQRCodeImageWithString:(NSString *)string size:(CGSize)size {
    if ([NSString isEmpty:string]) {
        return nil;
    }
    
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    CIImage *qrImage = qrFilter.outputImage;
    
    // 放大并绘制二维码 (上面生成的二维码很小，需要放大)
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    
    // 翻转一下图片 不然生成的QRCode就是上下颠倒的
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    
    return codeImage;
}

/**
 *  生成条形码
 *  @parameter   string:条形码所表示的字符串, size:生成条形码的大小
 *  @return     生成的image对象
 */
+ (UIImage *)createBarCodeImageWithString:(NSString *)string size:(CGSize)size {
    CIImage *ciImage = [self generateBarCodeImage:string];
    
    return [self resizeCodeImage:ciImage withSize:CGSizeMake(size.width, size.height)];
}

+ (CIImage *)generateBarCodeImage:(NSString *)string
{
    // iOS 8.0以上的系统才支持条形码的生成，iOS8.0以下使用第三方控件生成
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 注意生成条形码的编码方式
        NSData *data = [string dataUsingEncoding: NSASCIIStringEncoding];
        CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        [filter setValue:data forKey:@"inputMessage"];
        // 设置生成的条形码的上，下，左，右的margins的值
        [filter setValue:[NSNumber numberWithInteger:0] forKey:@"inputQuietSpace"];
        return filter.outputImage;
    }
    
    return nil;
}

+ (UIImage *)resizeCodeImage:(CIImage *)image withSize:(CGSize)size
{
    if (image) {
        CGRect extent = CGRectIntegral(image.extent);
        CGFloat scaleWidth = size.width/CGRectGetWidth(extent);
        CGFloat scaleHeight = size.height/CGRectGetHeight(extent);
        size_t width = CGRectGetWidth(extent) * scaleWidth;
        size_t height = CGRectGetHeight(extent) * scaleHeight;
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceGray();
        CGContextRef contentRef = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpaceRef, (CGBitmapInfo)kCGImageAlphaNone);
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:image fromRect:extent];
        CGContextSetInterpolationQuality(contentRef, kCGInterpolationNone);
        CGContextScaleCTM(contentRef, scaleWidth, scaleHeight);
        CGContextDrawImage(contentRef, extent, imageRef);
        CGImageRef imageRefResized = CGBitmapContextCreateImage(contentRef);
        CGContextRelease(contentRef);
        CGImageRelease(imageRef);
        return [UIImage imageWithCGImage:imageRefResized];
        
    } else {
        return nil;
    }
}


@end
