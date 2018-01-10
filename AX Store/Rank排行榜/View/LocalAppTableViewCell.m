//
//  LocalAppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "LocalAppTableViewCell.h"
#import "LocalAppModel.h"
@implementation LocalAppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setContentCellWithAppInfo:(id)model{
    
    LocalAppModel *mod = (LocalAppModel *)model;
    self.appNameLabel.text = mod.localizedName;
    self.appDesLabel.text = [NSString stringWithFormat:@"版本 %@，%@MB",mod.shortVersionString,[NSString getSize:mod.staticDiskUsage]];
//    self.appDateLabel.text = mod.buildCreated;

    if (mod.appIconPath) {
        
        UIImage *image = [UIImage imageWithContentsOfFile:mod.appIconPath];
        if (image) {
            self.appImageView.image = image;
        }
    }

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
