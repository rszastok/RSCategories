//
//  ELStandardUtils.h
//  NaviParking
//
//  Created by Rafał Szastok on 25/04/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELStandardUtils : NSObject

///Frequent used blocks
typedef void (^ELErrorBlock)(NSError *error);
typedef void (^ELEmptyBlock)();
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

+ (NSString *)preferedLanguage;
+ (BOOL)isPolish;
+ (BOOL)isEnglish;
@end
