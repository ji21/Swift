//
//  SwiftViewController.m
//  swift
//
//  Created by Jeffrey Ip on 17/10/2020.
//  Copyright © 2020 Jefferson. All rights reserved.
//

#import "SwiftViewController.h"

@interface SwiftViewController ()

@end

@implementation SwiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //background color and top nav title
    UIColor *color = [[UIColor alloc]initWithRed:23.0/255.0 green:54.0/255.0 blue:121.0/255.0 alpha:1.0];
    self.view.backgroundColor = color;
    self.navigationItem.title = @"Swift";
    //button from material design
    MDCButton *_signupButton = [[MDCButton alloc] init];
    _signupButton.backgroundColor = [UIColor clearColor];
    [_signupButton setBorderColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signupButton setBorderColor:[UIColor clearColor] forState:UIControlStateHighlighted];
    [_signupButton setBorderWidth:2.0 forState:UIControlStateNormal];
    _signupButton.layer.cornerRadius = 30;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfButton = width*0.7;
    CGFloat heightOfButton = height*0.06;
    _signupButton.frame = CGRectMake((width-widthOfButton)*0.5, (height-heightOfButton)*0.85, widthOfButton, heightOfButton);
    [_signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.view addSubview:_signupButton];
}

@end
