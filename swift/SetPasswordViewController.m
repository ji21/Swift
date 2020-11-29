//
//  SetPasswordViewController.m
//  swift
//
//  Created by Jeffrey Ip on 25/11/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SetPasswordViewController.h"
#import <YogaKit/UIView+Yoga.h>

@interface SetPasswordViewController ()

@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.35;
    self.midSubView = [[UIView alloc] initWithFrame:CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.15, widthOfView, heightOfView)];
    [self addTitle];
    [self addPasswordFields];
    [self.view addSubview:self.midSubView];
    [self configureSubviewLayout];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

-(void) configureSubviewLayout{
    [self.heading configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
        layout.marginBottom = YGPercentValue(10.0);
    }];
    
    [self.passwordField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
    }];
    
    [self.confirmField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
    }];
    
    [self.midSubView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
    }];
    
    [self.midSubView.yoga applyLayoutPreservingOrigin:YES];
}

-(void) addTitle{
    self.heading = [[UILabel alloc] init];
    [self.heading setText:@"Set your password"];
    [self.heading setTextColor:[UIColor whiteColor]];
    [self.heading setTextAlignment:NSTextAlignmentCenter];
    [self.heading setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:25]];
    [self.midSubView addSubview:self.heading];
    
}

-(void) addPasswordFields{
    self.passwordField = [[MDCTextField alloc] init];
    self.passwordField.placeholder = @"Password";
    self.passwordField.textColor = [UIColor whiteColor];
    [self.passwordField setEnabled:YES];
    
    
    //namefield input controller
    self.passwordInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.passwordField];
    [self.passwordInputController setNormalColor:[UIColor whiteColor]];
    [self.passwordInputController setActiveColor:[UIColor whiteColor]];
    self.passwordInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.passwordInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.passwordInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.passwordInputController.borderFillColor = [UIColor clearColor];
    self.passwordInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.passwordInputController.borderRadius = 10.0;
//    [self.passwordField addTarget:self
//              action:@selector(passwordFieldDidChange)
//    forControlEvents:UIControlEventEditingChanged];
    [self.midSubView addSubview:self.passwordField];
    
    self.confirmField = [[MDCTextField alloc] init];
    self.confirmField.placeholder = @"Confirm Password";
    self.confirmField.textColor = [UIColor whiteColor];
    [self.confirmField setEnabled:YES];
    
    
    //namefield input controller
    self.confirmInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.confirmField];
    [self.confirmInputController setNormalColor:[UIColor whiteColor]];
    [self.confirmInputController setActiveColor:[UIColor whiteColor]];
    self.confirmInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.confirmInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.confirmInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.confirmInputController.borderFillColor = [UIColor clearColor];
    self.confirmInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.confirmInputController.borderRadius = 10.0;
//    [self.passwordField addTarget:self
//              action:@selector(passwordFieldDidChange)
//    forControlEvents:UIControlEventEditingChanged];
    [self.midSubView addSubview:self.confirmField];
}

@end
