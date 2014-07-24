//
//  NSString+Validation.m
//  NaviParking
//
//  Created by Rafał Szastok on 22/11/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

#pragma mark - Character sets

+ (NSCharacterSet *)_Digits {
    static dispatch_once_t onceToken = 0;
    static NSCharacterSet* _digits;
    dispatch_once(&onceToken, ^{
        _digits = [NSCharacterSet decimalDigitCharacterSet];
    });
    return _digits;
}

+ (NSCharacterSet *)_PhoneCharacters {
    static dispatch_once_t onceToken = 0;
    static NSMutableCharacterSet *_set;
    dispatch_once(&onceToken, ^{
        _set = [NSMutableCharacterSet decimalDigitCharacterSet];
        [_set addCharactersInString:@"+ "];
    });
    return _set;
}

+ (NSCharacterSet *)_EmailCharacters {
    static dispatch_once_t onceToken = 0;
    static NSMutableCharacterSet *_set;
    dispatch_once(&onceToken, ^{
        _set = [NSMutableCharacterSet alphanumericCharacterSet];
        [_set addCharactersInString:@"@.!#$%&'*+-/=?^_`{|}~"];
    });
    return _set;
}

+ (NSCharacterSet *)_DigitsAndDot {
    static dispatch_once_t onceToken = 0;
    static NSMutableCharacterSet *_set;
    dispatch_once(&onceToken, ^{
        _set = [NSMutableCharacterSet decimalDigitCharacterSet];
        [_set addCharactersInString:@"."];
    });
    return _set;
}

#pragma mark - Public methods

+ (UIKeyboardType)keyboardTypeForValidation:(ELValidationType)validationType {
    switch (validationType) {
        case kValidationEmail:
            return UIKeyboardTypeEmailAddress;
        case kValidationWord:
        case kValidationWords:
        case kValidationString:
        case kValidationVersion:
        case kValidationPassword:
            return UIKeyboardTypeDefault;
        case kValidationInteger:
            return UIKeyboardTypeDecimalPad;
        case kValidationPhoneNumber:
            return UIKeyboardTypeNamePhonePad;
        case kValidationReal:
            return UIKeyboardTypeNumbersAndPunctuation;
    }
}

- (BOOL)isCharsetValidForType:(ELValidationType)validationType {
    if (self.length == 0)
        return YES;
    NSCharacterSet *set = nil;
    switch (validationType) {
        case kValidationEmail:
            set = [[self class] _EmailCharacters];
            break;
        case kValidationInteger:
        case kValidationPhoneNumber:
            set = [[self class] _PhoneCharacters];
            break;
        case kValidationReal:
            set = [[self class] _DigitsAndDot];
            break;
        case kValidationString:
        case kValidationVersion:
        case kValidationWords:
        case kValidationWord:
        case kValidationPassword:
            return YES;
        default:
            DLog(@"Index out of range");
            return NO;
    }
    NSRange nond = [self rangeOfCharacterFromSet:set];
    return NSNotFound != nond.location;
}

- (BOOL)isValidType:(ELValidationType)validationType {
    switch (validationType) {
        case kValidationEmail:
            return [self _isValidEmail];
        case kValidationInteger:
            return [self _isValidInteger];
        case kValidationPhoneNumber:
            return [self _isValidPhoneNumber];
        case kValidationReal:
            return [self _isValidReal];
        case kValidationWords:
        case kValidationString:
            return YES;
        case kValidationVersion:
            return [self _isValidVersion];
        case kValidationWord:
            return [self _isValidWord];
        case kValidationPassword:
            return self.length >= 5;
        default:
            DLog(@"Index out of range");
            return NO;
    }
}

#pragma mark - Validation

- (BOOL)_isValidWord {
    NSString *phoneRegex = @"[a-zA-Z]+";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}

- (BOOL)_isValidReal {
    NSString *phoneRegex = @"([0-9]+)|([0-9]*\\.[0-0]*)";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}

- (BOOL)_isValidInteger {
    NSString *phoneRegex = @"[0-9]+";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [test evaluateWithObject:self];
}
- (BOOL)_isValidPhoneNumber {
    NSString *phoneRegex = @"[+]?[ ]?[0-9]{3,15}";
    if ([phoneRegex isKindOfClass:[NSString class]]) {
        
    }
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)_isValidEmail {
    //static const BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    const NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    //const NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    const NSString *emailRegex = stricterFilterString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self] && self.length <= 80;
}

- (BOOL)_isValidVersion {
    NSString *versionRegex = @"[1-9][0-9]*(\\.[0-9]+){0,4}";
    NSPredicate *versionTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", versionRegex];
    return [versionTest evaluateWithObject:self];
}

@end