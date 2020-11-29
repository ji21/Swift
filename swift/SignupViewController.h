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

@property (nonatomic, strong) MDCButton *label;
@property (nonatomic, strong) UILabel *heading;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *botView;
@property (nonatomic, strong) UIView *midSubView;

-(void) initScrollView;
-(void) styleNameField;
-(void) styleNumField;
-(void) styleNextButton;
-(void) styleAgeField;
-(void) verifyName;
-(void) nameFieldDidChange;
-(void) numFieldDidChange;
-(void) dateFieldDidChange;
-(void) changePads;
-(void) keyboardWillShow;
-(void) keyboardWillHide;
-(void) labelTapped;
-(void) openDatePicker;
-(void) layoutBotView;
-(void) pushSetPasswordViewController;

@end

NS_ASSUME_NONNULL_END
