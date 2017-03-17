//
//  ViewController.m
//  HeaderRefresh
//
//  Created by Raven－z on 2017/3/16.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "ViewController.h"
#import "WZHeaderRefresh.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, strong) UIRefreshControl *refresh;
@property (nonatomic, strong) WZHeaderRefresh *refresh;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 60);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)collectionViewLayout:flowLayout];;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollEnabled = YES;
    _collectionView.backgroundColor = [UIColor grayColor];
    _collectionView.alwaysBounceHorizontal = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.view addSubview:_collectionView];
    
    //下拉刷新的基本实现方式就是通过KVO的检测，通过检测控件的scrollView的contentOffset去实现。
    //***控件一定要被持有，不然释放掉了就逗了..
    _refresh = [[WZHeaderRefresh alloc]init];
    _refresh.scrollView = _collectionView;
    [_refresh header];
    
    /**********苹果自带的刷新，简单好使，但想自定义话会很麻烦。
    _refresh = [[UIRefreshControl alloc]init];
    [_refresh addTarget:self action:@selector(refreshCV) forControlEvents:UIControlEventValueChanged];
    _refresh.tintColor = [UIColor whiteColor];
    [_collectionView addSubview:self.refresh];*/
    __weak typeof(self)weakSelf = self;
    _refresh.beginRefreshingBlock = ^{
        __strong typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf performSelector:@selector(endRefreshing) withObject:nil afterDelay:3];
    };
}

- (void)endRefreshing{
    NSLog(@"===endRefresh===");
    [_collectionView reloadData];
    [_refresh endRefreshing];
}

//- (void)refreshCV{
//    NSLog(@"=======");
//    [_refresh endRefreshing];
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}


@end
