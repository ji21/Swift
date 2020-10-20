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
-(void) styleNextButton;
-(void) verifyDetails;
-(void) textFieldDidChange;

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
    midSubView.frame = CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.15, widthOfView, heightOfView);
    
    //namefields
//    CGFloat heightOfField = heightOfView*0.2;
    [self styleNameField];
    [midSubView addSubview:self.nameField];
    
    [self styleNumField];
    [midSubView addSubview:self.numField];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*0.87);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [scrollView addSubview:midSubView];
    
    UILabel *_heading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, widthOfView, heightOfView*0.2)];
    [_heading setText:@"Create your account"];
    [_heading setTextColor:[UIColor whiteColor]];
    [_heading setTextAlignment:NSTextAlignmentCenter];
    [_heading setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:25]];
    [midSubView addSubview:_heading];
    
    [self styleNextButton];
    
    [midSubView addSubview:self.next];
    [self.view addSubview:scrollView];
    

}

-(void) styleNameField {
    //namefields
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfField = heightOfView*0.2;
    
    self.nameField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, heightOfField+40, widthOfView, heightOfField)];
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
    self.nameInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.nameInputController.borderRadius = 10.0;
    [self.nameField addTarget:self
              action:@selector(textFieldDidChange)
    forControlEvents:UIControlEventEditingChanged];
}

-(void) styleNumField {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfField = heightOfView*0.2;

    //email or phone fields
    self.numField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, 2*heightOfField+75, widthOfView, heightOfField)];
    self.numField.placeholder = @"Phone number or email address";
    self.numField.textColor = [UIColor whiteColor];
    self.numField.keyboardType = UIKeyboardTypePhonePad;

    //email or phone fields controller
    self.numInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.numField];
    [self.numInputController setNormalColor:[UIColor whiteColor]];
    [self.numInputController setActiveColor:[UIColor whiteColor]];
    self.numInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.numInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.numInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.numInputController.borderFillColor = [UIColor clearColor];
    self.numInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.numInputController.borderRadius = 10.0;
}

-(void) styleNextButton {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfButton = 52;
    CGFloat widthOfButton = widthOfView*0.9;
    
    self.next = [[MDCButton alloc] initWithFrame:CGRectMake((widthOfView-widthOfButton)*0.5, 3*heightOfView*0.2 + 140, widthOfButton, heightOfButton)];
    self.next.backgroundColor = [UIColor clearColor];
    [self.next setTitle:@"next >" forState:UIControlStateNormal];
    [self.next setBorderWidth:2.0 forState:UIControlStateNormal];
    [self.next setBorderColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.next.layer.cornerRadius = 20;
    self.next.uppercaseTitle = NO;
    [self.next addTarget:self action:@selector(verifyDetails) forControlEvents:UIControlEventTouchUpInside];
}

-(void) verifyDetails {
    NSString *name = self.nameField.text;
    NSString *phoneOrEmail;
    if ([name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
//        [self.nameInputController setErrorText:@"*Please enter a name." errorAccessibilityValue:@"hihisadfsagdsfag"];
        self.nameField.text = @"";
        self.nameField.placeholder = @"*Please enter a name";
        self.nameInputController.floatingPlaceholderActiveColor = [UIColor redColor];
        self.nameInputController.floatingPlaceholderNormalColor = [UIColor redColor];
        self.nameInputController.inlinePlaceholderColor = [UIColor redColor];
        return;
    } else {
        self.nameField.placeholder = @"Name";
        self.nameInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
        self.nameInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
        self.nameInputController.inlinePlaceholderColor = [UIColor whiteColor];
    }
}

-(void) textFieldDidChange{
    if ([self.nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length != 0) {
        self.nameField.placeholder = @"Name";
        self.nameInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
        self.nameInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
        self.nameInputController.inlinePlaceholderColor = [UIColor whiteColor];
        [self.nameInputController setNormalColor:[UIColor greenColor]];
        [self.nameInputController setActiveColor:[UIColor greenColor]];
        return;
    } else {
        [self.nameInputController setNormalColor:[UIColor whiteColor]];
        [self.nameInputController setActiveColor:[UIColor whiteColor]];
    }
    NSLog(self.nameField.text);
};

@end
