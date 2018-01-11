//
//  UIImage+Icon.h
//  AX Store
//
//  Created by anxindeli on 2018/1/11.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Icon)
+ (UIImage *)getAppIcon:(NSData *)iconData;
+ (UIImage *)createImageWithLineBgColor:(UIColor *)color bgColor:(UIColor *)bgColor size:(CGSize)size cornerRadius:(float)corner;
@end
