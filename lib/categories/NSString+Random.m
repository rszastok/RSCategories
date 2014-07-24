//
//  NSString+Random.m
//  NaviParking
//
//  Created by Rafał Szastok on 10/18/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomStringWithLength:(NSInteger)length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return [self randomStringWithLength:length characters:letters];
}

+ (NSString *)randomStringWithLength:(NSInteger)length characters:(NSString *)letters {
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        int charIndex = arc4random() % [letters length];
        [randomString appendFormat:@"%C", [letters characterAtIndex:charIndex]];
    }
    return randomString;
}
@end
