//
//  SchulteGridView.h
//  SchulteGrid
//
//  Created by Raven－z on 2017/3/27.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchulteGridView : UIView

@property (nonatomic, assign) CGFloat gridSpacing;
@property (nonatomic, assign) CGFloat gridWidth;
@property (nonatomic, strong) UIColor *gridColor;

- (void)reSetGridValue;

@end
