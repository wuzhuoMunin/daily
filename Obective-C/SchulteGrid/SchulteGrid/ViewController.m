//
//  ViewController.m
//  SchulteGrid
//
//  Created by Raven－z on 2017/3/27.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "ViewController.h"
#import "SchulteGridView.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, strong) UIButton *stateButton;
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) SchulteGridView *schulteGridView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _seconds = 0;
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.stateButton];
    [self.view addSubview:self.schulteGridView];
    [self.view addSubview:self.resetButton];
}

#pragma private-method

- (void)resetSchulteGrid{
    _timeLabel.text = @"00:00.00";
    _seconds = 0;
    [_schulteGridView reSetGridValue];
    [self timeStop];
}

- (void)clickStateButton:(UIButton *)btn{
    if ([btn.titleLabel.text isEqualToString:@"begin"]) {
        [self timerStart];
    }else{
        [self timeStop];
    }
}

- (void)timerStart{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(runAction) userInfo:nil repeats:YES];
    [_stateButton setTitle:@"finished" forState:UIControlStateNormal];
    _resetButton.enabled = NO;
}

- (void)timeStop{
    [_timer invalidate];
    _timer = nil;
    [_stateButton setTitle:@"begin" forState:UIControlStateNormal];
    _resetButton.enabled = YES;
}

- (void)runAction{
    _seconds ++;
    NSString * time = [NSString stringWithFormat:@"%02li:%02li.%02li",_seconds/100/60%60,_seconds/100%60,_seconds%100];
    _timeLabel.text = time;
}

- (void)viewDidLayoutSubviews{
    _timeLabel.frame = CGRectMake((screenWidth - 200) / 2, 50, 200, 30);
    _schulteGridView.frame = CGRectMake((screenWidth - 256) / 2, 100, 250, 250);
    _stateButton.frame = CGRectMake(screenWidth / 2 - 100, CGRectGetMaxY(_schulteGridView.frame)+ 20, 100, 100);
    _resetButton.frame = CGRectMake(screenWidth / 2 , _stateButton.frame.origin.y, 100, 100);
}

#pragma mark - getters

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.text = @"00:00.00";
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

- (UIButton *)stateButton{
    if (!_stateButton) {
        _stateButton = [[UIButton alloc]init];
        [_stateButton addTarget:self action:@selector(clickStateButton:) forControlEvents:UIControlEventTouchUpInside];
        [_stateButton setTitle:@"begin" forState:UIControlStateNormal];
        [_stateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_stateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _stateButton.layer.borderWidth = 1;
        _stateButton.layer.cornerRadius = 50;
    }
    return _stateButton;
}

- (UIButton *)resetButton{
    if (!_resetButton) {
        _resetButton = [[UIButton alloc]init];
        [_resetButton addTarget:self action:@selector(resetSchulteGrid) forControlEvents:UIControlEventTouchUpInside];
        _resetButton.backgroundColor = [UIColor blackColor];
        [_resetButton setTitle:@"reset" forState:UIControlStateNormal];
        [_resetButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_resetButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        _resetButton.layer.borderWidth = 1;
        _resetButton.layer.cornerRadius = 50;
    }
    return _resetButton;
}

- (SchulteGridView *)schulteGridView{
    if (!_schulteGridView) {
        _schulteGridView = [[SchulteGridView alloc]init];
        _schulteGridView.layer.borderWidth = 1;
    }
    return _schulteGridView;
}

@end
