//
//  AppManager.m
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "AppManager.h"
#import <objc/runtime.h>
@implementation AppManager

+ (AppManager *)sharedInstance{
    
    static dispatch_once_t onceToken;
    __strong static id _instance = nil;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
        [_instance tempMethod];

    });
    return _instance;
}
- (void)tempMethod{

    dispatch_queue_t queue= dispatch_queue_create("localApp.queue", DISPATCH_QUEUE_CONCURRENT);
    __weak typeof(self)weakSelf = self;
    dispatch_async(queue, ^{
        
        [weakSelf getAppInfo];

        dispatch_async(dispatch_get_main_queue(), ^{
            
            weakSelf.success(weakSelf.appList);
        });
        
    });
}
- (void)getAppInfo{
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray *appList = [workspace performSelector:@selector(allApplications)];
    
    Class LSApplicationProxy_class = object_getClass(@"LSApplicationProxy");

    NSMutableDictionary *appDict = [NSMutableDictionary new];
    NSMutableArray *appArr = [NSMutableArray new];

    
    
    for (LSApplicationProxy_class in appList)
    {
#pragma clang diagnostic ignored"-Wundeclared-selector"
        
        
        NSString *applicationType = [LSApplicationProxy_class performSelector:@selector(applicationType)];
        
        if (![applicationType isEqualToString:@"User"]) {
            continue;
        }
        NSString *applicationIdentifier = [LSApplicationProxy_class performSelector:@selector(applicationIdentifier)];
        
        NSString *version = [LSApplicationProxy_class performSelector:@selector(bundleVersion)];
        
        NSString *shortVersionString = [LSApplicationProxy_class performSelector:@selector(shortVersionString)];
        
        //--------------------------------------------
        //图片
        NSDictionary *boundIconsDictionary = [LSApplicationProxy_class performSelector:@selector(boundIconsDictionary)];
        NSString *appIconPath = [NSString stringWithFormat:@"%@/%@.png", [[LSApplicationProxy_class performSelector:@selector(resourcesDirectoryURL)] path], [[[boundIconsDictionary objectForKey:@"CFBundlePrimaryIcon"] objectForKey:@"CFBundleIconFiles"] lastObject]];
        
        // 判断上述获得的app的图标的路径能不能实例化出图像
        
        //-----------------------------------------------
        
        
        
        NSString *teamID = [LSApplicationProxy_class performSelector:@selector(teamID)];
        
        //        NSArray *groupIdentifiers = [LSApplicationProxy_class performSelector:@selector(groupIdentifiers)];
        
        NSInteger originalInstallType = [LSApplicationProxy_class performSelector:@selector(originalInstallType)];
        
        NSInteger installType = [LSApplicationProxy_class performSelector:@selector(installType)];
        
        NSNumber *itemID = [LSApplicationProxy_class performSelector:@selector(itemID)];
        
        NSObject *description = [LSApplicationProxy_class performSelector:@selector(description)];
        
        NSObject *iconStyleDomain = [LSApplicationProxy_class performSelector:@selector(iconStyleDomain)];
        
        NSObject *localizedShortName = [LSApplicationProxy_class performSelector:@selector(localizedShortName)];
        
        NSObject *localizedName = [LSApplicationProxy_class performSelector:@selector(localizedName)];
        
        NSObject *privateDocumentTypeOwner = [LSApplicationProxy_class performSelector:@selector(privateDocumentTypeOwner)];
        
        NSObject *privateDocumentIconNames = [LSApplicationProxy_class performSelector:@selector(privateDocumentIconNames)];
        
        NSObject *resourcesDirectoryURL = [LSApplicationProxy_class performSelector:@selector(resourcesDirectoryURL)];
        
        NSObject *installProgress = [LSApplicationProxy_class performSelector:@selector(installProgress)];
        
        NSObject *appStoreReceiptURL = [LSApplicationProxy_class performSelector:@selector(appStoreReceiptURL)];
        
        NSNumber *storeFront = [LSApplicationProxy_class performSelector:@selector(storeFront)];
        
        NSNumber *dynamicDiskUsage = [LSApplicationProxy_class performSelector:@selector(dynamicDiskUsage)];
        
        NSNumber *staticDiskUsage = [LSApplicationProxy_class performSelector:@selector(staticDiskUsage)];
        
        NSObject *deviceIdentifierForVendor = [LSApplicationProxy_class performSelector:@selector(deviceIdentifierForVendor)];
        
        NSArray *requiredDeviceCapabilities = [LSApplicationProxy_class performSelector:@selector(requiredDeviceCapabilities)];
        
        NSArray *appTags = [LSApplicationProxy_class performSelector:@selector(appTags)];
        
        NSArray *plugInKitPlugins = [LSApplicationProxy_class performSelector:@selector(plugInKitPlugins)];
        
        NSArray *VPNPlugins = [LSApplicationProxy_class performSelector:@selector(VPNPlugins)];
        
        NSArray *externalAccessoryProtocols = [LSApplicationProxy_class performSelector:@selector(externalAccessoryProtocols)];
        
        NSArray *audioComponents = [LSApplicationProxy_class performSelector:@selector(audioComponents)];
        
        NSArray *UIBackgroundModes = [LSApplicationProxy_class performSelector:@selector(UIBackgroundModes)];
        
        NSArray *directionsModes = [LSApplicationProxy_class performSelector:@selector(directionsModes)];
        
//        NSDictionary *groupContainers = [LSApplicationProxy_class performSelector:@selector(groupContainers)];
        
        NSString *vendorName = [LSApplicationProxy_class performSelector:@selector(vendorName)];
        
        NSString *sdkVersion = [LSApplicationProxy_class performSelector:@selector(sdkVersion)];
        
        NSMutableDictionary *dict = [NSMutableDictionary new];
        
        [dict setValue:applicationIdentifier forKey:@"applicationIdentifier"];
        [dict setValue:version forKey:@"bundleVersion"];
        [dict setValue:shortVersionString forKey:@"shortVersionString"];
        //        [dict setValue:groupIdentifiers forKey:@"groupIdentifiers"];
        [dict setValue:@(originalInstallType) forKey:@"originalInstallType"];
        [dict setValue:@(installType) forKey:@"installType"];
        [dict setValue:itemID forKey:@"itemID"];
        [dict setValue:description forKey:@"description"];
        //        [dict setValue:iconStyleDomain forKey:@"iconStyleDomain"];
        [dict setValue:localizedShortName forKey:@"localizedShortName"];
        [dict setValue:localizedName forKey:@"localizedName"];
        //        [dict setValue:privateDocumentTypeOwner forKey:@"privateDocumentTypeOwner"];
        //        [dict setValue:privateDocumentIconNames forKey:@"privateDocumentIconNames"];
        [dict setValue:resourcesDirectoryURL forKey:@"resourcesDirectoryURL"];
        [dict setValue:installProgress forKey:@"installProgress"];
        [dict setValue:appStoreReceiptURL forKey:@"appStoreReceiptURL"];
        [dict setValue:storeFront forKey:@"storeFront"];
        //        [dict setValue:dynamicDiskUsage forKey:@"dynamicDiskUsage"];
        [dict setValue:staticDiskUsage forKey:@"staticDiskUsage"];
        [dict setValue:deviceIdentifierForVendor forKey:@"deviceIdentifierForVendor"];
        [dict setValue:requiredDeviceCapabilities forKey:@"requiredDeviceCapabilities"];
        [dict setValue:appTags forKey:@"appTags"];
        [dict setValue:plugInKitPlugins forKey:@"plugInKitPlugins"];
        [dict setValue:VPNPlugins forKey:@"VPNPlugins"];
        [dict setValue:externalAccessoryProtocols forKey:@"externalAccessoryProtocols"];
        [dict setValue:audioComponents forKey:@"audioComponents"];
        [dict setValue:UIBackgroundModes forKey:@"UIBackgroundModes"];
        [dict setValue:directionsModes forKey:@"directionsModes"];
        //        [dict setValue:groupContainers forKey:@"groupContainers"];
        [dict setValue:vendorName forKey:@"vendorName"];
        [dict setValue:applicationType forKey:@"applicationType"];
        [dict setValue:sdkVersion forKey:@"sdkVersion"];
        
        if ([UIImage imageWithContentsOfFile:appIconPath]){
            // 能实例化出图像，则表示该路径上确实存在app图标，接下来的操作...
            [dict setValue:appIconPath forKey:@"appIconPath"];
        }

        
        [appDict setValue:dict forKey:applicationIdentifier];
        [appArr addObject:dict];
        
    }
    self.appInfo = appDict;
    self.appList = appArr;
}
@end
