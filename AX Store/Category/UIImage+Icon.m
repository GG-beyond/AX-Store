//
//  UIImage+Icon.m
//  AX Store
//
//  Created by anxindeli on 2018/1/11.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "UIImage+Icon.h"

@implementation UIImage (Icon)
+ (UIImage *)getAppIcon:(NSData *)iconData {
    NSInteger lenth = iconData.length;
    NSInteger width = 87;
    NSInteger height = 87;
    uint32_t *pixels = (uint32_t *)malloc(width * height * sizeof(uint32_t));
    [iconData getBytes:pixels range:NSMakeRange(32, lenth - 32)];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(pixels, width, height, 8, (width + 1) * sizeof(uint32_t), colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef cgImage = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    UIImage *icon = [UIImage imageWithCGImage: cgImage];
    CGImageRelease(cgImage);
    return icon;
}
+ (UIImage *)createImageWithLineBgColor:(UIColor *)color bgColor:(UIColor *)bgColor size:(CGSize)size cornerRadius:(float)corner{
    
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width*scale , size.height*scale)];
    view.backgroundColor = bgColor;
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = 1*scale;
    [view.layer setCornerRadius:corner*scale];
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
