//
//  signupViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@property (nonatomic, strong) MDCTextInputControllerOutlined *textInputController;
@property (nonatomic, strong) MDCTextField *textField;

@end

@implementation SignupViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    MDCTextInputControllerOutlined *_nameField = [[MDCTextInputControllerOutlined alloc] init];
//    _nameField.placeholderText = @"Name";
//    [self.view addSubview:_nameField];
    self.textField = [[MDCTextField alloc] initWithFrame:CGRectMake(50.f, 50.f, 220.f, 85.f)];
    [self.view addSubview:self.textField];

    self.textInputController = [[MDCTextInputControllerOutlined alloc] initWithTextInput:self.textField];
    self.textInputController.normalColor = [UIColor purpleColor];
    self.textInputController.disabledColor = [UIColor redColor];

    self.textField.enabled = NO;
    self.textField.placeholder = @"placeholder";
    self.textField.text = @"text";
    
    NSLog(@"%@", self.view);
    

}


@end
