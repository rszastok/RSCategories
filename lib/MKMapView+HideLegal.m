//
//  MKMapView+HideLegal.m
//  NaviParking
//
//  Created by Rafał Szastok on 14/05/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "MKMapView+HideLegal.h"

@implementation MKMapView (HideLegal)
- (void)hideLegalLabel {
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            UIView *legalView = subview;
            legalView.hidden = YES;
            break;
        }
    }
}
@end
