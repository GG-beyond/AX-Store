//
//  AppTableViewCell.h
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface AppTableViewCell : UITableViewCell
- (void)setContentCellWithAppInfo:(AppModel *)model;

@end
