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
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *midSubView = [[UIView alloc] init];
//    CGFloat widthOfView = self.width*0.7;
//    CGFloat heightOfView = self.height*0.5;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat widthOfView = width*0.7;
    CGFloat heightOfView = height*0.5;
    midSubView.frame = CGRectMake((width-widthOfView)*0.5, (height-heightOfView)*0.15, widthOfView, heightOfView);
    midSubView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:midSubView];
    [self configureSubviewLayout];
}

-(void) configureSubviewLayout{
    
}




@end
