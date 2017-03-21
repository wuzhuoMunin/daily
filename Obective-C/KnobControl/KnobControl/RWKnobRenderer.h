//
//  RWKnobRenderer.h
//  KnobControl
//
//  Created by Raven－z on 2017/2/20.
//  Copyright © 2017年 RayWenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWKnobRenderer : NSObject

#pragma mark - Properties associated with all parts of the renderer
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWitdth;

#pragma mark - properties associated with the background track
@property (nonatomic, readonly, strong) CAShapeLayer *trackLayer;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat endAngle;

#pragma mark - Properties associated with the pointer element
@property (nonatomic, readonly, strong) CAShapeLayer *pointerLayer;
@property (nonatomic, assign) CGFloat pointerAngle;
@property (nonatomic, assign) CGFloat pointerLength;

- (void)updateWithBounds:(CGRect)bounds;

- (void)setPointerAngle:(CGFloat)pointerAngle animated:(BOOL)animated;

@end
