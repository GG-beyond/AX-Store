//
//  NSString+Size.m
//  AX Store
//
//  Created by anxindeli on 2018/1/8.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
+ (NSString *)getSize:(NSString *)sizeStr{
    
    CGFloat temp = [sizeStr floatValue];
    temp = temp/(1024.0*1024.0);
    return [NSString stringWithFormat:@"%.2f",temp];
}

@end
