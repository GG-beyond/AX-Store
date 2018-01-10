//
//  AXRankViewController.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//
#import "AXRankViewController.h"
#import "UITableView+Fit.h"
#import "LocalAppTableViewCell.h"
#import "LocalViewModel.h"
@interface AXRankViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LocalViewModel *localViewModel;

@end

@implementation AXRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.localViewModel getRowCount:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"appCell";
    LocalAppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        
        cell = [[LocalAppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    [cell setContentCellWithAppInfo:[self.localViewModel getRowModelWithIndexPath:indexPath]];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //跳转使用
}
#pragma mark - Set 方法
- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVBARHEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVBARHEIGHT - TABHEIGHT)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView addEmptyViewTitle:@"暂无应用"];
    }
    return _tableView;
}
- (LocalViewModel *)localViewModel{
    
    if (!_localViewModel) {
        
        __weak typeof(self) weakSelf = self;
        _localViewModel = [[LocalViewModel alloc] init];
        _localViewModel.reloadView = ^{
            [weakSelf.tableView reloadData];
        };
    }
    return _localViewModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
