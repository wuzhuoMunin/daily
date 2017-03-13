//
//  BookViewModel.h
//  Douban
//
//  Created by Raven－z on 2017/3/12.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"

typedef void (^BookViewModelResponseBlock)(NSArray *bookModel);

@interface BookViewModel : NSObject

- (void)searchBookWithName:(NSString *)bookName
                 bookModel:(BookViewModelResponseBlock)bookModelBlock;

@end
