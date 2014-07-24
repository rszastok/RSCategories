//
//  NSMutableArray+My.h
//  NaviParking
//
//  Created by Rafał Szastok on 06/02/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Empty)
- (void)addIfNotNilObject:(id)object;
- (void)addEvenIfNilObject:(id)object;
@end
