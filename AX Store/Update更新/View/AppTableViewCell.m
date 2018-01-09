//
//  AppTableViewCell.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "AppTableViewCell.h"
@interface AppTableViewCell ()

@property (nonatomic, strong) UIImageView *appImageView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UILabel *appDesLabel;
@property (nonatomic, strong) UILabel *appDateLabel;
@property (nonatomic, strong) UIButton *appUpdateButton;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) NSDictionary *appInfo;

@end

@implementation AppTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.appImageView];
        [self addSubview:self.appNameLabel];
        [self addSubview:self.appDesLabel];
        [self addSubview:self.appDateLabel];
        [self addSubview:self.appUpdateButton];
        [self addSubview:self.bottomLine];
    }
    return self;
}
#pragma mark - method
- (void)setContentCellWithAppInfo:(AppModel *)model{
    
    self.appNameLabel.text = model.buildName;
    self.appDesLabel.text = [NSString stringWithFormat:@"版本 %@，%@MB",model.buildVersion,[NSString getSize:model.buildFileSize]];
    self.appDateLabel.text = model.buildCreated;
    
    NSString *urlStr = [NSString stringWithFormat:@"https://www.pgyer.com/image/view/app_icons/%@",model.buildIcon];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.appImageView sd_setImageWithURL:url placeholderImage:nil];
    NSString *appKey = [self matchStr:model.buildIdentifier];
    //多线程请求是否需要更新
    
    NSInteger buildVersion = [model.buildBuildVersion integerValue];
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
#pragma mark - SETTER方法
- (UIImageView *)appImageView{
    
    if (!_appImageView) {
        
        _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _appImageView.layer.cornerRadius = 15;
        _appImageView.layer.masksToBounds = YES;
    }
    return _appImageView;
}
- (UILabel *)appNameLabel{
    
    if (!_appNameLabel) {
        
        _appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 13, SCREEN_WIDTH - 80 - 60, 15)];
        _appNameLabel.textColor = [UIColor hexColor:@"#262a3b"];
        _appNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _appNameLabel;
}
- (UILabel *)appDesLabel{
    
    if (!_appDesLabel) {
        
        _appDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 35, SCREEN_WIDTH - 80 - 60, 13)];
        _appDesLabel.textColor = [UIColor hexColor:@"#616579"];
        _appDesLabel.font = [UIFont systemFontOfSize:13];
    }
    return _appDesLabel;
}
- (UILabel *)appDateLabel{
    
    if (!_appDateLabel) {
        
        _appDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 53, SCREEN_WIDTH - 80 - 60, 13)];
        _appDateLabel.textColor = [UIColor hexColor:@"#616579"];
        _appDateLabel.font = [UIFont systemFontOfSize:13];
    }
    return _appDateLabel;
}
- (UIButton *)appUpdateButton{
    
    if (!_appUpdateButton) {
        
        _appUpdateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _appUpdateButton.frame = CGRectMake(SCREEN_WIDTH - 50, 25, 40, 30);
        [_appUpdateButton setTitle:@"更新" forState:UIControlStateNormal];
        [_appUpdateButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _appUpdateButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _appUpdateButton.hidden = YES;//默认关闭
    }
    return _appUpdateButton;
}
- (UIView *)bottomLine{
    
    if (!_bottomLine) {
        
        float scale = [UIScreen mainScreen].scale;
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(10, 78, SCREEN_WIDTH - 10, 1.0/scale)];
        _bottomLine.backgroundColor = [UIColor hexColor:@"#eff3f6"];
    }
    return _bottomLine;
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
