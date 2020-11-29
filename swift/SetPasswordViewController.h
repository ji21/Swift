//
//  SetPasswordViewController.h
//  swift
//
//  Created by Jeffrey Ip on 25/11/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialTextFields.h"
#import "MaterialButtons.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetPasswordViewController : UITableViewController


@property (nonatomic, strong) MDCTextField *passwordField;
@property (nonatomic, strong) MDCTextInputControllerFilled *passwordInputController;

@property (nonatomic, strong) MDCTextField *confirmField;
@property (nonatomic, strong) MDCTextInputControllerFilled *confirmInputController;

@property (nonatomic, strong) MDCButton *createBtn;
@property (nonatomic, strong) UILabel *terms;

@property (nonatomic, strong) UILabel *heading;
@property (nonatomic, strong) UIView *midSubView;

-(void) configureSubviewLayout;
-(void) addTitle;
-(void) addPasswordFields;
-(void) addCreateBtn;
-(void) addTerms;

@end

NS_ASSUME_NONNULL_END
