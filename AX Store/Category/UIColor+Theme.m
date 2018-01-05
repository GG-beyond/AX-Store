//
//  UIColor+Theme.m
//  APPChangeSkin
//
//  Created by anxindeli on 2018/1/3.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "UIColor+Theme.h"

@implementation UIColor (Theme)
+ (UIColor *)hexColor:(NSString *)colorString {
    
    // incorrect input
    if ([colorString length] < 6) {
        return [UIColor whiteColor];
    }
    
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    if ([colorString length] == 6) {
        colorString = [colorString stringByAppendingString:@"64"];
    }
    unsigned int red, green, blue, alpha;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&blue];
    range.location = 6;
    [[NSScanner scannerWithString:[colorString substringWithRange:range]] scanHexInt:&alpha];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(alpha/100.0f)];
}

@end
