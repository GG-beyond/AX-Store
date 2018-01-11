//
//  LocalAppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "LocalAppTableViewCell.h"
#import "LocalAppModel.h"
#import "UIImage+Icon.h"

@implementation LocalAppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setContentCellWithAppInfo:(id)model{
    
    LocalAppModel *mod = (LocalAppModel *)model;
    if (mod.itemName.length>0) {
        self.appNameLabel.text = mod.itemName;//应用商店名字
    }else{
        self.appNameLabel.text = mod.localizedName;
    }
    self.appDesLabel.text = [NSString stringWithFormat:@"版本 %@，%@MB",mod.shortVersionString,[NSString getSize:mod.staticDiskUsage]];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];//创建一个日期格式化器
    dateFormatter.dateFormat=@"yyyy-MM-dd";
    
    NSString *dateStr = [dateFormatter stringFromDate:mod.registeredDate];
    self.appDateLabel.text = dateStr;

    if (mod.iconDataForVariant) {
        
        UIImage *image = [UIImage getAppIcon:mod.iconDataForVariant];
        if (image) {
            self.appImageView.image = image;
        }
    }

    
}
- (void)doDownOrUpdate:(UIButton *)sender{
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
