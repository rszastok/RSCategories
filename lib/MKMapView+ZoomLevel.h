//
//  MKMapView+ZoomLevel.h
//  NaviParking
//
//  Created by Rafał Szastok on 03/01/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//
// http://troybrant.net/blog/2010/01/set-the-zoom-level-of-an-mkmapview/
#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;
@end