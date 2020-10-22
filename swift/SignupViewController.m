//
//  signupViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SignupViewController.h"


@interface SignupViewController ()

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

@end

@implementation SignupViewController{
    BOOL phone;
    CGFloat keyboardHeight;
};


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.botView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.view.frame.size.height*0.95, self.view.frame.size.width, self.view.frame.size.width*0.05)];
    [self.view addSubview:self.botView];
    
    self->phone=YES;
    self.label = [[UILabel alloc] init];
    self.label.text = @"";
    self.label.userInteractionEnabled = YES;
    self.label.textColor = [UIColor whiteColor];
    self.label.frame = CGRectMake(0, 0, 500, 40);
    [self.botView addSubview:self.label];
    //set up observer on self
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    //mid subview
    UIView *midSubView = [[UIView alloc] init];
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.5;
    midSubView.frame = CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.15, widthOfView, heightOfView);
    
    //style components
    [self styleNameField];
    [midSubView addSubview:self.nameField];
    
    [self styleNumField];
    [midSubView addSubview:self.numField];
    
    [self styleAgeField];
    [midSubView addSubview:self.ageField];
    
    //add scroll view
    [self initScrollView];
    [self.scrollView addSubview:midSubView];
    
    //style heading
    UILabel *_heading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, widthOfView, heightOfView*0.2)];
    [_heading setText:@"Create your account"];
    [_heading setTextColor:[UIColor whiteColor]];
    [_heading setTextAlignment:NSTextAlignmentCenter];
    [_heading setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:25]];
    [midSubView addSubview:_heading];
    

    
    [self styleNextButton];
    [midSubView addSubview:self.next];
    [self.view addSubview:self.scrollView];
    

}

-(void) initScrollView {
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.95)];
    [self.scrollView layoutIfNeeded];
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*0.950000000001)];

    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
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
              action:@selector(nameFieldDidChange)
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
    [self.numField addTarget:self
              action:@selector(numFieldDidChange)
    forControlEvents:UIControlEventEditingChanged];
    [self.numField addTarget:self action:@selector(changePads) forControlEvents:UIControlEventEditingDidBegin];
    NSLog(self->phone? @"on phone":@"use email");
}

-(void) styleAgeField {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfField = heightOfView*0.2;
    
    self.ageField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, 3*heightOfField+110, widthOfView, heightOfField)];
    self.ageField.placeholder = @"Date of birth";
    self.ageField.textColor = [UIColor whiteColor];
    self.ageInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.ageField];
    [self.ageInputController setNormalColor:[UIColor whiteColor]];
    [self.ageInputController setActiveColor:[UIColor whiteColor]];
    self.ageInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.ageInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.ageInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.ageInputController.borderFillColor = [UIColor clearColor];
    self.ageInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.ageInputController.borderRadius = 10.0;
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    NSDate *now = [NSDate date];
    NSDateComponents *minusHundredYears = [NSDateComponents new];
    minusHundredYears.year = -150;
    NSDate *hundredYearsAgo = [[NSCalendar currentCalendar] dateByAddingComponents:minusHundredYears toDate:now options:0];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker setMaximumDate:now];
    [datePicker setMinimumDate:hundredYearsAgo];
    [datePicker addTarget:self action:@selector(dateFieldDidChange:) forControlEvents:UIControlEventValueChanged];
    self.ageField.inputView = datePicker;
}

-(void) styleNextButton {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfButton = 52;
    CGFloat widthOfButton = widthOfView*0.9;
    
    self.next = [[MDCButton alloc] initWithFrame:CGRectMake((widthOfView-widthOfButton)*0.5, 4*heightOfView*0.2 + 160, widthOfButton, heightOfButton)];
//    self.next.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:94.0/255.0 blue:148.0/255.0 alpha:1.0];
    self.next.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:94.0/255.0 blue:148.0/255.0 alpha:1.0];
    [self.next setTitle:@"next >" forState:UIControlStateNormal];
    self.next.layer.cornerRadius = 20;
    self.next.uppercaseTitle = NO;
    [self.next addTarget:self action:@selector(verify) forControlEvents:UIControlEventTouchUpInside];
}

-(void) verify {
    NSString *name = self.nameField.text;
    if ([name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
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
    NSString *num = self.numField.text;
    if ([num stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0 || self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
        if(self->phone) {
            self.numField.placeholder = @"*Please enter a valid phone number.";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
        } else {
            self.numField.placeholder = @"*Please enter a valid email.";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
        }
        return;
    }
    if ([self.ageField.text length]==0) {
        self.ageField.placeholder = @"*Please enter your age.";
        self.ageInputController.floatingPlaceholderActiveColor = [UIColor redColor];
        self.ageInputController.floatingPlaceholderNormalColor = [UIColor redColor];
        self.ageInputController.inlinePlaceholderColor = [UIColor redColor];
    }
}

-(void) nameFieldDidChange{
    if ([self.nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length != 0) {
        self.nameField.placeholder = @"Name";
        self.nameInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
        self.nameInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
        self.nameInputController.inlinePlaceholderColor = [UIColor whiteColor];
        return;
    } else {
        self.nameField.placeholder = @"*Please enter a name";
        self.nameInputController.floatingPlaceholderActiveColor = [UIColor redColor];
        self.nameInputController.floatingPlaceholderNormalColor = [UIColor redColor];
        self.nameInputController.inlinePlaceholderColor = [UIColor redColor];
    }
};

-(void) numFieldDidChange {
    if ([self.numField.placeholder isEqualToString:@"Phone Number"] || [self.numField.placeholder isEqualToString: @"*Please enter a valid phone number."]) {
        NSString *phoneRegex = @"^((\\+)|(0)|(00))[0-9]{6,14}$";
        NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
        if ([phoneTest evaluateWithObject:self.numField.text]) {
            self.numField.placeholder = @"Phone Number";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
            self.numInputController.inlinePlaceholderColor = [UIColor whiteColor];
            return;
        } else {
            self.numField.placeholder = @"*Please enter a valid phone number.";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
        }
    } else {
        NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
        NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
        NSString *emailRegex = NO ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        if ([emailTest evaluateWithObject:self.numField.text]) {
            self.numField.placeholder = @"Email";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
            self.numInputController.inlinePlaceholderColor = [UIColor whiteColor];
        } else {
            self.numField.placeholder = @"*Please enter a valid email.";
            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
        }
    }
};

-(void) dateFieldDidChange:(UIDatePicker *)sender {
    self.ageField.text = [sender.date.description substringToIndex:10];
    if (self.ageInputController.floatingPlaceholderActiveColor == [UIColor redColor]) {
        self.ageField.placeholder = @"Date of birth";
        self.ageInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
        self.ageInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
        self.ageInputController.inlinePlaceholderColor = [UIColor whiteColor];
    }
}

-(void) changePads {
    if (self->phone) {
        self.numField.keyboardType = UIKeyboardTypePhonePad;
    } else {
        self.numField.keyboardType = UIKeyboardTypeDefault;
    }
}

-(void) keyboardWillShow:(NSNotification *)notification {
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil]; //this is it!
    self->keyboardHeight = keyboardRect.origin.y;
    NSLog(@"%f", self->keyboardHeight);
    if (true) {
        self.botView.frame = CGRectMake(self.botView.frame.origin.x, self.botView.frame.origin.y-(height-keyboardRect.origin.y), self.botView.frame.size.width, self.botView.frame.size.height);
        if ([self.numField isFirstResponder]) {
    //        [self.label setTextColor:[UIColor whiteColor]];
            if (self->phone) {
                [self.label setText:@"Use email instead"];
                self.numField.keyboardType = UIKeyboardTypePhonePad;
                if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
                    self.numField.placeholder = @"*Please enter a valid phone number.";
                } else {
                    self.numField.placeholder = @"Phone Number";
                }
            } else {
                [self.label setText:@"Use phone instead"];
                self.numField.keyboardType = UIKeyboardTypeDefault;
                if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
                    self.numField.placeholder = @"*Please enter a valid email.";
                } else {
                    self.numField.placeholder = @"Email";
                }
            }
        }
    }
}

-(void) keyboardWillHide:(NSNotification *)notification {
    self.botView.frame = CGRectMake(self.botView.frame.origin.x, self.view.frame.size.height*0.95, self.botView.frame.size.width, self.botView.frame.size.height);
}


@end
