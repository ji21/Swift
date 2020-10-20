//
//  authViewController.h
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignupViewController : AuthViewController

@property (nonatomic, strong) MDCTextInputControllerFilled *nameInputController;
@property (nonatomic, strong) MDCTextField *nameField;


@property (nonatomic, strong) MDCTextInputControllerFilled *numInputController;
@property (nonatomic, strong) MDCTextField *numField;

@end

NS_ASSUME_NONNULL_END
