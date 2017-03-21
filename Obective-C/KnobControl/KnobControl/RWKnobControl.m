//
//  RWKnobControl.m
//  KnobControl
//
//  Created by Raven－z on 2017/2/20.
//  Copyright © 2017年 RayWenderlich. All rights reserved.
//

#import "RWKnobControl.h"
#import "RWKnobRenderer.h"

@implementation RWKnobControl{
    RWKnobRenderer *_knobRenderer;
    RWRotationGestureRecognizer *_gestureRecognizer;
}

@dynamic lineWidth;
@dynamic startAngle;
@dynamic endAngle;
@dynamic pointerLength;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor blueColor];
        
        //设置默认值
        _minimumValue = 0.0;
        _maximumValue = 1.0;
        _value = 0.0;
        _continuous = YES;
        _gestureRecognizer = [[RWRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:_gestureRecognizer];
        
        [self createKnobUI];
    }
    return self;
}

- (void)createKnobUI{
    _knobRenderer = [[RWKnobRenderer alloc]init];
    [_knobRenderer updateWithBounds:self.bounds];
    _knobRenderer.color = self.tintColor;
    _knobRenderer.startAngle = -M_PI * 11 / 8.0;
    _knobRenderer.endAngle = M_PI * 3 / 8.0;
    _knobRenderer.pointerAngle = _knobRenderer.startAngle;
    _knobRenderer.lineWitdth = 2.0;
    _knobRenderer.pointerLength =  6.0;
    [self.layer addSublayer:_knobRenderer.trackLayer];
    [self.layer addSublayer:_knobRenderer.pointerLayer];
}

#pragma mark - API Method

- (void)setValue:(CGFloat)value animated:(BOOL)animated{
    if (value != _value) {
        [self willChangeValueForKey:@"value"];
        _value = MIN(self.maximumValue, MAX(self.minimumValue, value));
        
        CGFloat angleRange = self.endAngle - self.startAngle;
        CGFloat valueRange = self.maximumValue - self.minimumValue;
        CGFloat angleForValue = (_value - self.minimumValue) / valueRange * angleRange + self.startAngle;
//        _knobRenderer.pointerAngle = angleForValue;
        [_knobRenderer setPointerAngle:angleForValue animated:animated];
        [self didChangeValueForKey:@"value"];
    }
}

- (void)tintColorDidChange{
    _knobRenderer.color = self.tintColor;
}

#pragma mark - Property overrides

- (void)setValue:(CGFloat)value{
    [self setValue:value animated:NO];
}

- (CGFloat)lineWidth{
    return _knobRenderer.lineWitdth;
}

- (void)setLineWidth:(CGFloat)lineWidth{
    _knobRenderer.lineWitdth = lineWidth;
}

- (CGFloat)startAngle{
    return _knobRenderer.startAngle;
}

- (void)setStartAngle:(CGFloat)startAngle{
    _knobRenderer.startAngle = startAngle;
}

- (CGFloat)endAngle{
    return _knobRenderer.endAngle;
}

- (void)setEndAngle:(CGFloat)endAngle{
    _knobRenderer.endAngle = endAngle;
}

- (CGFloat)pointerLength{
    return _knobRenderer.pointerLength;
}

- (void)setPointerLength:(CGFloat)pointerLength{
    _knobRenderer.pointerLength = pointerLength;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"value"]) {
        return NO;
    }else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
}

- (void)handleGesture:(RWRotationGestureRecognizer *)gesture{
    CGFloat midPointAngle = (2 * M_PI + self.startAngle - self.endAngle)/2 + self.endAngle;
    CGFloat boundedAngle = gesture.touchAngle;
    if (boundedAngle > midPointAngle) {
        boundedAngle -= 2 * M_PI;
    }else if (boundedAngle < (midPointAngle - 2 * M_PI)){
        boundedAngle += 2 * M_PI;
    }
    
    boundedAngle = MIN(self.endAngle, MAX(self.startAngle, boundedAngle));
    
    CGFloat angleRange = self.endAngle - self.startAngle;
    CGFloat valueRange = self.maximumValue - self.minimumValue;
    CGFloat valueForAngle = (boundedAngle - self.startAngle) / angleRange *valueRange + self.minimumValue;
    
    if (self.continuous) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }else{
        if (_gestureRecognizer.state == UIGestureRecognizerStateEnded || _gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
    
    self.value = valueForAngle;
}

@end
