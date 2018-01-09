//
//  AXUpdateViewController.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "AXUpdateViewController.h"
#import "AppTableViewCell.h"
#import "UpdateViewModel.h"
#import "AppModel.h"
#import <MJRefresh.h>
#import "UITableView+Fit.h"

@interface AXUpdateViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UpdateViewModel *updateViewModel;

@end

@implementation AXUpdateViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.updateViewModel getRowCount:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"appCell";
    AppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        
        cell = [[AppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    AppModel *model = [self.updateViewModel getRowModelWithIndexPath:indexPath];
    if (model) {
        [cell setContentCellWithAppInfo:model];
    }
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //跳转使用
    AppModel *model = [self.updateViewModel getRowModelWithIndexPath:indexPath];
}
#pragma mark - Method
- (void)doListNewData{
    
    [self.updateViewModel doAppInfoListData];
}
#pragma mark - Set 方法
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVBARHEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVBARHEIGHT)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(doListNewData)];
        [_tableView addEmptyViewTitle:@"暂无应用"];
    }
    return _tableView;
}
- (UpdateViewModel *)updateViewModel{
    
    __weak typeof(self)weakSelf = self;
    if (!_updateViewModel) {
        
        _updateViewModel = [[UpdateViewModel alloc] init];
        _updateViewModel.success = ^{
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        };
        _updateViewModel.failure = ^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        };
    }
    return _updateViewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
