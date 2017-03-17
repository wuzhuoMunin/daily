
//  WZHeaderRefresh.m
//  HeaderRefresh
//
//  Created by Raven－z on 2017/3/16.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "WZHeaderRefresh.h"

@interface WZHeaderRefresh (){
    float lastPosition;
//    float contentHeight;
    float headerHeight;
    
    BOOL isRefreshing;//是否正在刷新,默认NO
    
    UILabel *headerLabel;
    UIView *headerView;
    UIImageView *headerIV;
    UIActivityIndicatorView *activityView;
}

@end

@implementation WZHeaderRefresh

- (void)header{
    isRefreshing = NO;
    lastPosition = 0;
    headerHeight = 35;
    float scrollWidth = _scrollView.frame.size.width;
    float imageWidth = 13;
    float imageHeight = headerHeight;
    float labelWidth = 130;
    float labelHeight = headerHeight;
    
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, - headerHeight - 10, _scrollView.frame.size.width, headerHeight)];
    [_scrollView addSubview:headerView];
    
    headerLabel = [[UILabel alloc]initWithFrame:CGRectMake((scrollWidth - labelWidth)/2, 0, labelWidth, labelHeight)];
    [headerView addSubview:headerLabel];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.text = @"松开刷新";
    headerLabel.font = [UIFont systemFontOfSize:14];
    
    headerIV = [[UIImageView alloc]initWithFrame:CGRectMake((scrollWidth - labelWidth)/2, 0, imageWidth, imageHeight)];
    [headerView addSubview:headerIV];
    
    activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.frame = CGRectMake((scrollWidth - labelWidth)/2 - imageWidth, 0, imageWidth, imageHeight);
    [headerView addSubview:activityView];
    
    activityView.hidden = YES;
    headerIV.hidden = NO;
    
    
     [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if (![@"contentOffset" isEqualToString:keyPath])
        return;
    
//    contentHeight = _scrollView.contentSize.height;
    
    if (_scrollView.dragging) {
        int currrentPosition = _scrollView.contentOffset.y;
        
        if (!isRefreshing) {
            [UIView animateWithDuration:0.3 animations:^{
                if (currrentPosition < -headerHeight*1.5) {
                    headerLabel.text = @"准备刷新";
                    headerIV.transform = CGAffineTransformMakeRotation(M_PI);
                }else{
                    
                    int currentPosition = _scrollView.contentOffset.y;
                    
                    if (currrentPosition - lastPosition > 5) {
                        lastPosition = currentPosition;
                        headerIV.transform = CGAffineTransformMakeRotation(M_PI*2);
                        
                        headerLabel.text = @"松开刷新";
                    }else if (lastPosition - currentPosition > 5){
                        lastPosition = currentPosition;
                    }
                }
            }];
        }
    }else{
        if ([headerLabel.text isEqualToString:@"准备刷新"]) {
            [self beginRefreshing];
        }
    }
}

- (void)beginRefreshing{
    if (!isRefreshing) {
        
        isRefreshing = YES;
        headerLabel.text = @"读取";
        headerIV.hidden = YES;
        activityView.hidden = NO;
        [activityView startAnimating];
        
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint point = _scrollView.contentOffset;
            if (point.y > -headerHeight*1.5) {
                _scrollView.contentOffset = CGPointMake(0, point.y - headerHeight);
            }
            
            _scrollView.contentInset = UIEdgeInsetsMake(headerHeight*1.5, 0, 0, 0);
        }];
        
        if (_beginRefreshingBlock) {
            _beginRefreshingBlock();
        }
    }
}

- (void)endRefreshing{
    isRefreshing = NO;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint point = _scrollView.contentOffset;
            if (point.y != 0 ) {
                _scrollView.contentOffset = CGPointMake(0, point.y + headerHeight*1.5);
            }
            
            headerLabel.text = @"pull down";
            _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            headerIV.hidden = NO;
            headerIV.transform = CGAffineTransformMakeRotation(M_PI*2);
            [activityView stopAnimating];
            activityView.hidden = YES;
        }];
    });
}


- (void)dealloc{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
