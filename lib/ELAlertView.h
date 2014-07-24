//
//  ELErrorManager.h
//  NaviParking
//
//  Created by Rafał Szastok on 10/12/13.
//  Copyright (c) 2013 Ekinno Lab Sp. z o. o. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ELAlertView;

/// Title
typedef enum : NSUInteger {
    kAlertViewTitleWarning,
    kAlertViewTitleError,
    kAlertViewTitleConfirm,
    kAlertViewTitleSuccess,
    kAlertViewTitleCheckYourInput
} ELAlertViewTitleEnum;

/// The buttons shown in UIAlertView
typedef enum : NSUInteger {
    kAlertViewButtonSetOK,
    kAlertViewButtonSetOKCancel,
    kAlertViewButtonSetYesNo,
    kAlertViewButtonSetYesNoCancel,
} ELAlertViewButtonSet;

typedef enum : NSUInteger {
    kAlertViewButtonOK,
    kAlertViewButtonCancel,
    kAlertViewButtonYes,
    kAlertViewButtonNo
} ELAlertViewButton;

typedef void (^ELAlertResultBlock)(ELAlertViewButton tappedButton);

@interface ELAlertView : NSObject

+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum
                       message:(NSString *)message;
+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum
                       message:(NSString *)message
                    completion:(ELAlertResultBlock)completionBlock;
+ (ELAlertView *)alertViewType:(ELAlertViewTitleEnum)titleEnum
                       message:(NSString *)message
                       buttons:(ELAlertViewButtonSet)buttonSet
                    completion:(ELAlertResultBlock)completionBlock;

+ (ELAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message;
+ (ELAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                         completion:(ELAlertResultBlock)completionBlock;
+ (ELAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                            buttons:(ELAlertViewButtonSet)buttonSet
                         completion:(ELAlertResultBlock)completionBlock;
+ (ELAlertView *)sharedInstance;
- (void)show;
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

@property (nonatomic, assign) ELAlertViewButtonSet buttons;
@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) ELAlertResultBlock completionBlock;
@end