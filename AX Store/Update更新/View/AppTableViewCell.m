//
//  AppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "AppTableViewCell.h"
#import "AppModel.h"
@interface AppTableViewCell ()
@property (nonatomic, strong) NSDictionary *appInfo;

@end

@implementation AppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - method
- (void)setContentCellWithAppInfo:(id)model{
    AppModel *mod = (AppModel *)model;
    self.appNameLabel.text = mod.buildName;
    self.appDesLabel.text = [NSString stringWithFormat:@"版本 %@，%@MB",mod.buildVersion,[NSString getSize:mod.buildFileSize]];
    self.appDateLabel.text = mod.buildCreated;
    
    NSString *urlStr = [NSString stringWithFormat:@"https://www.pgyer.com/image/view/app_icons/%@",mod.buildIcon];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.appImageView sd_setImageWithURL:url placeholderImage:nil];
    NSString *appKey = [self matchStr:mod.buildIdentifier];
    //多线程请求是否需要更新
    
    NSInteger buildVersion = [mod.buildBuildVersion integerValue];
    dispatch_queue_t queue= dispatch_queue_create("update.queue", DISPATCH_QUEUE_CONCURRENT);
    __weak typeof(self)weakSelf = self;
    dispatch_async(queue, ^{
        NSString *api_key = APIKey;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSDictionary *parameters = @{@"_api_key":api_key,@"appKey":appKey};

        [manager POST:@"https://www.pgyer.com/apiv2/app/check" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {

            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *respondDict = (NSDictionary *)responseObject;
            NSInteger status = [respondDict[@"code"] integerValue];
            if (status == 0) {
                NSInteger buildBuildVersion = [respondDict[@"data"][@"buildBuildVersion"] integerValue];
                if (buildBuildVersion>buildVersion) {//有更新
                    [weakSelf reloadView];
                }
            }

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    });
    
}
- (void)reloadView{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        self.appUpdateButton.hidden = NO;
    });
}
- (NSDictionary *)appInfo{
    
    if (!_appInfo) {
        _appInfo = @{@"com.anxindeli.mainApp":@"ae916e70f4a424e5c5684c9dbb823040",
            @"com.anxindeli.mainApp.niu":@"8ea731c71bf000914531ae36da7289cb",
            @"com.anxindeli.com.AXServer":@"45b4d38fbf6f4d403fbc6138eff183eb",
            @"com.anxindeli.nvShen":@"fd3215640ad9d65606cee9cfeca0d7b8",
            @"com.anxindeli.mainApp.221":@"62fa10f00caa865a00e146ad5645830a",
            @"anxindeli.--de-H5":@"70b4f281fba93fae387c7207c1e5b878",
            @"com.lianchuang.anhao":@"3ac753446e518aaf10a02619b45bb0d8",
            @"com.yulu.App":@"caa05ba442aef1699e10288b7fda37d5"
                     };
    }
    return _appInfo;
}
- (NSString *)matchStr:(NSString *)str{
    
    NSString *temp = @"";
    if (self.appInfo[str]) {
        temp = self.appInfo[str];
    }
    return temp;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
