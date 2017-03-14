//
//  SearchBookVCViewController.m
//  Douban
//
//  Created by Raven－z on 2017/3/12.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "SearchBookVCViewController.h"
#import "BookViewModel.h"
#import "DBNetWorking.h"
#import "BookTableViewDataSource.h"

@interface SearchBookVCViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *resultTableView;
@property (nonatomic, strong) BookTableViewDataSource *bookTVDataSource;

@end

@implementation SearchBookVCViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"豆瓣搜索";
    [self.view addSubview:self.resultTableView];
    
    //考虑异步去执行
    [self dataRefresh];

}

#pragma mark - privateMethod

- (void)dataRefresh{
    BookViewModel *bookViewModel = [[BookViewModel alloc]init];
    [bookViewModel searchBookWithName:@"爱" bookModel:^(NSArray *bookModel) {
        self.bookTVDataSource.resultArray = bookModel;
        [self.resultTableView reloadData];
    }];
}

- (void)viewDidLayoutSubviews{
    _resultTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

#pragma mark - getters

- (UITableView *)resultTableView{
    if (!_resultTableView) {
        _resultTableView = [[UITableView alloc]init];
        _resultTableView.dataSource = self.bookTVDataSource;
        _resultTableView.delegate = self;
    }
    return _resultTableView;
}

- (BookTableViewDataSource *)bookTVDataSource{
    if (!_bookTVDataSource) {
        _bookTVDataSource = [[BookTableViewDataSource alloc]init];
    }
    return _bookTVDataSource;
}

@end
