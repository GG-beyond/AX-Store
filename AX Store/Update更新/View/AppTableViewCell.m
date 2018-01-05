//
//  AppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "AppTableViewCell.h"
@interface AppTableViewCell ()

@property (nonatomic, strong) UIImageView *appImageView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UILabel *appDesLabel;
@property (nonatomic, strong) UIButton *appUpdateButton;

@end

@implementation AppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (UIImageView *)appImageView{
    
    if (!_appImageView) {
        
        _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _appImageView.layer.cornerRadius = 5;
    }
    return _appImageView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
