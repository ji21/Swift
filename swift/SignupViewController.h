//
//  authViewController.h
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialButtons.h"
#import "MaterialTextFields.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignupViewController : UITableViewController



@property (nonatomic, strong) MDCTextInputControllerFilled *nameInputController;
@property (nonatomic, strong) MDCTextField *nameField;


@property (nonatomic, strong) MDCTextInputControllerFilled *numInputController;
@property (nonatomic, strong) MDCTextField *numField;

@property (nonatomic, strong) MDCTextField *ageField;
@property (nonatomic, strong) MDCTextInputControllerFilled *ageInputController;

@property (nonatomic, strong) MDCButton *next;

@property (nonatomic, strong) UIButton *label;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *botView;


@end

NS_ASSUME_NONNULL_END
