//
//  BookTableViewDataSource.m
//  Douban
//
//  Created by Raven－z on 2017/3/13.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "BookTableViewDataSource.h"
#import "BookModel.h"

@implementation BookTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    BookModel *model = [self.resultArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.rating.average;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultArray.count;
}

@end
