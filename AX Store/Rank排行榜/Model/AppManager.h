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

+ (AppManager *)sharedInstance;
- (void)openAppWithBundleId:(NSString *)bunleIdentifier;
@end
