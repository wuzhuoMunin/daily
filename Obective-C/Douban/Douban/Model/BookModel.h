//
//  BookModel.h
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

@class Rating;
@class Series;
#import <Foundation/Foundation.h>

@interface BookModel : NSObject

@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *alt_title;
@property (nonatomic, copy) NSArray *author;
@property (nonatomic, copy) NSString *author_intro;
@property (nonatomic, copy) NSString *binding;
@property (nonatomic, copy) NSString *catalog;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSDictionary *images;
@property (nonatomic, assign) int isbn10;
@property (nonatomic, assign) int isbn13;
@property (nonatomic, copy) NSString *origin_title;
@property (nonatomic, assign) int pages;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, strong) Rating *rating;
@property (nonatomic, strong) Series *series;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *translator;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDic:(NSDictionary *)dic;

//{
//    alt = "https://book.douban.com/subject/3071717/";
//    "alt_title" = "";
//    author =             (
//                          "\U738b\U5c0f\U6ce2",
//                          "\U674e\U94f6\U6cb3"
//                          );
//    "author_intro" = "U3002";
//    binding = "\U5e73\U88c5";
//    catalog = "\U9ece\U660e";
//    id = 3071717;
//    image = "https://img3.doubanio.com/mpic/s4661043.jpg";
//    images =             {
//        large = "https://img3.doubanio.com/lpic/s4661043.jpg";
//        medium = "https://img3.doubanio.com/mpic/s4661043.jpg";
//        small = "https://img3.doubanio.com/spic/s4661043.jpg";
//    };
//    isbn10 = 7806859985;
//    isbn13 = 9787806859988;
//    "origin_title" = "";
//    pages = 222;
//    price = "18.00\U5143";
//    pubdate = "2008-5";
//    publisher = "\U4e0a\U6d77\U9526\U7ee3\U6587\U7ae0\U51fa\U7248\U793e";
//    rating =             {
//        average = "8.8";
//        max = 10;
//        min = 0;
//        numRaters = 30569;
//    };
//    series =             {
//        id = 3439;
//        title = "\U738b\U5c0f\U6ce2\U4f5c\U54c1\U5168\U96c6";
//    };
//    subtitle = "";
//    summary = "\U738b\U5c0f\U6ce2\U4e66\U4fe1\U5747\U9009\U81ea\U671d\U534e\U51fa\U7248\U793e2004\U5e744\U6708\U7b2c\U4e00\U7248\U300a\U7231\U4f60\U5c31\U50cf\U7231\U751f\U547d\U300b\Uff0c\U6b64\U4e66\U7cfb\U738b\U5c0f\U6ce2\U751f\U524d\U4ece\U672a\U53d1\U8868\U8fc7\U7684\U4e0e\U674e\U94f6\U6cb3\U7684\U201c\U4e24\U5730\U4e66\U201d\Uff0c\U4e5f\U662f\U8fc4\U4eca\U4ed6\U4eec\U592b\U5987\U6700\U5b8c\U6574\U548c\U72ec\U7acb\U7684\U4e00\U672c\U4e66\U4fe1\U96c6\U3002";
//    tags =             (
//                        {
//                            count = 12851;
//                            name = "\U738b\U5c0f\U6ce2";
//                            title = "\U738b\U5c0f\U6ce2";
//                        },
//                        {
//                            count = 5804;
//                            name = "\U7231\U4f60\U5c31\U50cf\U7231\U751f\U547d";
//                            title = "\U7231\U4f60\U5c31\U50cf\U7231\U751f\U547d";
//                        },
//                        {
//                            count = 4355;
//                            name = "\U674e\U94f6\U6cb3";
//                            title = "\U674e\U94f6\U6cb3";
//                        },
//                        {
//                            count = 3792;
//                            name = "\U4e66\U4fe1\U96c6";
//                            title = "\U4e66\U4fe1\U96c6";
//                        },
//                        {
//                            count = 3677;
//                            name = "\U7231\U60c5";
//                            title = "\U7231\U60c5";
//                        },
//                        {
//                            count = 2620;
//                            name = "\U60c5\U4e66";
//                            title = "\U60c5\U4e66";
//                        },
//                        {
//                            count = 1434;
//                            name = "\U4e2d\U56fd\U6587\U5b66";
//                            title = "\U4e2d\U56fd\U6587\U5b66";
//                        },
//                        {
//                            count = 1132;
//                            name = "\U6563\U6587";
//                            title = "\U6563\U6587";
//                        }
//                        );
//    title = "\U7231\U4f60\U5c31\U50cf\U7231\U751f\U547d";
//    translator =             (
//    );
//    url = "https://api.douban.com/v2/book/3071717";
//},
@end

@interface Rating : NSObject

@property (nonatomic, copy) NSString *average;
@property (nonatomic, assign) int max;
@property (nonatomic, assign) int min;
@property (nonatomic, assign) int numRaters;

@end

@interface Series : NSObject  

@property (nonatomic, assign) int ID;
@property (nonatomic, copy) NSString *title;

@end

@interface Tag : NSObject

@property (nonatomic, assign) int count;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;

@end
