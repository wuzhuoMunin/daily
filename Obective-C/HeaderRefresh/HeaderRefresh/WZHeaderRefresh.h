//
//  WZHeaderRefresh.h
//  HeaderRefresh
//
//  Created by Raven－z on 2017/3/16.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^BeginRefreshingBlock)(void);

@interface WZHeaderRefresh : NSObject

@property (nonatomic, strong) UIScrollView *scrollView;
/**
 *  Header初始化
 */
- (void)header;

/**
 *  正在刷新的回调
 */
@property (nonatomic, copy) BeginRefreshingBlock beginRefreshingBlock;

/**
 *  开始刷新操作 若正在刷新则return
 */
- (void)beginRefreshing;

/**
 *  关闭刷新 请加在UIScrollView数据刷新后  reloaddata后
 */
- (void)endRefreshing;

@end
