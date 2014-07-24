//
//  CLLocation+My.h
//  NaviParking
//
//  Created by Rafał Szastok on 14/04/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation(Basic)
- (instancetype)initWithCLLocationCoord2D:(CLLocationCoordinate2D)locCoord2d;
@end
