//
//  BookModel.m
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.alt = [dic valueForKey:@"alt"];
        self.alt_title = [dic valueForKey:@"alt_title"];
        self.author = [dic valueForKey:@"author"];
        self.author_intro = [dic valueForKey:@"author_intro"];
        self.binding = [dic valueForKey:@"binding"];
        self.catalog = [dic valueForKey:@"catalog"];
        self.ID = [dic valueForKey:@"id"];
        self.image = [dic valueForKey:@"image"];
        self.images = [dic valueForKey:@"images"];
        self.isbn10 = [[dic valueForKey:@"isbn10"]intValue];
        self.isbn13 = [[dic valueForKey:@"isbn13"]intValue];
        self.origin_title = [dic valueForKey:@"origin_title"];
        self.pages = [[dic valueForKey:@"pages"]intValue];
        self.price = [dic valueForKey:@"price"];
        self.pubdate = [dic valueForKey:@"pubdate"];
        self.publisher = [dic valueForKey:@"publisher"];
        self.rating = [[Rating alloc]init];
        self.rating.average = [[dic valueForKey:@"rating"]valueForKey:@"average"];
        self.rating.max = [[[dic valueForKey:@"rating"]valueForKey:@"max"]intValue];
        self.rating.min = [[[dic valueForKey:@"rating"]valueForKey:@"min"]intValue];
        self.rating.numRaters = [[[dic valueForKey:@"rating"]valueForKey:@"numRaters"]intValue];
        self.series = [[Series alloc]init];
        self.series.ID = [[[dic valueForKey:@"series"]valueForKey:@"id"]intValue];
        self.series.title = [[dic valueForKey:@"series"]valueForKey:@"title"];
        self.subtitle = [dic valueForKey:@"subtitle"];
        self.summary = [dic valueForKey:@"summary"];
        self.tags = [dic valueForKey:@"tags"];
        self.title = [dic valueForKey:@"title"];
        self.translator = [dic valueForKey:@"translator"];
        self.url = [dic valueForKey:@"url"];
    }
    return self;
}

- (void)setTags:(NSArray *)tags{
    NSMutableArray *tagsArray = [NSMutableArray arrayWithCapacity:32];
    for (NSDictionary *dic in tags) {
        Tag *tag = [[Tag alloc]init];
        tag.count = [[dic valueForKey:@"count"]intValue];
        tag.name = [dic valueForKey:@"name"];
        tag.title = [dic valueForKey:@"title"];
        [tagsArray addObject:tag];
    }
    _tags = tagsArray.copy;
}


@end

@implementation Rating

@end

@implementation Series

@end

@implementation Tag

@end
