//
//  ViewController.m
//  SearchBarAtNav
//
//  Created by Raven－z on 2017/3/8.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "SearchViewController.h"
#import "DetailsViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) NSMutableDictionary *searchResultDic;

@end

@implementation SearchViewController

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchResultDic = [NSMutableDictionary dictionaryWithCapacity:32];
    [self.view addSubview:self.tableView];
    self.navigationItem.titleView = self.titleView;
    [self.titleView addSubview:self.searchBar];
}

#pragma mark - privateMethod

- (void)viewDidLayoutSubviews{
    _searchBar.frame = CGRectMake(0, 0, 250, 30);
    _titleView.frame = CGRectMake((self.view.frame.size.width - 250)/2, 7, 250, 30);
    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (NSDictionary *)dataDic{
    return @{
             @"jane":@"20",
             @"jack":@"18",
             @"lucy":@"21",
             @"munin":@"24",
             @"amy":@"22",
             @"boby":@"23",
             };
}

#pragma mark - tableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_searchResultDic.allKeys objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _searchResultDic.count;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    DetailsViewController *detailVC = [[DetailsViewController alloc]init];
    detailVC.name = key;
    detailVC.age = [[self dataDic] valueForKey:key];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - searchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchText);
    [_searchResultDic removeAllObjects];
    for (NSString *str in [self dataDic].allKeys) {
        if ([str containsString:searchText]) {
            [_searchResultDic setObject:[[self dataDic]valueForKey:str] forKey:str];
        }
    }
    [_tableView reloadData];
}

#pragma mark - gettersAndSetters

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc]init];

    }
    return _titleView;
}

@end
