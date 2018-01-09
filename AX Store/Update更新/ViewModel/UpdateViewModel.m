//
//  UpdateViewModel.m
//  AX Store
//
//  Created by anxindeli on 2018/1/8.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "UpdateViewModel.h"

@implementation UpdateViewModel
{
    BOOL isRefreshing;
}
- (instancetype)init{
    
    if (self = [super init]) {
        
        [self doAppInfoListData];
    }
    return self;
}
- (NSMutableArray *)listArr{
    
    if (!_listArr) {
        _listArr = [NSMutableArray array];
    }
    return _listArr;
    
}
//获取项目列表信息
- (void)doAppInfoListData{
    
    if (isRefreshing) {
        return;
    }
    isRefreshing = YES;
    NSString *api_key = APIKey;

    NSString *postUrl = @"https://www.pgyer.com/apiv2/app/listMy";
    NSDictionary *parameters = @{@"_api_key":api_key};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    __weak typeof(self)weakSelf = self;

    [manager POST:postUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *respondDict = (NSDictionary *)responseObject;
        NSInteger status = [respondDict[@"code"] integerValue];
        if (status == 0) {
            [weakSelf dealWithProjectInfo:respondDict[@"data"]];
        }
        if (weakSelf.success) {
            weakSelf.success();
        }
        isRefreshing = NO;

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        isRefreshing = NO;
    }];
}
//数据处理
- (void)dealWithProjectInfo:(NSDictionary *)data{
    
    [self.listArr removeAllObjects];

    NSArray *items = data[@"list"];
    if (items.count>0) {//有数据
        
        for (NSDictionary *dic in items) {
            
            NSInteger appType = [dic[@"buildType"] integerValue];//iOS or Andriod
            if (appType == 1) {//只取iOS 应用
                
                AppModel *model = [AppModel modelWithDict:dic];
                [self.listArr addObject:model];
            }
        }
    }
}

#pragma mark - UITableView 数据绑定
- (NSInteger)getSectionCount{
    
    return 1;
}
- (NSInteger)getRowCount:(NSInteger)section{
    
    return self.listArr.count;
}
- (AppModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath{
    
    return self.listArr[indexPath.row];
}

@end
