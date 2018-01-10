//
//  BaseAppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "BaseAppTableViewCell.h"
@interface BaseAppTableViewCell ()
@end
@implementation BaseAppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.appImageView];
        [self addSubview:self.appNameLabel];
        [self addSubview:self.appDesLabel];
        [self addSubview:self.appDateLabel];
        [self addSubview:self.appUpdateButton];
        [self addSubview:self.bottomLine];
    }
    return self;
}
- (void)setContentCellWithAppInfo:(id)model{
    
}
#pragma mark - SETTER方法
- (UIImageView *)appImageView{
    
    if (!_appImageView) {
        
        _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _appImageView.layer.cornerRadius = 15;
        _appImageView.layer.masksToBounds = YES;
    }
    return _appImageView;
}
- (UILabel *)appNameLabel{
    
    if (!_appNameLabel) {
        
        _appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 13, SCREEN_WIDTH - 80 - 60, 15)];
        _appNameLabel.textColor = [UIColor hexColor:@"#262a3b"];
        _appNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _appNameLabel;
}
- (UILabel *)appDesLabel{
    
    if (!_appDesLabel) {
        
        _appDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 35, SCREEN_WIDTH - 80 - 60, 13)];
        _appDesLabel.textColor = [UIColor hexColor:@"#616579"];
        _appDesLabel.font = [UIFont systemFontOfSize:13];
    }
    return _appDesLabel;
}
- (UILabel *)appDateLabel{
    
    if (!_appDateLabel) {
        
        _appDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 53, SCREEN_WIDTH - 80 - 60, 13)];
        _appDateLabel.textColor = [UIColor hexColor:@"#616579"];
        _appDateLabel.font = [UIFont systemFontOfSize:13];
    }
    return _appDateLabel;
}
- (UIButton *)appUpdateButton{
    
    if (!_appUpdateButton) {
        
        _appUpdateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _appUpdateButton.frame = CGRectMake(SCREEN_WIDTH - 50, 25, 40, 30);
        [_appUpdateButton setTitle:@"更新" forState:UIControlStateNormal];
        [_appUpdateButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _appUpdateButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _appUpdateButton.hidden = YES;//默认关闭
    }
    return _appUpdateButton;
}
- (UIView *)bottomLine{
    
    if (!_bottomLine) {
        
        float scale = [UIScreen mainScreen].scale;
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(10, 78, SCREEN_WIDTH - 10, 1.0/scale)];
        _bottomLine.backgroundColor = [UIColor hexColor:@"#eff3f6"];
    }
    return _bottomLine;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
