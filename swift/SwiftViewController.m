//
//  SwiftViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SwiftViewController.h"
#import "SignupViewController.h"

@interface SwiftViewController ()


@end


@implementation SwiftViewController

- (void)pushSignupViewController {
    SignupViewController *signupVC = [[SignupViewController alloc] init];
    [self.navigationController pushViewController:signupVC animated:true];
}

//- (void)pushLoginVIewController {
//
//}

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
    CGFloat heightOfView = height*0.2;
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
    _signupButton.layer.cornerRadius = 30;
    CGFloat widthOfButton = widthOfView;
    CGFloat heightOfButton = heightOfView*0.3;
    _signupButton.frame = CGRectMake(0, heightOfTitle, widthOfButton, heightOfButton);
    [_signupButton setTitle:@"Create account" forState:UIControlStateNormal];
    [_signupButton addTarget:self action:@selector(pushSignupViewController) forControlEvents:UIControlEventTouchUpInside];
    [midSubView addSubview:_signupButton];
    
    //set midSubView
    [self.view addSubview:midSubView];
    
    //bottom subView
    UIView *botSubView = [[UIView alloc] init];
    CGFloat widthOfBotView = width*0.7;
    CGFloat heightOfBotView = height*0.1;
    botSubView.frame = CGRectMake((width-widthOfBotView)*0.5, (height-heightOfView)*0.90, widthOfBotView, heightOfBotView);
    
    
    
}


@end
