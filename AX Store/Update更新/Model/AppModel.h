//
//  AppModel.h
//  AX Store
//
//  Created by anxindeli on 2018/1/8.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "BaseModel.h"

@interface AppModel : BaseModel
@property (nonatomic, strong) NSString *buildIcon;//图标icon
@property (nonatomic, strong) NSString *buildVersion;//版本
@property (nonatomic, strong) NSString *buildName;//名称
@property (nonatomic, strong) NSString *buildFileSize;//大小
@property (nonatomic, strong) NSString *buildCreated;//日期
@property (nonatomic, strong) NSString *buildKey;//buildKey
@property (nonatomic, strong) NSString *buildIdentifier;//app buildId 唯一标识
@property (nonatomic, strong) NSString *buildBuildVersion;//更新
@end
