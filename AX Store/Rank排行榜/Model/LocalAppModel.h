//
//  LocalAppModel.h
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "BaseModel.h"

@interface LocalAppModel : BaseModel
@property (nonatomic, strong) NSString *appIconPath;//图标icon
@property (nonatomic, strong) NSString *shortVersionString;//版本
@property (nonatomic, strong) NSString *localizedName;//名称
@property (nonatomic, strong) NSString *staticDiskUsage;//大小
@property (nonatomic, strong) NSString *applicationIdentifier;//app buildId 唯一标识
@property (nonatomic, strong) NSString *bundleVersion;//更新

@end
