//
//  LocalViewModel.h
//  AX Store
//
//  Created by anxindeli on 2018/1/10.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "BaseViewModel.h"
#import "LocalAppModel.h"
typedef void (^ReloadCurrentView)(void);

@interface LocalViewModel : BaseViewModel
@property (nonatomic, strong) NSMutableArray *listArr;//请求app列表数组
@property (nonatomic, copy) ReloadCurrentView reloadView;
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
- (LocalAppModel *)getRowModelWithIndexPath:(NSIndexPath *)indexPath;

@end
