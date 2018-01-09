//
//  UITableView+Fit.h
//  AnXin
//
//  Created by anxindeli on 2017/10/20.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderView.h"
@interface UITableView (Fit)
@property (nonatomic, retain ,readonly) PlaceHolderView *emptyView;
-(void)addEmptyViewTitle:(NSString*)title;
- (void)xx_reloadData;

@end
