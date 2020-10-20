//
//  signupViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SignupViewController.h"


@interface SignupViewController ()

-(void) styleNameField;
-(void) styleNumField;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    //mid subview
    UIView *midSubView = [[UIView alloc] init];
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.4;
    midSubView.frame = CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.60, widthOfView, heightOfView);
    
    //namefields
    CGFloat heightOfField = heightOfView*0.2;
    [self styleNameField];
    [midSubView addSubview:self.nameField];
    
    //email or phone fields
    self.numField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, heightOfField, widthOfView, heightOfView*0.2)];
    self.numField.placeholder = @"Phone number or email address";
    self.numField.textColor = [UIColor whiteColor];
    
    //email or phone fields controller
    self.numInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.numField];
    [self.numInputController setNormalColor:[UIColor whiteColor]];
    [self.numInputController setActiveColor:[UIColor whiteColor]];
    self.numInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.numInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.numInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.numInputController.borderFillColor = [UIColor clearColor];
    self.numInputController.borderRadius = 10.0;
    [midSubView addSubview:self.numField];
    
    [self.view addSubview:midSubView];

}

-(void) styleNameField {
    //namefields
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    
    CGFloat heightOfField = heightOfView*0.2;
    self.nameField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, widthOfView, heightOfField)];
    self.nameField.placeholder = @"Name";
    self.nameField.textColor = [UIColor whiteColor];
    [self.nameField setEnabled:YES];
    
    
    //namefield input controller
    self.nameInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.nameField];
    [self.nameInputController setNormalColor:[UIColor whiteColor]];
    [self.nameInputController setActiveColor:[UIColor whiteColor]];
    self.nameInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.nameInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.nameInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.nameInputController.borderFillColor = [UIColor clearColor];
    self.nameInputController.borderRadius = 10.0;
}

//-(void) styleNumField {
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
//    CGFloat widthOfView = width*0.7;
//    CGFloat heightOfView = height*0.2;
//    CGFloat heightOfField = heightOfView*0.2;
//
//    //email or phone fields
//    self.numField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, heightOfField, widthOfView, heightOfView*0.2)];
//    self.numField.placeholder = @"Phone number or email address";
//    self.numField.textColor = [UIColor whiteColor];
//
//    //email or phone fields controller
//    self.numInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.numField];
//    [self.numInputController setNormalColor:[UIColor whiteColor]];
//    [self.numInputController setActiveColor:[UIColor whiteColor]];
//    self.numInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
//    self.numInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
//    self.numInputController.inlinePlaceholderColor = [UIColor whiteColor];
//    self.numInputController.borderFillColor = [UIColor clearColor];
//    self.numInputController.borderRadius = 10.0;
//}

@end
