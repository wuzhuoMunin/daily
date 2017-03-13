//
//  ViewController.m
//  Douban
//
//  Created by Raven－z on 2017/3/10.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

/*
 response = <NSHTTPURLResponse: 0x600000226200> { URL: https://api.douban.com/v2/book/search?q=%22%E7%88%B1%E4%BD%A0%22 } { status code: 200, headers {
 "Cache-Control" = "must-revalidate, no-cache, private";
 Connection = "keep-alive";
 "Content-Length" = 69143;
 "Content-Type" = "application/json; charset=utf-8";
 Date = "Fri, 10 Mar 2017 10:16:54 GMT";
 Expires = "Sun, 1 Jan 2006 01:00:00 GMT";
 "Keep-Alive" = "timeout=30";
 Pragma = "no-cache";
 Server = dae;
 "Set-Cookie" = "bid=gqfjmEgDCwU; Expires=Sat, 10-Mar-18 10:16:54 GMT; Domain=.douban.com; Path=/";
 Vary = "Accept-Encoding";
 "X-DAE-App" = book;
 "X-DAE-Node" = sindar20a;
 "X-DOUBAN-NEWBID" = gqfjmEgDCwU;
 "X-Ratelimit-Limit2" = 100;
 "X-Ratelimit-Remaining2" = 99;
 } }
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
