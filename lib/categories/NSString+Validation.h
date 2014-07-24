//
//  NSString+Validation.h
//  NaviParking
//
//  Created by Rafał Szastok on 22/11/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kValidationString = 0,
    kValidationWord,
    kValidationWords,
    kValidationInteger,
    kValidationReal,
    kValidationEmail = 1000,
    kValidationPhoneNumber,
    kValidationVersion,
    kValidationPassword
} ELValidationType;

@interface NSString (Validation)
- (BOOL)isValidType:(ELValidationType)validationType;
- (BOOL)isCharsetValidForType:(ELValidationType)validationType;
+ (UIKeyboardType)keyboardTypeForValidation:(ELValidationType)validationType;
@end
