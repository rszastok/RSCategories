//
//  NSMutableArray+My.m
//  NaviParking
//
//  Created by Rafał Szastok on 06/02/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//
#import "NSMutableArray+Empty.h"

@implementation NSMutableArray (Empty)

- (void)addIfNotNilObject:(id)object {
    if (object != nil)
        [self addObject:object];
}

- (void)addEvenIfNilObject:(id)object {
    if (object == nil)
        [self addObject:[NSNull null]];
    else
        [self addObject:object];
}
@end
