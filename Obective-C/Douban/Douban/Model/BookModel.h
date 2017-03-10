//
//  BookModel.h
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

//{
//    alt = "https://book.douban.com/subject/3071717/";
//    "alt_title" = "";
//    author =             (
//                          "\U738b\U5c0f\U6ce2",
//                          "\U674e\U94f6\U6cb3"
//                          );
//    "author_intro" = "\U738b\U5c0f\U6ce2\Uff0c1952\U5e74\U51fa\U751f\U3002\U4e00\U4e2a\U7279\U7acb\U72ec\U884c\U7684\U4f5c\U5bb6\U3002\U4ed6\U7684\U4f5c\U54c1\U88ab\U8a89\U4e3a\U201c\U4e2d\U56fd\U5f53\U4ee3\U6587\U575b\U6700\U7f8e\U7684\U6536\U83b7\U201d\U3002\U81ea1997\U5e744\U670811\U65e5\U53bb\U4e16\U540e\Uff0c\U4ed6\U7684\U4f5c\U54c1\U88ab\U4eba\U4eec\U5e7f\U6cdb\U9605\U8bfb\U3001\U5173\U6ce8\U3001\U8ba8\U8bba\Uff0c\U5e76\U5f15\U53d1\U4e86\U201c\U738b\U5c0f\U6ce2\U70ed\U201d\U7684\U6587\U5316\U73b0\U8c61\U3002\n\U4e3b\U8981\U4f5c\U54c1\U6709\U300a\U9ec4\U91d1\U65f6\U4ee3\U300b\U3001\U300a\U767d\U94f6\U65f6\U4ee3\U300b\U3001\U300a\U9752\U94dc\U65f6\U4ee3\U300b\U3001\U300a\U6211\U7684\U7cbe\U795e\U5bb6\U56ed\U300b\U3001\U300a\U6c89\U9ed8\U7684\U5927\U591a\U6570\U300b\U3001\U300a\U9ed1\U94c1\U65f6\U4ee3\U300b\U3001\U300a\U5730\U4e45\U5929\U957f\U300b\Uff1a\U7eaa\U5ff5\U3001\U8bc4\U8bba\U96c6\U6709  \U300a\U6d6a\U6f2b\U9a91\U58eb\U300b\U3001\U300a\U4e0d\U518d\U6c89\U9ed8\U300b\U3001\U300a\U738b\U5c0f\U6ce2\U753b\U4f20\U300b\U3002\n\U674e\U94f6\U6cb3\Uff0c1952\U5e74\U751f\U4e8e\U5317\U4eac\Uff0c\U738b\U5c0f\U6ce2\U7684\U9057\U5b40\U3002\U4e2d\U56fd\U793e\U4f1a\U79d1\U5b66\U9662\U793e\U4f1a\U5b66\U7814\U7a76\U6240\U7814\U7a76\U5458\U3001\U535a\U58eb\U751f\U5bfc\U5e08\Uff0c\U7f8e\U56fd\U5339\U5179\U5821\U5927\U5b66\U793e\U4f1a\U535a\U58eb\U3001\U5317\U4eac\U5927\U5b66\U793e\U4f1a\U5b66\U535a\U58eb\U540e\U3002\n\U4e3b\U8981\U8457\U4f5c\U6709\U300a\U540c\U6027\U604b\U4e9a\U6587\U5316\U300b\U3001\U300a\U4e2d\U56fd\U4eba\U7684\U6027\U7231\U4e0e\U5a5a\U59fb\U300b\U3001\U300a\U4e2d\U56fd\U5973\U6027\U7684\U6027\U4e0e\U7231\U300b\U7b49\U3002";
//    binding = "\U5e73\U88c5";
//    catalog = "\U4e00\U3001\U5e8f\n\U4e8c\U3001\U8bd7\U4eba\U4e4b\U7231\Uff0c\U738b\U5c0f\U6ce2\U60c5\U4e66\U9009\n\U6700\U521d\U7684\U547c\U5524\n\U7231\U4f60\U5c31\U50cf\U7231\U751f\U547d\n\U75db\U6094\n\U771f\U6b63\U7684\U5a5a\U59fb\U5168\U662f\U5728\U5929\U4e0a\U7f14\U7ed3\U7684\n\U8bf7\U4f60\U4e0d\U8981\U5403\U6211\Uff0c\U6211\U7ed9\U4f60\U5531\U4e00\U652f\U597d\U542c\U7684\U6b4c\n\U5b64\U72ec\U7684\U7075\U9b42\U591a\U4e48\U5bc2\U5bde\U554a\n\U6211\U662f\U4e00\U53ea\U9a86\U9a7c\n\U6211\U5bf9\U597d\U591a\U4eba\U6000\U6709\U6700\U6df1\U7684\U611f\U60c5\Uff0c\U5c24\U5176\U662f\U5bf9\U4f60\n\U543e\U53cb\U674e\U94f6\U6cb3\n\U6211\U73b0\U5728\U60f3\U8ba4\U771f\U4e86\n\U5047\U5982\U4f60\U613f\U610f\Uff0c\U4f60\U5c31\U604b\U7231\U5427\n\U7f8e\U597d\U7684\U65f6\U5149\n\U53bb\U4e0a\U5927\U5b66\n\U4eba\U4e3a\U4ec0\U4e48\U6d3b\U7740\n\U4f60\U548c\U6211\U662f\U5f88\U4e0d\U540c\U7684\U4eba\n\U5b64\U72ec\U662f\U4e11\U7684\n\U6211\U8981\U4f60\Uff0c\U548c\U6211\U6709\U5bbf\U7f18\U7684\U4eba\n\U6ca1\U6709\U4f60\U7684\U751f\U6d3b\n\U6211\U5c31\U8981\U653e\U4e2a\U9707\U52a8\U5317\U4eac\U57ce\U7684\U5927\U70ae\U4ed7\n\U76ee\U7a7a\U4e00\U5207\U7684\U90a3\U79cd\U7231\n\U7231\U60c5\U771f\U7f8e\n\U6211\U538c\U6076\U6a21\U5f0f\U5316\U7684\U751f\U6d3b\n\U6211\U5728\U5bb6\U91cc\U7231\U4f60\U7231\U5f97\U8981\U547d\n\U6211\U597d\U50cf\U5bb3\U4e86\U7259\U75db\n\U590f\U5929\U597d\U5417\Uff1f\n\U4ed6\U4eec\U7684\U6559\U6761\U6bd4\U6591\U9a6c\U8fd8\U591a\n\U5047\U5982\U6211\U50cf\U4f46\U4e01\U6216\U5f7c\U5f97\U62c9\U90a3\U6837\n\U53e3\U9f7f\U4e0d\U7075\n\U54d1\U5df4\U7231\n\U5199\U5728\U4e94\U7ebf\U8c31\U4e0a\U7684\U4fe1\n\U4e09\U3001\U6d6a\U6f2b\U9a91\U58eb\U00b7\U884c\U541f\U8bd7\U4eba\U00b7\U81ea\U7531\U601d\U60f3\U8005\n\U56db\U3001\U6211\U4eec\U66fe\U7ecf\U62e5\U6709\n\U4e94\U3001\U300a\U7eff\U6bdb\U6c34\U602a\U300b\U548c\U6211\U4eec\U7684\U7231\U60c5\n\U516d\U3001\U7eff\U6bdb\U6c34\U602a\n\U4e03\U3001\U6211\U5728\U8352\U5c9b\U4e0a\U8fce\U63a5\U9ece\U660e";
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
