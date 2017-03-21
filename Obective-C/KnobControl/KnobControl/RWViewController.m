//
//  RWViewController.m
//  KnobControl
//
//  Created by Sam Davies on 14/11/2013.
//  Copyright (c) 2013 RayWenderlich. All rights reserved.
//

#import "RWViewController.h"
#import "RWKnobControl.h"

@interface RWViewController (){
    RWKnobControl *_knobControl;
}

@end

@implementation RWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _knobControl = [[RWKnobControl alloc]initWithFrame:self.knobPlaceholder.bounds];
    _knobControl.lineWidth = 4.0;
    _knobControl.pointerLength = 8.0;
    //tintColor是什么？？
    self.view.tintColor = [UIColor redColor];
    [self.knobPlaceholder addSubview:_knobControl];
    [_knobControl addTarget:self action:@selector(handleValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_knobControl addObserver:self forKeyPath:@"value" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if (object == _knobControl && [keyPath isEqualToString:@"value"]) {
        self.valueLabel.text =  [NSString stringWithFormat:@"%0.2f", _knobControl.value];
    }
}

- (IBAction)handleValueChanged:(id)sender {
//    _knobControl.value = self.valueSlider.value;
    if (sender == self.valueSlider) {
        _knobControl.value = self.valueSlider.value;
    }else if (sender == _knobControl){
        self.valueSlider.value = _knobControl.value;
    }
}

- (IBAction)handleRandomButtonPressed:(id)sender {
    CGFloat randomValue = (arc4random() % 101) / 100.f;
    [_knobControl setValue:randomValue animated:self.animateSwitch.on];
    [self.valueSlider setValue:randomValue animated:self.animateSwitch.on];
}
@end
