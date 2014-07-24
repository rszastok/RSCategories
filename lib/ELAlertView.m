//
//  ELErrorManager.m
//  NaviParking
//
//  Created by Rafał Szastok on 10/12/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import "ELAlertView.h"

@interface ELAlertView ()<UIAlertViewDelegate>
@end

@implementation ELAlertView

#pragma mark - custom initializaiton

+ (ELAlertView *)sharedInstance {
    static dispatch_once_t onceToken;
    static ELAlertView *alertView = nil;
    dispatch_once(&onceToken, ^{
        alertView = [[ELAlertView alloc] init];
    });
    return alertView;
}

+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum message:(NSString *)message {
    return [self alertViewType:titleEnum message:message buttons:kAlertViewButtonSetOK completion:nil];
}

+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum message:(NSString *)message completion:(ELAlertResultBlock)completionBlock {
    return [self alertViewType:titleEnum message:message buttons:kAlertViewButtonSetOK completion:completionBlock];
}

+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum
                       message:(NSString *)message
                       buttons:(ELAlertViewButtonSet)buttonSet
                    completion:(ELAlertResultBlock)completionBlock {
    NSString *title = [self _getTitleForType:titleEnum];
    ELAlertView *av = [[ELAlertView sharedInstance] initWithTitle:title message:message];
    av.completionBlock = completionBlock;
    av.buttons = buttonSet;
    return av;
}

+ (ELAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message {
    return [self alertViewWithTitle:title message:message buttons:kAlertViewButtonSetOK completion:nil];
}

+ (ELAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message completion:(ELAlertResultBlock)completionBlock {
    return [self alertViewWithTitle:title message:message buttons:kAlertViewButtonSetOK completion:completionBlock];
}

+ (ELAlertView *)alertViewWithTitle:(NSString *)title message:(NSString *)message buttons:(ELAlertViewButtonSet)buttonSet completion:(ELAlertResultBlock)completionBlock {
    ELAlertView *av = [[ELAlertView sharedInstance] initWithTitle:title message:message];
    av.completionBlock = completionBlock;
    av.buttons = buttonSet;
    return av;
}

+ (NSString *)_getTitleForType:(ELAlertViewTitleEnum)titleEnum {
    NSString *title = nil;
    switch (titleEnum) {
        case kAlertViewTitleConfirm:
            title = NSLocalizedString(@"Confirm", nil);
            break;
        case kAlertViewTitleError:
            title = NSLocalizedString(@"Error", nil);
            break;
        case kAlertViewTitleSuccess:
            title = NSLocalizedString(@"Success", nil);
            break;
        case kAlertViewTitleWarning:
            title = NSLocalizedString(@"Warning", nil);
            break;
        case kAlertViewTitleCheckYourInput:
            title = NSLocalizedString(@"Check your input", nil);
            break;
        default:
            title = @"";
            break;
    }
    return title;
}

#pragma mark - Initialization

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message {
    self = [super init];
    if (self) {
        _completionBlock = nil;
        _buttons = kAlertViewButtonSetOK; //default button set
        _alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    }
    return self;
}

#pragma mark - Private methods

// Call once only for every alert view instance.
- (void)_configureButtons {
    switch (self.buttons) {
        case kAlertViewButtonSetOK:
            [self.alertView addButtonWithTitle:NSLocalizedString(@"OK", nil)];
            [self.alertView setCancelButtonIndex:-1];
            break;
        case kAlertViewButtonSetOKCancel:
            [self.alertView addButtonWithTitle:NSLocalizedString(@"OK", nil)];
            [self.alertView addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
            [self.alertView setCancelButtonIndex:1];
            break;
        case kAlertViewButtonSetYesNo:
            [self.alertView addButtonWithTitle:NSLocalizedString(@"Yes", nil)];
            [self.alertView addButtonWithTitle:NSLocalizedString(@"No", nil)];
            [self.alertView setCancelButtonIndex:-1];
            break;
        case kAlertViewButtonSetYesNoCancel:
            [self.alertView addButtonWithTitle:NSLocalizedString(@"Yes", nil)];
            [self.alertView addButtonWithTitle:NSLocalizedString(@"No", nil)];
            [self.alertView addButtonWithTitle:NSLocalizedString(@"Cancel", nil)];
            [self.alertView setCancelButtonIndex:2];
            break;
        default:
            break;
    }
}

#pragma mark - Methods

- (void)show {
    [self _configureButtons];
    [self.alertView show];
}

#pragma mark - Alert view delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock == nil)
        return;
    ELAlertViewButton but = kAlertViewButtonOK;
    switch (self.buttons) {
        case kAlertViewButtonSetOK:
            but = kAlertViewButtonOK;
            break;
        case kAlertViewButtonSetOKCancel:
            but = buttonIndex == 0 ? kAlertViewButtonOK : kAlertViewButtonCancel;
            break;
        case kAlertViewButtonSetYesNo:
            but = buttonIndex == 0 ? kAlertViewButtonYes : kAlertViewButtonNo;
            break;
        case kAlertViewButtonSetYesNoCancel:
            if (buttonIndex == 0)
                but = kAlertViewButtonYes;
            else if (buttonIndex == 1)
                but = kAlertViewButtonNo;
            else //2
                but = kAlertViewButtonCancel;
            break;
    }
    self.completionBlock(but);
}

@end
