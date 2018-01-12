//
//  AppManager.h
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^Succ)(NSArray *arr);

@interface AppManager : NSObject
@property (nonatomic, strong) NSDictionary *appInfo;
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, copy) Succ succ;//成功回调

/**
 生成一个实例
 */
+ (AppManager *)sharedInstance;

/**
 通过 bunleIdentifier 打开一个app

 @param bunleIdentifier 应用的唯一标识
 */
- (void)openAppWithBundleId:(NSString *)bunleIdentifier;

/**
 通过一个地址下载、更新app

 @param url .ipa的地址
 */
- (void)downloadAppWithUrl:(NSString *)url;
@end
