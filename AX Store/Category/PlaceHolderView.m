//
//  PlaceHolderView.m
//  TestMaskLayer
//
//  Created by anxindeli on 2017/7/10.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "PlaceHolderView.h"


@implementation PlaceHolderView

- (id)initWithFrame:(CGRect)frame withTitle:(NSString *)title{
    
    if (self = [super initWithFrame:frame]) {
        if (title.length<=0) {
            title = @"暂无数据";
        }
        [self creatSubViews:title];
    }
    return self;
    
}
- (void)creatSubViews:(NSString *)title{
    
    UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake( (SCREEN_WIDTH-110)/2, 100, 110, 90)];
    logoImage.backgroundColor = [UIColor clearColor];
    logoImage.image = [UIImage imageNamed:@"logo_empty.png"];
    [self addSubview:logoImage];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(logoImage.frame)+25, SCREEN_WIDTH, 15)];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor hexColor:@"#262a3b"];
    titleLabel.text = title;
    [self addSubview:titleLabel];
}
@end
