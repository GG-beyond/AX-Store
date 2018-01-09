//
//  UpdateViewModel.h
//  AX Store
//
//  Created by anxindeli on 2018/1/8.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "BaseViewModel.h"
#import "AppModel.h"
typedef void (^Success)(void);
typedef void (^Failure)(void);

@interface UpdateViewModel : BaseViewModel
@property (nonatomic, strong) NSMutableArray *listArr;//请求app列表数组
@property (nonatomic, copy) Success success;//成功回调
@property (nonatomic, copy) Failure failure;//失败回调

/**
 下拉刷新，第一页数据
 */
- (void)doAppInfoListData;//第一页数据
#pragma mark - 获取和TableView绑定的数据
/*
 返回某个section下row 的个数
 */
- (NSInteger)getRowCount:(NSInteger)section;
/*
 返回section的个数
 */
- (NSInteger)getSectionCount;
/*
 返回indexPath对应的 模型类
 */
- (AppModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;

@end
