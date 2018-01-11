//
//  LocalViewModel.m
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "LocalViewModel.h"
#import "AppManager.h"
@implementation LocalViewModel
- (instancetype)init{
    
    if (self = [super init]) {
        
        [self doLocalAppInfoListData];
    }
    return self;
}
- (void)doLocalAppInfoListData{
    
    AppManager *manager = [AppManager sharedInstance];
    __weak typeof(self)weakSelf = self;
    
    manager.succ = ^(NSArray *arr) {
        
        if (arr.count>0) {

            [weakSelf.listArr removeAllObjects];
            for (NSDictionary *dic in arr) {
                
                LocalAppModel *model = [LocalAppModel modelWithDict:dic];
                [weakSelf.listArr addObject:model];
            }
            weakSelf.reloadView();
        }
    };
    
}
#pragma mark -Setter
- (NSMutableArray *)listArr{
    
    if (!_listArr) {
        
        _listArr = [NSMutableArray array];
        
        AppManager *manager = [AppManager sharedInstance];

        for (NSDictionary *dic in manager.appList) {
            
            LocalAppModel *model = [LocalAppModel modelWithDict:dic];
            [_listArr addObject:model];
        }
    }
    return _listArr;
    
}
#pragma mark - UITableView 数据绑定
- (NSInteger)getSectionCount{
    
    return 1;
}
- (NSInteger)getRowCount:(NSInteger)section{
    
    return self.listArr.count;
}
- (LocalAppModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath{
    
    return self.listArr[indexPath.row];
}
@end
