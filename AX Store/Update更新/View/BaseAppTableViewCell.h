//
//  BaseAppTableViewCell.h
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseAppTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *appImageView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UILabel *appDesLabel;
@property (nonatomic, strong) UILabel *appDateLabel;
@property (nonatomic, strong) UIButton *appUpdateButton;
@property (nonatomic, strong) UIView *bottomLine;

- (void)setContentCellWithAppInfo:(id)model;

@end
