//
//  SwiftViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SwiftViewController.h"
#import "SignupViewController.h"
#import "LoginViewController.h"

@interface SwiftViewController ()


@end


@implementation SwiftViewController

- (void)pushSignupViewController {
    SignupViewController *signupVC = [[SignupViewController alloc] init];
    [self.navigationController pushViewController:signupVC animated:true];
}

- (void)pushLoginViewController {
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:true];
    NSLog(@"abc");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //background color and top nav title
    UIColor *color = [[UIColor alloc]initWithRed:23.0/255.0 green:54.0/255.0 blue:121.0/255.0 alpha:1.0];
    self.view.backgroundColor = color;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    //"div" to contain label and signup button
    UIView *midSubView = [[UIView alloc] init];
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.3;
    midSubView.frame = CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.60, widthOfView, heightOfView);
    

    //label
    UILabel *title = [[UILabel alloc] init];
    [title setText:@"Discover your Soulmates."];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentLeft];
    [title setFont:[UIFont fontWithName:@"AvenirNext-Bold" size:33]];
    [title setNumberOfLines:2];
    CGFloat widthOfTitle = widthOfView;
    CGFloat heightOfTitle = heightOfView*0.8;
    title.frame = CGRectMake(0.0, 0.0, widthOfTitle, heightOfTitle);
    [midSubView addSubview:title];
    
    
    //button from material design
    MDCButton *_signupButton = [[MDCButton alloc] init];
    _signupButton.backgroundColor = [UIColor clearColor];
    [_signupButton setBorderColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signupButton setBorderColor:[UIColor clearColor] forState:UIControlStateHighlighted];
    [_signupButton setBorderWidth:2.0 forState:UIControlStateNormal];
    _signupButton.layer.cornerRadius = 25;
    CGFloat widthOfButton = widthOfView;
    CGFloat heightOfButton = heightOfView*0.23;
    _signupButton.frame = CGRectMake(0, heightOfTitle, widthOfButton, heightOfButton);
    [_signupButton setTitle:@"Create account" forState:UIControlStateNormal];
    _signupButton.uppercaseTitle = NO;
    [_signupButton addTarget:self action:@selector(pushSignupViewController) forControlEvents:UIControlEventTouchUpInside];
    [midSubView addSubview:_signupButton];
    
    //set midSubView
    [self.view addSubview:midSubView];
    
    //bottom subView
    UIView *botSubView = [[UIView alloc] init];
    CGFloat heightOfBotView = height*0.05;
    botSubView.frame = CGRectMake((width-widthOfView)*0.5, (height)*0.90, widthOfView, heightOfBotView);
    botSubView.backgroundColor = [UIColor whiteColor];
    
    UILabel *signin = [[UILabel alloc] init];
    [signin setText:@"FIller Text"];
    signin.frame = CGRectMake(0, 0, widthOfView*0.3, heightOfBotView);
    [botSubView addSubview:signin];
    
    UIButton *signinNav = [[UIButton alloc] init];
    [signinNav setTitle:@"Login" forState:UIControlStateNormal];
    signinNav.frame = CGRectMake(widthOfView*0.3, 0, widthOfView*0.3, heightOfBotView);
    signinNav.tintColor = [UIColor blackColor];
    signinNav.backgroundColor = [UIColor blackColor];
    [signinNav addTarget:self action:@selector(pushLoginViewController) forControlEvents:UIControlEventTouchUpInside];
    [botSubView addSubview:signinNav];
    [self.view addSubview:botSubView];
    
}



@end
