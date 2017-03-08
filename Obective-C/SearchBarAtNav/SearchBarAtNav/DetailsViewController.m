//
//  DetailsViewController.m
//  SearchBarAtNav
//
//  Created by Raven－z on 2017/3/8.
//  Copyright © 2017年 wuzhuoMunin. All rights reserved.
//

#import "DetailsViewController.h"

@implementation DetailsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 30)];
    label.center = self.view.center;
    label.text = [NSString stringWithFormat:@"Hi I am %@, %@ years old",self.name,self.age];
    [self.view addSubview:label];
    
}

@end
