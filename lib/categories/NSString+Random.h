//
//  NSString+Random.h
//  NaviParking
//
//  Created by Rafał Szastok on 10/18/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)
+ (NSString *)randomStringWithLength:(NSInteger)length;
+ (NSString *)randomStringWithLength:(NSInteger)length characters: (NSString *)letters;
@end