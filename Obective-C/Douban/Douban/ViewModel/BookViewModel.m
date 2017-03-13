//
//  BookViewModel.m
//  Douban
//
//  Created by Raven－z on 2017/3/12.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "BookViewModel.h"
#import "DBNetWorking.h"
#import "BookModel.h"

@implementation BookViewModel

- (void)searchBookWithName:(NSString *)bookName
                 bookModel:(BookViewModelResponseBlock)bookModelBlock{
    [[DBNetWorking share]getDataWithURl:[NSString stringWithFormat:@"https://api.douban.com/v2/book/search?q=%@",[NSURL URLWithString:bookName]] method:@"get" param:nil result:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        //        NSLog(@"data = %@ response = %@ error = %@",data,response,error);
//        NSLog(@"===>%@",dic);
        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:32];
        for (NSDictionary *tdic in [dic valueForKey:@"books"]) {
            BookModel *bookModel = [[BookModel alloc]initWithDic:tdic];
            [dataArray addObject:bookModel];
        }
//        BookModel *bookModel = [[BookModel alloc]initWithDic:dic];
        bookModelBlock(dataArray);
    }];
    
}

@end
