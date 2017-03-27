//
//  SchulteGridView.m
//  SchulteGrid
//
//  Created by Raven－z on 2017/3/27.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "SchulteGridView.h"

#define SINGLE_LINE_WIDTH (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET ((1 / [UIScreen mainScreen].scale) / 2)

@interface SchulteGridView ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SchulteGridView

static const int gridNumber = 25;
static const int gridTag = 10000;

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _gridColor = [UIColor blackColor];
        _gridWidth = SINGLE_LINE_WIDTH;
        _gridSpacing = 50;
        _dataArray = [NSMutableArray arrayWithCapacity:25];
        [self numberArray];
        [self setGridValue];
    }
    return self;
}

- (void)setGridColor:(UIColor *)gridColor{
    _gridColor = gridColor;
    [self setNeedsDisplay];
}

- (void)setGridWidth:(CGFloat)gridWidth{
    _gridWidth = gridWidth;
    [self setNeedsDisplay];
}

- (void)setGridSpacing:(CGFloat)gridSpacing{
    _gridSpacing = gridSpacing;
    [self setNeedsDisplay];
}

//字典即使乱序也是按照一定顺序进行。
//- (NSDictionary *)numberDic{
//    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:gridNumber];
//    for (int i = 1; i <= gridNumber ; i ++) {
//        [mDic setObject:[NSString stringWithFormat:@"%d",i] forKey:[NSString stringWithFormat:@"%dkey",i]];
//    }
//    NSDictionary *dic = [mDic copy];
//    return dic;
//}


- (void)numberArray{
    [_dataArray removeAllObjects];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:25];
    while (mArray.count < 25) {
        NSString *numberStr = [NSString stringWithFormat:@"%d",(arc4random()%25) + 1];
        if (![mArray containsObject:numberStr]) {
            [mArray addObject:numberStr];
        }
    }
    _dataArray = [mArray mutableCopy];
}

//- (void)numberArray{
//    NSMutableArray *mArray = [[NSMutableArray alloc]initWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25"]];
//    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:25];
//    for (int i = 25; i >= 1; i --) {
//        int j = arc4random()%i;
//        NSString *str = mArray[j];
//        [mArray removeObject:str];
//        [tempArray addObject:str];
//    }
//    _dataArray = tempArray;
//}

- (void)setGridValue{
    for (int i = 0; i < gridNumber ; i ++) {
        int rank = i / 5; //竖排
        int row = i % 5;//横排
        
        UILabel *gridLabel = [[UILabel alloc]init];
        gridLabel.text = _dataArray[i];
        gridLabel.textAlignment = NSTextAlignmentCenter;
        gridLabel.textColor = [UIColor blackColor];
        gridLabel.frame = CGRectMake(_gridSpacing * row, _gridSpacing * rank, _gridSpacing, _gridSpacing);
        gridLabel.tag = gridTag + i;
        [self addSubview:gridLabel];
    }
}

- (void)reSetGridValue{
    [self numberArray];
    for (int i = 0; i < gridNumber; i ++) {
        UILabel *label = (UILabel *)[self viewWithTag:gridTag + i];
        label.text = _dataArray[i];
    }
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGFloat lineMargin = self.gridSpacing;
    
//    CGFloat pixelAdjustOffset = 0;
//    if ((int)(self.gridWidth * [UIScreen mainScreen].scale + 1) % 2 == 0) {
//        pixelAdjustOffset = SINGLE_LINE_ADJUST_OFFSET;
//    }
    
//    CGFloat xPos = lineMargin - pixelAdjustOffset;
//    CGFloat yPos = lineMargin - pixelAdjustOffset;
    
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    
    while (xPos <= self.bounds.size.width) {
        CGContextMoveToPoint(context, xPos, 0);
        CGContextAddLineToPoint(context, xPos, self.bounds.size.height);
        xPos += lineMargin;
    }
    
    while (yPos <= self.bounds.size.height) {
        CGContextMoveToPoint(context, 0, yPos);
        CGContextAddLineToPoint(context, self.bounds.size.width, yPos);
        yPos += lineMargin;
    }
    
    CGContextSetLineWidth(context, self.gridWidth);
    CGContextSetStrokeColorWithColor(context, self.gridColor.CGColor);
    CGContextStrokePath(context);
}

@end
