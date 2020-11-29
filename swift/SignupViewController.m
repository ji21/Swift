//
//  signupViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SignupViewController.h"
#import "SetPasswordViewController.h"
#import <YogaKit/UIView+Yoga.h>



@implementation SignupViewController{
    BOOL phone;
    CGFloat keyboardHeight;
};


- (void)viewDidLoad {
    [super viewDidLoad];


    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    UIColor *color = [[UIColor alloc]initWithRed:23.0/255.0 green:54.0/255.0 blue:121.0/255.0 alpha:1.0];
    
    
    self.view.backgroundColor = color;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    self.botView = [[UIView alloc] initWithFrame:CGRectMake(0, height*0.83, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.04)];
    [self.botView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
//    self.botView.userInteractionEnabled = false;
    [self.view addSubview:self.botView];
    [self.view sendSubviewToBack:self.botView];
    
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.3;
    
    self.midSubView = [[UIView alloc] initWithFrame:CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.15, widthOfView, heightOfView)];
    [self.view addSubview:self.midSubView];
    
    self->phone=YES;
    
//    self.label = [[MDCButton alloc] init];
//    self.label.tintColor = [UIColor whiteColor];
//    [self.label addTarget:self action:@selector(labelTapped) forControlEvents:UIControlEventTouchUpInside];
//    self.label.backgroundColor = [UIColor yellowColor];
//    self.label.hidden = YES;
    
    self.label = [[MDCButton alloc] init];
    [self.label setBackgroundColor:[UIColor clearColor]];
    [self.label setTitle:@"Use email instead" forState:UIControlStateNormal];
    [self.label addTarget:self action:@selector(labelTapped) forControlEvents:UIControlEventTouchUpInside];
    self.label.uppercaseTitle = NO;
    self.label.hidden = YES;
    [self.botView addSubview:self.label];

    //set up observer on self
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.heading = [[UILabel alloc] init];
    [self.heading setText:@"Create your account"];
    [self.heading setTextColor:[UIColor whiteColor]];
    [self.heading setTextAlignment:NSTextAlignmentCenter];
    [self.heading setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:25]];
    [self.midSubView addSubview:self.heading];
    //mid subview
    [self styleNameField];
    [self styleNumField];
    [self styleAgeField];
    
    //style heading
    

    
    [self styleNextButton];
    [self layoutBotView];
    [self layoutMidSubView];

}

-(void) layoutMidSubView{
    [self.heading configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
        layout.marginBottom = YGPercentValue(10.0);
    }];
    
    [self.nameField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
//        layout.height = YGPointValue(20.0);
    }];
    
    [self.numField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
//        layout.height = YGPointValue(20.0);
    }];
    
    [self.ageField configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPercentValue(100.0);
//        layout.height = YGPointValue(20.0);
    }];
//
    [self.midSubView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.justifyContent = YGJustifySpaceAround;
    }];
    
    [self.midSubView.yoga applyLayoutPreservingOrigin:YES];
}

-(void) layoutBotView {
    [self.label configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.height = YGPercentValue(100.0);
        layout.marginLeft = YGPointValue(10.0);
    }];
    
    [self.next configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.height = YGPercentValue(100.0);
//        layout.width = YGPercentValue(16.0);
        layout.marginEnd = YGPointValue(30.0);
    }];
    
    [self.botView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.justifyContent = YGJustifySpaceBetween;
        layout.flexDirection = YGFlexDirectionRow;
        layout.alignItems = YGAlignCenter;
    }];
    
    [self.botView.yoga applyLayoutPreservingOrigin:YES];
};

-(void) styleNameField {
    //namefields
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.2;
    CGFloat heightOfField = heightOfView*0.2;

//    self.nameField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, heightOfField+40, widthOfView, heightOfField)];
    self.nameField = [[MDCTextField alloc] init];
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
    [self.midSubView addSubview:self.nameField];
}

-(void) styleNumField {
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
//    CGFloat widthOfView = width*0.7;
//    CGFloat heightOfView = height*0.2;
//    CGFloat heightOfField = heightOfView*0.2;
//
//    //email or phone fields
//    self.numField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, 2*heightOfField+75, widthOfView, heightOfField)];
    self.numField = [[MDCTextField alloc] init];
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
    [self.midSubView addSubview:self.numField];
}

-(void) styleAgeField {
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
//    CGFloat widthOfView = width*0.7;
//    CGFloat heightOfView = height*0.2;
//    CGFloat heightOfField = heightOfView*0.2;
//
//    self.ageField = [[MDCTextField alloc] initWithFrame:CGRectMake(0.0, 3*heightOfField+110, widthOfView, heightOfField)];
    
    self.ageField = [[MDCTextField alloc] init];
    self.ageField.placeholder = @"Date of birth";
    self.ageField.textColor = [UIColor whiteColor];
    [self.ageField addTarget:self action:@selector(openDatePicker) forControlEvents:UIControlEventEditingDidBegin];
    
    self.ageInputController = [[MDCTextInputControllerFilled alloc] initWithTextInput:self.ageField];
    [self.ageInputController setNormalColor:[UIColor whiteColor]];
    [self.ageInputController setActiveColor:[UIColor whiteColor]];
    self.ageInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
    self.ageInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
    self.ageInputController.inlinePlaceholderColor = [UIColor whiteColor];
    self.ageInputController.borderFillColor = [UIColor clearColor];
    self.ageInputController.textInputClearButtonTintColor = [UIColor whiteColor];
    self.ageInputController.borderRadius = 10.0;
    [self.midSubView addSubview:self.ageField];
}

-(void) styleNextButton {
    self.next = [[MDCButton alloc] init];
    self.next.backgroundColor = [UIColor colorWithRed:67.0/255.0 green:94.0/255.0 blue:148.0/255.0 alpha:1.0];
    [self.next setTitle:@"Next" forState:UIControlStateNormal];
    self.next.layer.cornerRadius = 15;
    self.next.uppercaseTitle = NO;
    [self.next addTarget:self action:@selector(verify) forControlEvents:UIControlEventTouchUpInside];
    [self.botView addSubview:self.next];
}

-(void) verify {
//    NSString *name = self.nameField.text;
//    if ([name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
//        self.nameField.text = @"";
//        self.nameField.placeholder = @"*Please enter a name";
//        self.nameInputController.floatingPlaceholderActiveColor = [UIColor redColor];
//        self.nameInputController.floatingPlaceholderNormalColor = [UIColor redColor];
//        self.nameInputController.inlinePlaceholderColor = [UIColor redColor];
//        return;
//    } else {
//        self.nameField.placeholder = @"Name";
//        self.nameInputController.floatingPlaceholderActiveColor = [UIColor whiteColor];
//        self.nameInputController.floatingPlaceholderNormalColor = [UIColor whiteColor];
//        self.nameInputController.inlinePlaceholderColor = [UIColor whiteColor];
//    }
//    NSString *num = self.numField.text;
//    if ([num stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0 || self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
//        if(self->phone) {
//            self.numField.placeholder = @"*Please enter a valid phone number.";
//            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
//            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
//            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
//        } else {
//            self.numField.placeholder = @"*Please enter a valid email.";
//            self.numInputController.floatingPlaceholderActiveColor = [UIColor redColor];
//            self.numInputController.floatingPlaceholderNormalColor = [UIColor redColor];
//            self.numInputController.inlinePlaceholderColor = [UIColor redColor];
//        }
//        return;
//    }
//    if ([self.ageField.text length]==0) {
//        self.ageField.placeholder = @"*Please enter your age.";
//        self.ageInputController.floatingPlaceholderActiveColor = [UIColor redColor];
//        self.ageInputController.floatingPlaceholderNormalColor = [UIColor redColor];
//        self.ageInputController.inlinePlaceholderColor = [UIColor redColor];
//        return;
//    }
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:@"http://swift-api.eba-b7petiuu.us-west-2.elasticbeanstalk.com/api/users"]];
//
//    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];
//    jsonDict[@"name"] = name;
//    jsonDict[@"birthdate"] = self.ageField.text;
//    if (self->phone) jsonDict[@"phone"] = num;
//    else jsonDict[@"email"] = num;
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:nil];
//
//
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody: jsonData];
//
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//        completionHandler:^(NSData * _Nullable data,
//                            NSURLResponse * _Nullable response,
//                            NSError * _Nullable error) {
//            NSLog(@"Yay, done! Check for errors in response!");
//
//            NSHTTPURLResponse *asHTTPResponse = (NSHTTPURLResponse *) response;
//            NSLog(@"The status code: %ld", asHTTPResponse.statusCode);
//            NSDictionary *forJSONObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            if (asHTTPResponse.statusCode == 500){
//                if (self->phone) {
//                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Phone number already in use" preferredStyle:UIAlertControllerStyleAlert];
//                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
//                    [alert addAction:defaultAction];
//                    [self presentViewController:alert animated:YES completion:nil];
//                } else {
//                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"Email address already in use" preferredStyle:UIAlertControllerStyleAlert];
//                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Retry" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
//                    [alert addAction:defaultAction];
//                    [self presentViewController:alert animated:YES completion:nil];
//                }
//            } else {
////                NSCache *cache = [[NSCache alloc] init];
////                [cache setObject:forJSONObject[@"insertId"] forKey:@"userId"];
//////                [cache objectForKey:@"insertId"];
//                NSLog(@"User Id: %@", forJSONObject[@"insertId"]);
                [self pushSetPasswordViewController];
//            }
//        }];
//    [task resume];
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
    [self.view bringSubviewToFront:self.botView];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil]; //this is it!
    self->keyboardHeight = keyboardRect.origin.y;
//    NSLog(@"%f", self->keyboardHeight);
    self.botView.frame = CGRectMake(0, self.view.frame.size.height*0.94-(height-keyboardRect.origin.y), [UIScreen mainScreen].bounds.size.width, self.botView.frame.size.height);
    if ([self.numField isFirstResponder]) {
        self.label.hidden = NO;
        if (self->phone) {
            [self.label setTitle:@"Use email instead" forState:UIControlStateNormal];
            self.numField.keyboardType = UIKeyboardTypePhonePad;
            if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
                self.numField.placeholder = @"*Please enter a valid phone number.";
            } else {
                self.numField.placeholder = @"Phone Number";
            }
        } else {
            [self.label setTitle:@"Use phone instead" forState:UIControlStateNormal];
            self.numField.keyboardType = UIKeyboardTypeDefault;
            if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
                self.numField.placeholder = @"*Please enter a valid email.";
            } else {
                self.numField.placeholder = @"Email";
            }
        }
    } else {
        self.label.hidden = YES;
    }
}

-(void) keyboardWillHide:(NSNotification *)notification {
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.botView.frame = CGRectMake(0, height*0.83, [UIScreen mainScreen].bounds.size.width, self.botView.frame.size.height);
    self.label.hidden = YES;
}

-(void) openDatePicker {
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    NSDate *now = [NSDate date];
    NSDateComponents *minusHundredYears = [NSDateComponents new];
    minusHundredYears.year = -150;
    NSDate *hundredYearsAgo = [[NSCalendar currentCalendar] dateByAddingComponents:minusHundredYears toDate:now options:0];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker setMaximumDate:now];
    [datePicker setMinimumDate:hundredYearsAgo];
    [datePicker addTarget:self action:@selector(dateFieldDidChange:) forControlEvents:UIControlEventValueChanged];
    [datePicker setPreferredDatePickerStyle:UIDatePickerStyleWheels];
    self.ageField.inputView = datePicker;
}


-(void) labelTapped {
    if (self->phone) {
        self.numField.text = @"";
        self->phone =NO;
        [self.label setTitle:@"Use phone instead" forState:UIControlStateNormal];
        self.numField.keyboardType = UIKeyboardTypeDefault;
        [self.numField reloadInputViews];
        if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
            self.numField.placeholder = @"*Please enter a valid email.";
        } else {
            self.numField.placeholder = @"Email";
        }
    } else {
        self.numField.text = @"";
        self->phone = YES;
        [self.label setTitle:@"Use email instead" forState:UIControlStateNormal];
        self.numField.keyboardType = UIKeyboardTypePhonePad;
        [self.numField reloadInputViews];
        if(self.numInputController.floatingPlaceholderNormalColor == [UIColor redColor]) {
            self.numField.placeholder = @"*Please enter a valid phone number.";
        } else {
            self.numField.placeholder = @"Phone Number";
        }
    }
    NSLog(self->phone? @"using phone": @"using email");
}

-(void) pushSetPasswordViewController{
    SetPasswordViewController *pwViewController = [[SetPasswordViewController alloc] init];
    [self.navigationController pushViewController:pwViewController animated:true];
}

@end
