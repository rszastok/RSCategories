//
//  CLLocation+My.m
//  NaviParking
//
//  Created by Rafał Szastok on 14/04/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "CLLocation+Basic.h"

@implementation CLLocation(Basic)
- (instancetype)initWithCLLocationCoord2D:(CLLocationCoordinate2D)locCoord2d {
    return [self initWithLatitude:locCoord2d.latitude longitude:locCoord2d.longitude];
}
@end
