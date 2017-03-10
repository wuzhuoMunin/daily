//
//  DBNetWorking.m
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "DBNetWorking.h"


@implementation DBNetWorking

+ (DBNetWorking *)share{
    static dispatch_once_t onceToken;
    static DBNetWorking *dbNetWorking = nil;
    dispatch_once(&onceToken, ^{
        dbNetWorking = [[DBNetWorking alloc]init];
    });
    return dbNetWorking;
}

- (void)getDataWithURl:(NSString *)urlString
                method:(NSString *)method
                 param:(NSDictionary *)param
                result:(requestSuccess)result{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        result(data,response,error);
    }];
    
    [task resume];
}

@end
