//
//  UIView+Animation.m
//  NaviParking
//
//  Created by Rafał Szastok on 21/07/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void) shake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 0.6;
    animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
    [self.layer addAnimation:animation forKey:@"shake"];
}
@end
