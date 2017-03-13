//
//  BookTableViewDataSource.h
//  Douban
//
//  Created by Raven－z on 2017/3/13.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BookTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) NSArray *resultArray;

@end
