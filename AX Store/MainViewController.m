//
//  MainViewController.m
//  AX Store
//
//  Created by anxindeli on 2018/1/5.
//  Copyright © 2018年 anxindeli. All rights reserved.
//

#import "MainViewController.h"
#import "AXRecommendViewController.h"
#import "AXKindViewController.h"
#import "AXRankViewController.h"
#import "AXSearchViewController.h"
#import "AXUpdateViewController.h"
#import <objc/runtime.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBarTintColor:[UIColor whiteColor]] ;

    [self setChildrenVC];
}
- (void)setChildrenVC{
    
    NSArray *viewControllers = @[@"AXRecommendViewController",@"AXKindViewController",@"AXRankViewController",@"AXSearchViewController",@"AXUpdateViewController"];
    NSArray *titleArr = @[@"推荐",@"类别",@"排行榜",@"搜索",@"更新"];

    for (int i=0;i<viewControllers.count;i++) {
        
        UIViewController *viewController = [[NSClassFromString(viewControllers[i]) alloc] init];
        viewController.view.backgroundColor = [UIColor hexColor:@"#ffffff"];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        navigationController.navigationItem.title = titleArr[i];
        viewController.title = titleArr[i];
//        viewController.tabBarItem.image = [[UIImage imageNamed:imageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:imageSelArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self addChildViewController:navigationController];
    }

//    UIColor *textColor = self.view.tintColor;
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
