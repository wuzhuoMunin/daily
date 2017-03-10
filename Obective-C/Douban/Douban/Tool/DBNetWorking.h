//
//  DBNetWorking.h
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^requestSuccess)(NSData *data,NSURLResponse *response,NSError *error);

@interface DBNetWorking : NSObject

+ (DBNetWorking *)share;

- (void)getDataWithURl:(NSString *)urlString
                method:(NSString *)method
                 param:(NSDictionary *)param
                result:(requestSuccess)result;

@end
