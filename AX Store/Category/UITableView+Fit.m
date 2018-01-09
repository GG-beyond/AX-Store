//
//  UITableView+Fit.m
//  AnXin
//
//  Created by anxindeli on 2017/10/20.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "UITableView+Fit.h"
#import <objc/runtime.h>

// 定义关联的key
static const char *key="emptyView";

@implementation UITableView (Fit)
+ (void)load{
    
    if (@available(iOS 11,*)) {

        [self swizzlingInClass: [self class] originalSelector:@selector(initWithFrame:style:) swizzledSelector:@selector(swizz_initWithFrame:style:)];
    }
    
    //替换方法

    [self swizzlingInClass: [self class] originalSelector:@selector(reloadData) swizzledSelector:@selector(xx_reloadData)];

}
- (instancetype)swizz_initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    [self swizz_initWithFrame:frame style:style];
    self.estimatedRowHeight = 0;
    self.estimatedSectionFooterHeight = 0;
    self.estimatedSectionHeaderHeight = 0;

    return self;
}

- (void)xx_reloadData{
    
    [self xx_reloadData];//先刷新一次，
    
    if (!self.emptyView) {
        return;
    }
    NSInteger sections = [self numberOfSections];
    if (sections <= 0) {
        self.emptyView.hidden = NO;
    }else{
        
        BOOL isHasRows = false;
        for (int i=0; i<sections; i++) {
            NSInteger rows = [self numberOfRowsInSection:i];
            
            if (rows>0) {
                isHasRows = true;
                break;
            }else{
                isHasRows = false;
            }
        }
        self.emptyView.hidden = isHasRows;
    }
}
-(void)addEmptyViewTitle:(NSString*)title{
    
    if (!self.emptyView) {
        self.emptyView = [[PlaceHolderView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))withTitle:title];
        self.emptyView.hidden = YES;
        [self addSubview:self.emptyView];
    }
}
- (void)setEmptyView:(UIView *)emptyView{
    
    objc_setAssociatedObject(self, key, emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (PlaceHolderView *)emptyView{
    
    return objc_getAssociatedObject(self, key);
}

#pragma mark - 方法交换
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    
    Class class = cls;
    
    Method originalMethod =class_getInstanceMethod(class, originalSelector);
    
    Method swizzledMethod =class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    
    class_addMethod(class,
                    
                    originalSelector,
                    
                    method_getImplementation(swizzledMethod),
                    
                    method_getTypeEncoding(swizzledMethod));
    
    if(didAddMethod) {
        
        class_replaceMethod(class,
                            
                            swizzledSelector,
                            
                            method_getImplementation(originalMethod),
                            
                            method_getTypeEncoding(originalMethod));
        
    } else {
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
    }
    
}

@end
