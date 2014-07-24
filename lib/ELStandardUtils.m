//
//  ELStandardUtils.m
//  NaviParking
//
//  Created by Rafał Szastok on 25/04/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "ELStandardUtils.h"

@implementation ELStandardUtils

+ (NSString *)preferedLanguage {
    NSArray *supportedLanguages = @[@"pl",@"en"];
    for (NSString *preferedLanguage in [NSLocale preferredLanguages]) {
        if ([supportedLanguages containsObject:preferedLanguage])
            return preferedLanguage;
    }
    return @"en";
}

+ (BOOL)isEnglish {
    return [[ELStandardUtils preferedLanguage] isEqualToString:@"en"];
}

+ (BOOL)isPolish {
    return [[ELStandardUtils preferedLanguage] isEqualToString:@"pl"];
}
@end
